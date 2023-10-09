/**
  @Company
    Microchip Technology Inc.

  @File Name
    main_tasks.c

  @Summary
    This is the generated driver implementation file using PIC24 / dsPIC33 / PIC32MM MCUs

  @Description
 
    This source file contains the application specific tasks that are called regularly by the os_scheduler
        two different timings priorities are available:
          1. 1ms Tasks called from the os_scheduler interrupt
              the jitter that you will have in the 1ms realtime tasks called by the interrupt depends
              on other interrupts that have a higher interrupt priority
          2. 1ms, 10ms, 100ms, 1s Tasks called from the main loop
              these tasks are for soft realtime and not for hard realtime
              so in average they are called with the required timing but the jitter can be very huge,
              depending on the calls before.
              use this for your non-timing critical application state machines

 @note    you might consider to implement a watchdog and put the watchdog triggering into some Task
 
 
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

#include <stdint.h>
#include <xc.h>
#include "project_settings.h"

#include "mcc_generated_files/system.h"
#include "mcc_generated_files/pin_manager.h"
#include "device/dev_gui_comm.h"
#include "device/dev_button.h"
#include "app/app_HMI.h"
#include "app/app_GUI.h"
#include "driver/drv_led.h"

#include "driver/drv_adc.h"
#include "driver/power_controller/drv_pwrctrl_4SWBB.h"
#include "driver/power_controller/drv_pwrctrl_4SWBB_fault.h"
#include "driver/power_controller/drv_pwrctrl_4SWBB_internal.h"
#include "driver/power_controller/Controller_pwrctrl_4SWBB.h"
#define streamData_status_thre 6
#define BG_task_callback_rate 2  // every BG_task_callback_rate times 1s call one
uint8_t BG_task_call_cnt = 0;

extern uint16_t os_resetCause;  //@sw??
extern uint8_t streamData_enable ;

extern double V_output;
extern double I_output;
extern float P_output;

extern double V_input ;
extern double I_input ;
extern float P_input ;
extern     uint8_t flag;

extern uint8_t btn_press_cnt;
void Switch_GUI_streamData_status(uint8_t btn_cnt);
void UARTComm_Rcv_Task(void);
//=======================================================================================================
//
//                          put your application specific code in the following functions:
//                              choose wisely between real-time and non-realtime!
//
//  Interrupt Realtime Functions:
//  Tasks_Realtime_1ms  :   is called by the interrupt every ms - for time critical low jitter stuff
//
//
//  Mainloop Non-Realtime Functions:
//  Tasks_1ms           :   function is called by the main loop in average every 1ms
//  Tasks_10ms          :   function is called by the main loop in average every 10ms
//  Tasks_100ms         :   function is called by the main loop in average every 100ms
//  Tasks_1s            :   function is called by the main loop in average every second
//
//  @note there could be some jitter here because it is not called directly by a timer interrupt
//        the timing in average is exact (keep in mind: in average), the jitter depends on the
//        called functions before
//=======================================================================================================


//=======================================================================================================
//  @brief  Tasks_Realtime_100us gets called directly from the timer interrupt every 100 µs
//  @note   keep this routine as short as possible
//=======================================================================================================

void Tasks_Realtime_100us(void)
{
    // put your application specific code here that needs to be called every 100 micro seconds from the interrupt
    // example: Drv_TestPin_Toggle(DBG_PIN1);
    Drv_PwrCtrl_4SWBB_Task_100us();
}

//=======================================================================================================
//  @brief  Tasks_Realtime_1ms gets called directly from the timer interrupt every millisecond
//  @note   keep this routine as short as possible
//=======================================================================================================
void Tasks_Realtime_1ms(void)
{
    //Scope record function
}

//=======================================================================================================
//  @brief  Tasks_100us gets called every 100µs, put your things in it that need to be called regularly
//  @note   there could be some jitter here because it is not called directly by a timer interrupt
//=======================================================================================================
void Tasks_100us(void)
{
    if (streamData_enable)//added by zell
        Dev_GuiComm_Task_100us();
    else 
        UARTComm_Rcv_Task();//experimental only, not fully working
}

//=======================================================================================================
//  @brief  Tasks_1ms gets called every millisecond, put your things in it that need to be called regularly
//  @note   there could be some jitter here because it is not called directly by a timer interrupt
//=======================================================================================================
void Tasks_1ms(void)
{
    App_GUI_Task_1ms();
}

//=======================================================================================================
//  @brief  Tasks_10ms gets called every 10ms, put your things in it that need to be called regularly
//  @note   there could be some jitter here because it is not called directly by a timer interrupt
//=======================================================================================================
void Tasks_10ms(void)
{
  // put your application specific code here that needs to be called every 10 milliseconds
  Dev_Button_Task_10ms();
}

//=======================================================================================================
//  @brief  Tasks_100ms gets called every 100 ms, put your things in it that need to be called regularly
//  @note   there could be some jitter here because it is not called directly by a timer interrupt
//=======================================================================================================

void Tasks_100ms(void)
{
  // put your application specific code here that needs to be called every 100 milliseconds
  App_HMI_Task_100ms();
  Drv_LED_Task_100ms();
}

//=======================================================================================================
//  @brief  Tasks_1s gets called every second, put your things in it that need to be called regularly
//  @note   there could be some jitter here because it is not called directly by a timer interrupt
//=======================================================================================================

void Tasks_1s(void)
{
    // put your application specific code here that needs to be called every second
//    Dev_GuiComm_Scope_TriggerNow();
    BG_task_call_cnt ++; 
    if( (0==streamData_enable)&&(BG_task_call_cnt>BG_task_callback_rate)){
      V_output = 3.3*8*(float)pwr_ctrl_adc_data.drv_adc_val_FB_Vout/4096;
      I_output = 3.3*(float)pwr_ctrl_adc_data.drv_adc_val_FB_Iout/4096;
      //((((0.4*3)+1.65)*4096)/3.3)
      I_output =5.0*(I_output -1.65)/2.0;
      if (I_output<0)
        I_output =0;
      P_output = V_output*I_output;
      printf("Background task running!\r\n");
      printf("Vout: %2.3f V\r\n",V_output);
      printf("Iout: %2.3f A\r\n",I_output);
      printf("Pout: %2.3f W\r\n",P_output);
      V_input = 3.3*8*(float)pwr_ctrl_adc_data.drv_adc_val_FB_Vdd/4096;
      I_input = 3.3*(float)pwr_ctrl_adc_data.drv_adc_val_FB_Iin/4096;
      //((((0.47*5)+0.447)*4096)/3.3)
      I_input= (I_input -0.447)/0.47;
      if (I_input<0)
        I_input =0;
      P_input = V_input*I_input;
      printf(">>Vin: %2.3f V\r\n",V_input);
      printf(">>Iin: %2.3f A\r\n",I_input);
      printf(">>Pin: %2.3f W\r\n",P_input);
      printf("#>:Power efficiency: %2.1f %%\r\n",100.0*P_output/P_input);
      printf("#>:Flag: %d\r\n",flag);
      printf("----------------------------\r\n");
      BG_task_call_cnt =0; //clear count
        flag = 0;
    }
    
}

//=======================================================================================================
//  @brief  Tasks_Background gets called all the time when no other of the above tasks are being called
//  @note   call this function when you want to implement your own timing or get code called as often
//          as possible. You can also put your timing variables into Tasks_Realtime_100us or
//          Tasks_Realtime_1ms. This way you get accurate timing variables that you can use here.
//=======================================================================================================
void Tasks_Background(void)
{
    // put your application specific code here that needs to be called in the background.
    // your application needs to take care of it's timing.
    Switch_GUI_streamData_status(btn_press_cnt);

}


void Switch_GUI_streamData_status(uint8_t btn_cnt)
{
    
    if(btn_cnt>streamData_status_thre)

    {
        streamData_enable = 0;
    }
    else 
        streamData_enable = 1;
    
}

