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
#include "device/dev_button.h"
#include "device/dev_gui_comm.h"
#include "app/app_HMI.h"
#include "app/app_GUI.h"
#include "driver/drv_led.h"
/*
                         Main application
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
 */
//copyed from drv_pwrctrl_4SWBB_settings.h"
#define VREF_FIXED14P6V_FLOAT (float)((4096/8/3.3)*14.6)   //12V, Res Voltage divider 1:8
#define VREF_FIXED14P6V       (uint16_t) VREF_FIXED14P6V_FLOAT
uint16_t Vout_tmp_raw = 0;
double V_output = 0;
double I_output = 0;
float P_output = 0;
double V_input = 0;
double I_input = 0;
float P_input = 0;
uint8_t flag=0;

int main(void)
{
    // initialize the device
    SYSTEM_Initialize();
    printf("< dsPIC33CKMP506 PIM+4SWBB ACMC demo>\r\n");
    printf("Version 1.3B,  Data: 8.Oct.2023 by Zell \r\n");
    printf("In UART CMD mode, user can send <SV15.123V.> to set the output Voltage!\r\n");
    printf("Hinweis: always send 6 digits for the number value!!!\r\n");

    Dev_Button_Init();
    Drv_LED_Init();

    OS_Init(); 
    Drv_PwrCtrl_4SWBB_Init();
    App_HMI_Init();
    Dev_GuiComm_Init(); //Init before App_GUI_Init())
    App_GUI_Init();
    Vout_tmp_raw = VREF_FIXED14P6V;
    //Drv_PwrCtrl_4SWBB_SetReferenceRaw(VREF_FIXED14P6V); //14.6V
    //    pwr_ctrl_flagbits.inopenloop = 1;
    //pwr_ctrl_flagbits.inclosedloop = 0;
//    
//            if (pwr_ctrl_flagbits.inopenloop)
//        {  
//            Drv_PwrCtrl_4SWBB_SetMode_ClosedLoop();
//        }  
//        else
//        {  
//            Drv_PwrCtrl_4SWBB_SetMode_OpenLoop();
//        }
    //  PWM_DutyCycleSet(BuckPWM, 0);
   //  PWM_DutyCycleSet(BoostPWM, 0);
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

