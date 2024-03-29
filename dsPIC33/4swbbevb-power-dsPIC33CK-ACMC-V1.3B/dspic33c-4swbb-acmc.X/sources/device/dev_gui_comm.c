/**
    (c) 2017 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
 */

/**
 * @file dev_gui_comm.c
 * @author M52409
 * @date 2020-�7-30
 * @brief contains API functions to use the GUI via serial interface
 *
 * there are two standard communication data packages to the GUI:
 * 1.: data stream package: this package contains different single values
 *     that need to be transmitted cyclical like 10 times a second.
 *     for example, temperatires, voltages, statemachine states, bitfields,...
 * 2.: scope data package: this is a block of data that contains one page of scope data
 *     it can contain data from multiple data channels.
 *     example: to record real-time data for a step response of output voltage and current
 */

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "dev_gui_comm.h"
#include "misc/fault_common.h"
//#include "drv_pwrctrl_4SWBB_settings.h"
#include "../app/../driver/power_controller/drv_pwrctrl_4SWBB_settings.h"
#include "../app/../driver/drv_led.h"

//-----------------------------------------------------------
// Configure Datastream function

//-----------------------------------------------------------


#define GUICOMM_RCV_DATABUFFER_SIZE     10
#define GUICOMM_PROTOCOL_ID_DATASTREAM_H  0x00
#define GUICOMM_PROTOCOL_ID_DATASTREAM_L  0x01
#define GUICOMM_PROTOCOL_ID_RCV_COMMANDS_H  0x00
#define GUICOMM_PROTOCOL_ID_RCV_COMMANDS_L  0x02
#define GUICOMM_PROTOCOL_ID_RCV_COMMANDS  0x0002

#define GUICOMM_PROTOCOL_ID_SCOPE_H   0x53
#define GUICOMM_PROTOCOL_ID_SCOPE_L   0x44

#define GUICOMM_PROTOCOL_ID_RCV_SCOPE_COMMAND_H 0x53
#define GUICOMM_PROTOCOL_ID_RCV_SCOPE_COMMAND_L 0x43
#define GUICOMM_PROTOCOL_ID_RCV_SCOPE_COMMAND   0x5343

#define GUICOMM_BEGIN_OF_FRAME	0x55
#define GUICOMM_END_OF_FRAME	0x0d
#define GUICOMM_CRC_POLYNOM		0xA001

//---------------------UART CMD SV SA interface
#define UARTCOMM_BEGIN_OF_FRAME	0x55
#define UARTCOMM_END_OF_FRAME	0x0d
#define UARTCOMM_PROTOCOL_ID    'S'
#define UARTCOMM_PROTOCOL_SetVoltage    'V'
#define UARTCOMM_PROTOCOL_SetCur_lim    'A'
#define UARTCOMM_PROTOCOL_SetCur_const  'C'
#define UARTCOMM_PROTOCOL_switchON_OFF_firstC  'O'
#define UARTCOMM_PROTOCOL_switchON      'N'
#define UARTCOMM_PROTOCOL_switchOFF     'F'

//-----------------------------------------------------------
// Datastream defines and variables
#define DATASTREAM_MODE_WAITING         0
#define DATASTREAM_MODE_RECORDING       1
#define DATASTREAM_MODE_TRANSMIT_DATA   2

uint8_t gui_stream_mode = DATASTREAM_MODE_WAITING;
uint8_t gui_stream_sm_state = 0;
uint16_t gui_stream_waitcounter = 0;
uint16_t gui_stream_length;
uint16_t gui_stream_data[DATASTREAM_NUM_OF_VALUES];

uint8_t streamData_enable = 1;

typedef struct {
    uint16_t protocol_ID;
    GuiComm_CommandHandlerFunc func;
} rcvCommandHandler_t;

rcvCommandHandler_t rcvCommandHandler;

//-----------------------------------------------------------


//-----------------------------------------------------------
// Scope defines and variables
#define SCOPE_MODE_WAITING          0
#define SCOPE_MODE_RECORDING        1
#define SCOPE_MODE_TRANSMIT_DATA    2

uint8_t gui_scope_mode = SCOPE_MODE_WAITING;
uint8_t gui_scope_sm_state = 0;
uint16_t gui_scope_index;
uint16_t gui_scope_data[SCOPE_NUM_OF_CHANNELS * SCOPE_NUM_OF_SAMPLES];
//-----------------------------------------------------------
uint8_t gui_header[20];
uint16_t gui_transfer_index = 0;
bool transfer_highbyte = true;

uint8_t rcv_data_buffer[GUICOMM_RCV_DATABUFFER_SIZE];
uint8_t tmp_var[8];
uint16_t dataCRC;
extern float Current_lim_set;
extern float Constant_Current_set ;
extern float Vout_set;
extern FAULT_OBJ_T fltobj_4SWBB_IoutOC;
extern uint8_t CC_control_mode_EN;
//void Dev_Gui_Comm_SendDataByte(uint8_t data);
//void Dev_Gui_Comm_SendDataWord(uint16_t data);

void GuiComm_Scope_TransmitData(void);
void GuiComm_DataStream_TransmitData(void);

void GuiComm_Rcv_Task(void);
void GuiComm_Scope_Protocol_Rcv(uint16_t len, uint8_t* data); //added by zell to fit XC2.1 version

/**
 * \brief Function to register a receive function for a certain protocol id
 * @param rcvCmdFunc pointer to the receive function
 * @param cmdID protocol id of the data packet that will be handled by this function
 */
void Dev_GuiComm_Register_ProtocolHandler(GuiComm_CommandHandlerFunc rcvCmdFunc, uint16_t cmdID) {
    rcvCommandHandler.protocol_ID = cmdID;
    rcvCommandHandler.func = rcvCmdFunc;
}

/**
 * \brief Init function to initialze this protocol layer. Needs to be called before using other functions
 */
void Dev_GuiComm_Init(void) {
    rcvCommandHandler.protocol_ID = 0;
    rcvCommandHandler.func = NULL;
}

/**
 * \brief Task function that needs to be called every 100�s to be able to handle 115 kbaud
 */
void Dev_GuiComm_Task_100us(void) {
    GuiComm_Rcv_Task();
    if (gui_scope_mode == SCOPE_MODE_TRANSMIT_DATA) {
        GuiComm_Scope_TransmitData();
    } else if (gui_stream_mode == DATASTREAM_MODE_TRANSMIT_DATA) {
        GuiComm_DataStream_TransmitData();
    }

    if (gui_stream_mode == DATASTREAM_MODE_WAITING) {
        if (gui_stream_waitcounter < DATASTREAM_WAITTICKS) {
            gui_stream_waitcounter++;
        } else {
            gui_stream_waitcounter = 0;
            gui_stream_length = 0;
            gui_stream_mode = DATASTREAM_MODE_RECORDING;
        }
    }
}

/**
 * \brief Function that needs to be called before starting the sending of a gui data block
 * @return true, if send data function can be called
 */
bool Dev_GuiComm_Stream_ReadyToSend(void) {
    if (gui_stream_mode == DATASTREAM_MODE_RECORDING)
        return true;
    else
        return false;
}

/**
 * \brief Function to be called after sending the last gui data word.
 */
void Dev_GuiComm_Stream_FinishSending(void) {
    if (gui_stream_mode == DATASTREAM_MODE_RECORDING)
        gui_stream_mode = DATASTREAM_MODE_TRANSMIT_DATA;
}

/**
 * \brief Internal function to start the scope data transmission
 */
void GuiComm_Scope_StartTransmit(void) {
    gui_scope_sm_state = 0;
    gui_scope_mode = SCOPE_MODE_TRANSMIT_DATA;
}

/**
 * \brief Internal function that contains the state machine to transmit scope data to the gui
 */
void GuiComm_Scope_TransmitData(void) {
    switch (gui_scope_sm_state) {
        case 0: //prepare header
            gui_header[0] = GUICOMM_BEGIN_OF_FRAME;
            gui_header[1] = GUICOMM_PROTOCOL_ID_SCOPE_H;
            gui_header[2] = GUICOMM_PROTOCOL_ID_SCOPE_L;
            uint16_t length = 8 + (SCOPE_NUM_OF_CHANNELS * SCOPE_NUM_OF_SAMPLES * 2);
            gui_header[3] = length >> 8;
            gui_header[4] = length & 0xff;

            gui_header[5] = 3; //time base 3..us
            gui_header[6] = 0; //time base 100us H
            gui_header[7] = 100; //time base 100us L
            gui_header[8] = 2; //number of channels
            gui_header[9] = 0; //channel info index - Vout
            gui_header[10] = 1; //number info index - Iout
            gui_header[11] = (SCOPE_NUM_OF_SAMPLES) >> 8; //number of sample per channel H
            gui_header[12] = (SCOPE_NUM_OF_SAMPLES) & 0xff; //number of sample per channel L
            gui_transfer_index = 0;
            gui_scope_sm_state = 1;
            break;

        case 1: //transfer header
            while (GuiComm_ReadyToSend()) {
                GuiComm_Write(gui_header[gui_transfer_index]);
                gui_transfer_index++;
                if (gui_transfer_index > 12) {
                    gui_transfer_index = 0;
                    transfer_highbyte = true;
                    gui_scope_sm_state = 2;
                    break;
                }
            }
            break;

        case 2: //transfer data
            while (GuiComm_ReadyToSend()) {
                //uint8_t* data = (uint8_t*)&scope_record_data;
                if (transfer_highbyte) {
                    GuiComm_Write(gui_scope_data[gui_transfer_index] >> 8);
                    transfer_highbyte = false;
                } else {
                    GuiComm_Write(gui_scope_data[gui_transfer_index] & 0xff);
                    transfer_highbyte = true;
                    gui_transfer_index++;
                }
                //GuiComm_Write(data[gui_transfer_index]);
                //gui_transfer_index++;
                if (gui_transfer_index >= SCOPE_NUM_OF_CHANNELS * SCOPE_NUM_OF_SAMPLES) {
                    gui_scope_sm_state = 3;
                    gui_transfer_index = 3;
                    break;
                }
            }
            break;

        case 3: //transfer data
            gui_header[0] = 0; //no crc
            gui_header[1] = 0; //no crc
            gui_header[2] = GUICOMM_END_OF_FRAME;
            gui_transfer_index = 0;
            gui_scope_sm_state = 4;
            break;

        case 4: //transfer header
            while (GuiComm_ReadyToSend()) {
                GuiComm_Write(gui_header[gui_transfer_index]);
                gui_transfer_index++;
                if (gui_transfer_index >= 3) {
                    gui_scope_sm_state = 0;
                    gui_transfer_index = 0;
                    gui_scope_mode = SCOPE_MODE_WAITING;
                    break;
                }
            }
            break;
    }
}

/**
 * \brief Internal function that contains the state machine to transmit the gui data
 */
void GuiComm_DataStream_TransmitData(void) {
    static uint16_t MsCounter_ = 0; //@ftx
    switch (gui_stream_sm_state) {
        case 0: //prepare header
            gui_header[0] = GUICOMM_BEGIN_OF_FRAME;
            gui_header[1] = GUICOMM_PROTOCOL_ID_DATASTREAM_H;
            gui_header[2] = GUICOMM_PROTOCOL_ID_DATASTREAM_L;
            uint16_t length = gui_stream_length * 2;
            gui_header[3] = length >> 8;
            gui_header[4] = length & 0xff;

            gui_transfer_index = 0;
            gui_stream_sm_state = 1;
            break;

        case 1: //transfer header
            while (GuiComm_ReadyToSend()&& (MsCounter_++ > 1)) //@ftx
            {
                GuiComm_Write(gui_header[gui_transfer_index]);
                gui_transfer_index++;
                if (gui_transfer_index > 4) {
                    gui_transfer_index = 0;
                    transfer_highbyte = true;
                    gui_stream_sm_state = 2;
                    break;
                }
                MsCounter_ = 0; //@ftx
            }
            break;

        case 2: //transfer data
            while (GuiComm_ReadyToSend() && (MsCounter_++ > 1)) //@ftx
            {
                if (transfer_highbyte) {
                    GuiComm_Write(gui_stream_data[gui_transfer_index] >> 8);
                    transfer_highbyte = false;
                } else {
                    GuiComm_Write(gui_stream_data[gui_transfer_index] & 0xff);
                    transfer_highbyte = true;
                    gui_transfer_index++;
                }
                if (gui_transfer_index >= gui_stream_length) {
                    gui_stream_sm_state = 3;
                    gui_transfer_index = 0;
                    break;
                }

                MsCounter_ = 0; //@ftx
            }
            break;

        case 3: //transfer end header
            gui_header[0] = 0; //no crc
            gui_header[1] = 0; //no crc
            gui_header[2] = GUICOMM_END_OF_FRAME;
            gui_transfer_index = 0;
            gui_stream_sm_state = 4;
            break;

        case 4: //transfer header
            while (GuiComm_ReadyToSend() && (MsCounter_++ > 1)) //@ftx
            {
                GuiComm_Write(gui_header[gui_transfer_index]);
                gui_transfer_index++;
                if (gui_transfer_index >= 3) {
                    gui_stream_sm_state = 0;
                    gui_transfer_index = 0;
                    gui_stream_mode = DATASTREAM_MODE_WAITING;
                    break;
                }
                MsCounter_ = 0; //@ftx
            }
            break;
    }
}

/**
 * \brief Function to send data words to the GUI. The function Dev_GuiComm_Stream_ReadyToSend needs to be called first
 * @param data word that need to sent to the gui
 */
void Dev_GuiComm_Stream_SendWord(uint16_t data) {
    if (gui_stream_length < (DATASTREAM_NUM_OF_VALUES)) {
        //        datastream_data[gui_stream_length++] = data >> 8;
        //        datastream_data[gui_stream_length++] = data & 0xff8;
        gui_stream_data[gui_stream_length++] = data;
    }
}

/**
 * \brief Function to record one scope sample for two channels. This function is getting activated by
 * the function Dev_GuiComm_Scope_TriggerNow and gets deactivated automatically when the buffer is full
 * @param dataCh1 sample of channel 1
 * @param dataCh2 sample of channel 2
 */
void Dev_GuiComm_Scope_Record_2CH(uint16_t dataCh1, uint16_t dataCh2) {
    if (gui_scope_mode == SCOPE_MODE_RECORDING) {
        gui_scope_data[gui_scope_index++] = dataCh1;
        gui_scope_data[gui_scope_index++] = dataCh2;
        if (gui_scope_index >= SCOPE_NUM_OF_CHANNELS * SCOPE_NUM_OF_SAMPLES) {
            gui_scope_index = 0;
            gui_scope_mode = SCOPE_MODE_TRANSMIT_DATA;
        }
    }
}

/**
 * \brief Function to trigger the recording of one scope page
 */
void Dev_GuiComm_Scope_TriggerNow(void) {
    if (gui_scope_mode == SCOPE_MODE_WAITING) {
        gui_scope_index = 0;
        gui_scope_mode = SCOPE_MODE_RECORDING;
    }
}

#define SCOPE_COMMAND_TRIGGER_NOW   0x01

/**
 * \brief Internal function to receive scope commands from the gui.
 * So far only the trigger-now function is supported
 * @param len
 * @param data
 */
inline void GuiComm_Scope_Protocol_Rcv(uint16_t len, uint8_t* data) {
    if (len > 0) {
        uint8_t cmd = data[0];
        if (cmd == SCOPE_COMMAND_TRIGGER_NOW) {
            Dev_GuiComm_Scope_TriggerNow();
        }
    }
}

#define RCV_WAIT_FOR_STARTBYTE		0
#define RCV_READ_ID_HIGHBYTE		1
#define RCV_READ_ID_LOWBYTE			2
#define RCV_READ_LENGTH_HIGHBYTE	3
#define RCV_READ_LENGTH_LOWBYTE		4
#define RCV_READ_DATA				5
#define RCV_READ_CRC_HIGHBYTE		6
#define RCV_READ_CRC_LOWBYTE		7
#define RRC_READ_EOF				8


#define RCV_TIMEOUT 10000

/**
 * \brief Internal function that contains the statemachine to receive data from the gui
 */
void GuiComm_Rcv_Task(void) {
    static uint8_t rcv_state = 0;
    static uint16_t rcv_protocol_id = 0;
    static uint16_t rcv_data_length = 0;
    static uint16_t rcv_data_index = 0;
    static uint16_t rcv_CRC_calculated = 0;
    static uint16_t rcv_CRC = 0;
    static uint16_t rcv_timeout = 0;
    uint8_t data;

    while (1) {
        if (GuiComm_IsRxReady() == false) {
            if (++rcv_timeout >= 10000) {
                rcv_timeout = 0;
                rcv_state = RCV_WAIT_FOR_STARTBYTE;
            }
            break;
        }
        // ok, we have some data coming in, lets read and process
        rcv_timeout = 0;
        data = GuiComm_Read();
        switch (rcv_state) {
            case RCV_WAIT_FOR_STARTBYTE:
                rcv_CRC_calculated = 0;
                if (data == GUICOMM_BEGIN_OF_FRAME)
                    rcv_state = RCV_READ_ID_HIGHBYTE;
                break;

            case RCV_READ_ID_HIGHBYTE:
                rcv_protocol_id = data << 8;
                rcv_state = RCV_READ_ID_LOWBYTE;
                break;

            case RCV_READ_ID_LOWBYTE:
                rcv_protocol_id |= data;
                rcv_state = RCV_READ_LENGTH_HIGHBYTE;
                break;

            case RCV_READ_LENGTH_HIGHBYTE:
                rcv_data_length = data << 8;
                rcv_state = RCV_READ_LENGTH_LOWBYTE;
                break;

            case RCV_READ_LENGTH_LOWBYTE:
                rcv_data_length |= data;
                rcv_data_index = 0;
                rcv_state = RCV_READ_DATA;
                break;

                // data payload process:
            case RCV_READ_DATA:
                if (rcv_data_index < GUICOMM_RCV_DATABUFFER_SIZE) {
                    rcv_data_buffer[rcv_data_index] = data;
                    // todo: update calculated crc if needed (not implemented yet)
                }
                rcv_data_index++;
                if (rcv_data_index >= rcv_data_length) //are we finished receiving data???
                {
                    rcv_state = RCV_READ_CRC_HIGHBYTE;
                }
                break;

            case RCV_READ_CRC_HIGHBYTE:
                rcv_CRC = data << 8;
                rcv_state = RCV_READ_CRC_LOWBYTE;
                break;

            case RCV_READ_CRC_LOWBYTE:
                rcv_CRC |= data;
                rcv_data_index = 0;
                rcv_state = RRC_READ_EOF;
                break;

            case RRC_READ_EOF:
                if (data == 0x0d) {
                    // do we have to check the CRC first?
                    if ((rcv_protocol_id == rcvCommandHandler.protocol_ID) &&
                            (rcvCommandHandler.func != NULL))
                        rcvCommandHandler.func(rcv_data_length, rcv_data_buffer); //App_GUI_ProtocolHandler
                    else if (rcv_protocol_id == GUICOMM_PROTOCOL_ID_RCV_SCOPE_COMMAND)
                        GuiComm_Scope_Protocol_Rcv(rcv_data_length, rcv_data_buffer);
                }
                rcv_protocol_id = 0;
                rcv_data_length = 0;
                rcv_data_index = 0;
                rcv_CRC_calculated = 0;
                rcv_CRC = 0;
                rcv_state = RCV_WAIT_FOR_STARTBYTE;
                break;
        }
    }
}

#define RCV_READ_ID_SASV		1
#define RCV_SET_SV		2
#define RCV_SET_SA		3
#define RCV_SET_SC      4
//#define RCV_SET_SC_EN   44 
#define RCV_SET_EQO		5
#define CMD_SV_EOF		8
#define CMD_SA_EOF		9
#define CMD_SC_EOF	    10
#define CMD_CC_EN_EOF	11
#define CMD_CL_EN_EOF	12
#define CMD_Output_ON_OFF_CHK	20
#define CMD_Output_ON_EOF	21
#define CMD_Output_OFF_EOF	22

//#define UARTCOMM_PROTOCOL_ID    'S'
#define UARTCOMM_PROTOCOL_SetVoltage_EOF    'V'
#define UARTCOMM_PROTOCOL_SetCur_lim_EOF    'A'
#define UARTCOMM_PROTOCOL_SetCC_EN_EOF      'C'
#define UARTCOMM_PROTOCOL_SetCL_EN_EOF      'L'

//by zell
// function to parse uart SV12.000V. SA01.500A. SC01.000A.  SON. SOFF functions
extern uint8_t flag;
extern bool App_HMI_useRefFromPoti;
extern bool App_HMI_useRefFromGUI;
extern bool App_HMI_useFixedRef;

void UARTComm_Rcv_Task(void) {
    static uint8_t rcv_state = 0;
    static uint16_t rcv_protocol_id = 0;
    static uint16_t rcv_data_length = 0;
    static uint16_t rcv_data_index = 0;
    //static uint16_t rcv_CRC_calculated = 0;
    //static uint16_t rcv_CRC = 0;
    static uint16_t rcv_timeout = 0;
    static uint16_t vol_var_raw = 0;
    static uint16_t cur_var_raw = 0;
    static uint16_t cur_var_raw_hys = 0;
    //static uint8_t Voltage_int = 0;
    static double Voltage_double = 0;
    static float Voltage_float = 0;
    static float Current_float_lim = 0;
    uint8_t data;
    uint8_t *tmp_frac; //issues here
    float Vol_frac = 0;
    float Cur_frac = 0;
    // memset(tmp_var, 0, sizeof (tmp_var));  //caused empty rec buf issue
    // rcv_data_index = 0;

    while (1) {
        if (GuiComm_IsRxReady() == false) {
            if (++rcv_timeout >= 10000) {
                rcv_timeout = 0;
                rcv_state = RCV_WAIT_FOR_STARTBYTE;
            }
            break;
        }
        // ok, we have some data coming in, lets read and process
        rcv_timeout = 0;
        data = GuiComm_Read();
        switch (rcv_state) {
            case RCV_WAIT_FOR_STARTBYTE:
                //rcv_CRC_calculated = 0;
                if (data == UARTCOMM_PROTOCOL_ID)
                    rcv_state = RCV_READ_ID_SASV;
                flag = 1;
                break;

            case RCV_READ_ID_SASV:
                rcv_protocol_id = data;
                if (rcv_protocol_id == UARTCOMM_PROTOCOL_SetVoltage) {
                    rcv_state = RCV_SET_SV;
                    rcv_data_index = 0;
                    flag = 2;
                } else if (rcv_protocol_id == UARTCOMM_PROTOCOL_SetCur_lim) {
                    rcv_state = RCV_SET_SA;
                    rcv_data_index = 0;
                    flag = 3;
                } else if (rcv_protocol_id == UARTCOMM_PROTOCOL_SetCur_const) {
                    rcv_state = RCV_SET_SC;
                    rcv_data_index = 0;
                    flag = 4;
                }
                else if (rcv_protocol_id == UARTCOMM_PROTOCOL_switchON_OFF_firstC) {
                    rcv_state = CMD_Output_ON_OFF_CHK;
                    rcv_data_index = 0;
                    flag = 5;
                }
                break;
                
             case CMD_Output_ON_OFF_CHK:

                flag = 5;
                rcv_protocol_id = data;

                if (rcv_data_index < 2) {
                    flag = 6;

                    tmp_var[rcv_data_index] = data;

                    rcv_data_index++;
                }
                if (rcv_data_index >= 2) //are we  receiving error data???
                {
                    //should not come here, only if wrong CMD codes
                    printf("#>:Something wrong! \r\n");
                memset(tmp_var, 0, sizeof (tmp_var));
                rcv_protocol_id = 0;
                rcv_data_index = 0;
                rcv_state = RCV_WAIT_FOR_STARTBYTE;
                }
                if (rcv_protocol_id == UARTCOMM_PROTOCOL_switchON){
                  //turn on  
                     rcv_state = CMD_Output_ON_EOF;
                    
                 }
                else if (rcv_protocol_id == UARTCOMM_PROTOCOL_switchOFF){
                  //turn off  
                    rcv_state = CMD_Output_OFF_EOF;
                 }
                
                break;    
                
            case CMD_Output_ON_EOF:

                flag = 6;
                //rcv_protocol_id = data;
                tmp_var[rcv_data_index] = data;
                printf("CMD char:%c%s \r\n", UARTCOMM_PROTOCOL_switchON_OFF_firstC,tmp_var);
                memset(tmp_var, 0, sizeof (tmp_var));
                rcv_protocol_id = 0;
                rcv_data_index = 0;
                rcv_state = RCV_WAIT_FOR_STARTBYTE;
                
                printf("#>:Output Turn ON! \r\n");
                Drv_PwrCtrl_4SWBB_Start();
                Drv_LED_On(LED_BOARD_GREEN);
                
                break;    
                
            case CMD_Output_OFF_EOF:

                flag = 6;
                rcv_protocol_id = data;
                if (rcv_protocol_id == UARTCOMM_PROTOCOL_switchOFF){
                    printf("CMD char:%c%s \r\n", UARTCOMM_PROTOCOL_switchON_OFF_firstC,tmp_var);
                    printf("#>:Output Turn OFF! \r\n");
                    Drv_PwrCtrl_4SWBB_Stop();
                    Drv_LED_Off(LED_BOARD_GREEN);
                }
                
                memset(tmp_var, 0, sizeof (tmp_var));
                rcv_protocol_id = 0;
                rcv_data_index = 0;
                rcv_state = RCV_WAIT_FOR_STARTBYTE;
                

                
                break;    

                // data payload process for setting voltage:
            case RCV_SET_SV:

                flag = 5;

                if (rcv_data_index < 6) {
                    flag = 6;

                    tmp_var[rcv_data_index] = data;

                    rcv_data_index++;
                }
                if (rcv_data_index >= 6) //are we  receiving error data???
                {
                    //rcv_state = RCV_WAIT_FOR_STARTBYTE;
                    //memset(tmp_var, 0, sizeof (tmp_var));
                    //rcv_data_index = 0;
                    flag = 8;
                    if (data == UARTCOMM_PROTOCOL_SetVoltage_EOF)//need ending char for uart cmds
                        rcv_state = CMD_SV_EOF;
                }

                break;

                // data payload process for setting current limit:
            case RCV_SET_SA:

                flag = 5;

                if (rcv_data_index < 6) {
                    flag = 6;

                    tmp_var[rcv_data_index] = data;

                    rcv_data_index++;
                }
                if (rcv_data_index >= 6) //are we  receiving error data???
                {
                    //rcv_state = RCV_WAIT_FOR_STARTBYTE;
                    //memset(tmp_var, 0, sizeof (tmp_var));
                    //rcv_data_index = 0;
                    flag = 8;
                    if (data == UARTCOMM_PROTOCOL_SetCur_lim_EOF)//need ending char for uart cmds
                        rcv_state = CMD_SA_EOF;
                }

                break;
                // data payload process for setting constant current value:
            case RCV_SET_SC:

                flag = 5;
                if (UARTCOMM_PROTOCOL_SetCC_EN_EOF==data){
                    rcv_state = CMD_CC_EN_EOF;
                }
                if (UARTCOMM_PROTOCOL_SetCL_EN_EOF==data){
                    rcv_state = CMD_CL_EN_EOF;
                }
                if (rcv_data_index < 6) {
                    flag = 6;
                    tmp_var[rcv_data_index] = data;
                    rcv_data_index++;
                }
                if (rcv_data_index >= 6) //are we  receiving error data???
                {
                    flag = 8;
                    if (data == UARTCOMM_PROTOCOL_SetCur_lim_EOF)//need ending char for uart cmds
                        rcv_state = CMD_SC_EOF;
                }

                break;
                
             case CMD_CC_EN_EOF: 
                printf("CMD char:%s \r\n", tmp_var);
                printf("#>:Constant Current mode enabled! \r\n");
                CC_control_mode_EN =1; 
                memset(tmp_var, 0, sizeof (tmp_var));
                rcv_protocol_id = 0;
                rcv_data_index = 0;
                rcv_state = RCV_WAIT_FOR_STARTBYTE;
                //flag = 9;
                break;
                
            case CMD_CL_EN_EOF: 
                printf("CMD char:%s \r\n", tmp_var);
                printf("#>:Constant Current mode disabled! Only Current Limit is active!\r\n");
                CC_control_mode_EN =0; 
                memset(tmp_var, 0, sizeof (tmp_var));
                rcv_protocol_id = 0;
                rcv_data_index = 0;
                rcv_state = RCV_WAIT_FOR_STARTBYTE;
                //flag = 9;
                break;

                //process SA CMD to internal paras
            case CMD_SA_EOF:
                //seems working!
                //char:2.623A CL=2.023 A  cur_var_raw=3052  bug found 2024.1.27
                //tmp_var[0]='9';
                // tmp_var[1]='.';
                // tmp_var[2]='5';wom
                printf("char:%s ", tmp_var); //ok
                //printf("  idx:%d \r\n", rcv_data_index);
                //Voltage_float = atof(tmp_var); //not working
                Current_float_lim = atoi(tmp_var); //working
                if (tmp_var[2]=='.')  //SA01.100A
                    tmp_frac = &tmp_var[3];
                else if (tmp_var[1]=='.') //SA1.100A
                    tmp_frac = &tmp_var[2];
                
                // printf(" atoi_2=%d\r\n",  atoi ( tmp_frac)); //working
                Cur_frac = atoi(tmp_frac);
                Current_float_lim = Current_float_lim + Cur_frac / 1000.0;
                Current_lim_set = Current_float_lim;
                //vol_var_raw = atoi ( tmp_var);
                printf("CL=%2.3f A\r\n", Current_float_lim); //??
                //#define IOUT_OC_FLOAT           (float)((((0.4*2.2)+1.65)*4096)/3.3) //2.2A or 3A
                //#define IOUT_OC_FLOAT           (float)((((0.4*3)+1.65)*4096)/3.3) //3A
                Current_float_lim = (float) ((((0.4 * Current_float_lim) + 1.65)*4096) / 3.3); //20 mili Ohm gain 20 

                cur_var_raw = (uint16_t) Current_float_lim;
                printf("cur_var_raw=%d\r\n", cur_var_raw);

                if (cur_var_raw > 4095) //>20V limit
                    cur_var_raw = 4095;
                if (cur_var_raw > 2097) //check if valid input data, >100mA
                {
                    cur_var_raw_hys = cur_var_raw - 250; // 0.5A smaller
                    //Drv_PwrCtrl_4SWBB_SetReferenceRaw(vol_var_raw); // raw adc vaule
                    // set fltobj_4SWBB_IoutOC
                    FAULT_Init(&fltobj_4SWBB_IoutOC, cur_var_raw, cur_var_raw_hys, IOUT_OC_THRESHOLD_CNT, IOUT_OC_HYS_CNT);
                    //    FAULT_Init(&fltobj_4SWBB_IoutOC, IOUT_OC_THRESHOLD, IOUT_OC_HYS_LIMIT, IOUT_OC_THRESHOLD_CNT, IOUT_OC_HYS_CNT );
                    App_HMI_useRefFromPoti = false;
                    App_HMI_useRefFromGUI = true;
                    App_HMI_useFixedRef = false;
                }

                memset(tmp_var, 0, sizeof (tmp_var));
                rcv_protocol_id = 0;
                rcv_data_index = 0;
                rcv_state = RCV_WAIT_FOR_STARTBYTE;
                //flag = 9;
                break;

            case CMD_SV_EOF:
                //seems working!
                //tmp_var[0]='9';
                // tmp_var[1]='.';
                // tmp_var[2]='5';
                printf("char:%s ", tmp_var);
                //printf("  idx:%d \r\n", rcv_data_index);
                //Voltage_float = atof(tmp_var); //not working
                Voltage_float = atoi(tmp_var); //working
                if (tmp_var[2]=='.')  //SV11.100V
                    tmp_frac = &tmp_var[3];
                else if (tmp_var[1]=='.') //SV4.100V
                    tmp_frac = &tmp_var[2];
                // printf(" atoi_2=%d\r\n",  atoi ( tmp_frac)); //working
                Vol_frac = atoi(tmp_frac);
                Voltage_float = Voltage_float + Vol_frac / 1000.0;
                Vout_set = Voltage_float;
                //vol_var_raw = atoi ( tmp_var);
                printf("VF=%2.3f V\r\n", Voltage_float); //??
                // printf(" atoi=%d\r\n", vol_var_raw); //working
                // Voltage_float = atof('9.8'); // not working
                // Voltage_float = atoi('8'); // not working
                // Voltage_float = 12.6; //working
                // printf("VF_fix=%f", Voltage_float);
                Voltage_float = (4096 * Voltage_float / 8.0 / 3.3);
                //Voltage_float = (4096 * 13.5 / 8.0 / 3.3); //works
                vol_var_raw = (uint16_t) Voltage_float;
                printf("vol_var_raw=%d\r\n", vol_var_raw);
                // vol_var_raw = 1986; //test for 12.8V Vout
                //Drv_PwrCtrl_4SWBB_SetReferenceRaw
                if (vol_var_raw > 3200) //>20V limit
                    vol_var_raw = 3100;
                if (vol_var_raw > 100) //check if valid input data
                {
                    Drv_PwrCtrl_4SWBB_SetReferenceRaw(vol_var_raw); // raw adc vaule
                    App_HMI_useRefFromPoti = false;
                    App_HMI_useRefFromGUI = true;
                    App_HMI_useFixedRef = false;
                }

                memset(tmp_var, 0, sizeof (tmp_var));
                rcv_protocol_id = 0;
                rcv_data_index = 0;
                rcv_state = RCV_WAIT_FOR_STARTBYTE;
                //flag = 9;
                break;
            case CMD_SC_EOF:
                printf("char:%s ", tmp_var);
                Current_float_lim = atoi(tmp_var); //working
                if (tmp_var[2]=='.')  //SC01.100A
                    tmp_frac = &tmp_var[3];
                else if (tmp_var[1]=='.') //SC1.100A
                    tmp_frac = &tmp_var[2];
                // printf(" atoi_2=%d\r\n",  atoi ( tmp_frac)); //working
                Cur_frac = atoi(tmp_frac);
                Current_float_lim = Current_float_lim + Cur_frac / 1000.0;
                Constant_Current_set = Current_float_lim;
                printf("CC=%2.3f A\r\n", Constant_Current_set); //??
                //#define IOUT_OC_FLOAT           (float)((((0.4*2.2)+1.65)*4096)/3.3) //2.2A or 3A
                //#define IOUT_OC_FLOAT           (float)((((0.4*3)+1.65)*4096)/3.3) //3A
                //if current limit small than CC, increase  Current_float_lim para 
                if (Current_float_lim < Constant_Current_set){
                    Current_float_lim = (float) ((((0.4 * (Constant_Current_set+0.1)) + 1.65)*4096) / 3.3); //100mA larger
                   
                    cur_var_raw = (uint16_t) Current_float_lim;
                    printf("cur_var_raw=%d\r\n", cur_var_raw);

                    if (cur_var_raw > 4095) //>20V limit
                        cur_var_raw = 4095;
                    if (cur_var_raw > 2097) //check if valid input data, >100mA
                    {
                        cur_var_raw_hys = cur_var_raw - 250; // 0.5A smaller
                        FAULT_Init(&fltobj_4SWBB_IoutOC, cur_var_raw, cur_var_raw_hys, IOUT_OC_THRESHOLD_CNT, IOUT_OC_HYS_CNT);
                        //    FAULT_Init(&fltobj_4SWBB_IoutOC, IOUT_OC_THRESHOLD, IOUT_OC_HYS_LIMIT, IOUT_OC_THRESHOLD_CNT, IOUT_OC_HYS_CNT );
                        App_HMI_useRefFromPoti = false;
                        App_HMI_useRefFromGUI = true;
                        App_HMI_useFixedRef = false;
                    }
                }

                memset(tmp_var, 0, sizeof (tmp_var));
                rcv_protocol_id = 0;
                rcv_data_index = 0;
                rcv_state = RCV_WAIT_FOR_STARTBYTE;
                CC_control_mode_EN =1;
                //flag = 9;
                break;
        }
    }

}
