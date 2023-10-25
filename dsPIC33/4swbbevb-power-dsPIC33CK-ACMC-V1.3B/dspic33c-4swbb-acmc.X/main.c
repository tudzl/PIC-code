/**
  Generated main.c file from MPLAB Code Configurator

  @Company
    Microchip Technology Inc.

  @File Name
    main.c

  @Summary
    This is the generated main.c using PIC24 / dsPIC33 / PIC32MM MCUs.

  @Description
    This source file provides main entry point for system initialization and application code development.
    Generation Information :
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.167.0
        Device            :  dsPIC33CK256MP506
    The generated drivers are tested against the following:
        Compiler          :  XC16 v1.70
        MPLAB 	          :  MPLAB X v5.45
*/

/*
    (c) 2021 Microchip Technology Inc. and its subsidiaries. You may use this
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
  Section: Included Files
*/
#include "mcc_generated_files/system.h"
#include "mcc_generated_files/pwm.h"
#include "os/os.h"
#include "mcc_generated_files/system.h"
#include "driver/power_controller/drv_pwrctrl_4SWBB.h"
#include "driver/power_controller/drv_pwrctrl_4SWBB_settings.h"
#include "device/dev_button.h"
#include "device/dev_gui_comm.h"
#include "app/app_HMI.h"
#include "app/app_GUI.h"
#include "driver/drv_led.h"
/*
                         Main application
 * Found issue semms can not output stable voltage lower than 5V, changed VOUT_PREBIAS @ 2V to test!
 * Version 1.6B added ON OFF CMD control
 * Version 1.6 fixed minor bugs, improved CMD interface logic, added set CC CL CMD mode,CC loop running  in 10ms loops very fast to convergence
 * Version 1.5B Added true CC mode in addtion to original OC protection function need test and improve, 100ms loops
 * Version 1.5 Added ADC 4x filtering for Vout and Iout, Iin and CC mode, need test and improve
 * Version 1.4B try to add set current limit function, works!
 * Version 1.4 added Iin calc based on 3.3K 470R 47R real values, seems more accurate then original 447mV + 470mv !!! need  nF cap for TP132
 * issue Iin seems smaller than real value? e.g. Iin larger than 0.5A, while 447mV + 470mv/A
 * Version 1.3B fixed XC16 2.1 compiling issue, change max min buck boost DC to 0.95-0.05
 * Version 1.3 added UART CMD  mode  to set output voltage, test OK, but atof not working "SV15.123V."
 * Version 1.2 added short press btn > 10 to disable data stream output to  make printf usable, test OK
 * Version 1.1 added very long press Btn to change diff Vout, test OK
 * Author? modified by zell
 * changed Vin OVP from18V to 20V
 *  * BaudRate = 115200
 * PWM 350K
 *  * User Btn long press <1200ms to switch between open loop and closed loop
 *  * short press to start/off 
 *  * Very long press <2S to switch diff Vout defined at "driver/power_controller/drv_pwrctrl_4SWBB_settings.h"
 * 
 *  app_HMI.c set def Vout Drv_PwrCtrl_4SWBB_SetReferenceRaw(VREF_FIXED12V); //12V
 *  CMP1: RC1 <--I in
 *  CMP2: RC2 <--V in  def DAC_OUT
 *  CMP3: RB7 <--Vout
 *    pwr_ctrl_adc_data.drv_adc_val_FB_Iin =  ADCBUF0;  //ADC0
 *    pwr_ctrl_adc_data.drv_adc_val_FB_Vout = ADCBUF1;  //AADC1
 * CMD:SV14.111V.  SV12.000V. SA04.111A.  SA01.100A.   SA02.001A.  SC01.000A.
 * CMD:SCC,  SCL
 */
//copyed from drv_pwrctrl_4SWBB_settings.h"
//#define VREF_FIXED14P6V_FLOAT (float)((4096/8/3.3)*14.6)   //12V, Res Voltage divider 1:8
//#define VREF_FIXED14P6V       (uint16_t) VREF_FIXED14P6V_FLOAT
uint8_t UART_CMD_MD =1;  //1@UART CMD mode instead of factory default GUI Comm mode
uint8_t Closed_loop_def_EN =1;  // switch to closed loop after ramp up as default
uint8_t CC_control_mode_EN =1; 
uint16_t Vout_tmp_raw = 0;
uint16_t Vout_ref_raw_shadow = 0;
double V_output = 0;
double I_output = 0;
float P_output = 0;
double V_input = 0;
double I_input = 0;
double I_input_filtered = 0;
float Current_lim_set =0;
float Constant_Current_set =0;
float Vout_set =0;
float P_input = 0;
uint8_t flag=0;
extern uint8_t streamData_enable ;

int main(void)
{
    // initialize the device
    SYSTEM_Initialize();

    printf("< dsPIC33CKMP506 PIM+4SWBB ACMC with CC function demo>\r\n");
    printf("Version 1.6B,  Data: 25.Oct.2023 by Zell \r\n");
    Current_lim_set = 3.3 * (float) IOUT_OC_THRESHOLD / 4096.0;
    Current_lim_set = 5.0 * (Current_lim_set - 1.65) / 2.0;
    Vout_tmp_raw = VREF_FIXED14P6V;
    float Vout_def = 8.0*3.3*VREF_FIXED14P6V_FLOAT/4086.0;
     
    
    
    printf("In UART CMD mode:  user can send <SV15.123V.> to set the output Voltage! DEF.=%2.3f V\r\n",Vout_def);
    printf("                   user can send <SA01.100A.> to set the Current Limit value! DEF.=%2.3f A.\r\n",Current_lim_set);
    printf("                   user can send <SC00.300A.> to set the Constant Current value! DEF.=60%% CL\r\n");
    printf("Hinweis: always send 6 digits for the number value!!!\r\n");

    Dev_Button_Init();
    Drv_LED_Init();

    OS_Init(); 
    Drv_PwrCtrl_4SWBB_Init();
    App_HMI_Init();
    Dev_GuiComm_Init(); //Init before App_GUI_Init())
    App_GUI_Init();
    
    //Drv_PwrCtrl_4SWBB_SetReferenceRaw(VREF_FIXED14P6V); //14.6V
    //    pwr_ctrl_flagbits.inopenloop = 1;
    //pwr_ctrl_flagbits.inclosedloop = 0;
    if(UART_CMD_MD)

    {
        streamData_enable = 0;
        printf("Run with  UART CMD mode Set, GUI Stream disabled!\r\n");
    }
    else 
        streamData_enable = 1;
    

    

   
    if(CC_control_mode_EN)

    {
        streamData_enable = 0;
        printf("Run with CC mode Set with C_lim: %1.3F \r\n",Current_lim_set);
        if (0==Constant_Current_set)
            Constant_Current_set = Current_lim_set * 0.6;
    }
    
    printf("---Main loop starts now---!\r\n");
    OS_Scheduler_RunForever();
    // void Drv_PwrCtrl_4SWBB_CtrlLoop(void) 
    //this function contains the AVG Current Controller (every 2nd PWM cycle) 
//        and the Voltage Controller every 8th PWM cycles
//==============================================================================


    return 1;
}
/**
 End of File
*/

