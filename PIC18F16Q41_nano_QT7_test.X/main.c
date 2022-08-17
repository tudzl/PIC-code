//UART and LED toggle demo for 18F16Q41 nano demo board + QT7 touch
//By Zell
//slider not fully working due to pin conflict RC1 
/**
  Generated Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This is the main file generated using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  Description:
    This header file provides implementations for driver APIs for all modules selected in the GUI.
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.81.7
        Device            :  PIC18F16Q41
        Driver Version    :  2.00
*/

/*
    (c) 2018 Microchip Technology Inc. and its subsidiaries. 
    
    Subject to your compliance with these terms, you may use Microchip software and any 
    derivatives exclusively with Microchip products. It is your responsibility to comply with third party 
    license terms applicable to your use of third party software (including open source software) that 
    may accompany Microchip software.
    
    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER 
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY 
    IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS 
    FOR A PARTICULAR PURPOSE.
    
    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP 
    HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO 
    THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL 
    CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT 
    OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS 
    SOFTWARE.
*/

#include "mcc_generated_files/mcc.h"

/*
                         Main application
 * UART @ 19200
 */
bool touch_event;
uint8_t key_id = 0;
uint8_t slider_pos = 0;
uint16_t touch_cnt = 0;
uint16_t touch_cnt_pre = 0;
uint16_t touch_reading = 0;
uint16_t touch_baseline = 0;
uint16_t sys_cnt = 0;
void myButton1PressedCallback(enum mtouch_button_names button);
//void myButton2PressedCallback(enum mtouch_button_names button);

void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();

    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global Interrupts
    // Use the following macros to:

    // Enable the Global Interrupts
    //INTERRUPT_GlobalInterruptEnable();

    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();
     MTOUCH_Button_SetPressedCallback(myButton1PressedCallback);
    // MTOUCH_Button_SetPressedCallback(myButton2PressedCallback);
     printf("PIC18 QT7 touch demo V1.1 by Zell \r\n");
      __delay_ms(200);
     IO_RA4_Btn1_Toggle();
      __delay_ms(200);
     IO_RB4_Btn2_SetHigh();
     __delay_ms(200);
     //IO_RB4_Btn2_SetHigh();
     INTERRUPT_GlobalInterruptEnable();
     
    while (1)
    {
        
         touch_event = MTOUCH_Service_Mainloop();
        //MTOUCH_Service_Mainloop();
        if (touch_cnt > touch_cnt_pre) {
            IO_RC1_LED_Toggle();
        }
         
          if (touch_event) {
            //printf("TP!\r\n");
            if (MTOUCH_Button_isPressed(Button1) == true) {
                key_id =1;
                if (touch_cnt > touch_cnt_pre) {
                    // user app
                    //IO_RC7_LED1_Toggle();
                     //IO_RC1_LED_Toggle();
                     IO_RA4_Btn1_Toggle();
                    touch_cnt_pre = touch_cnt;
                }
            }
            if (MTOUCH_Button_isPressed(Button2) == true) {
                key_id =2;
                if (touch_cnt > touch_cnt_pre) {
                    // user app
                    //IO_RB1_LED2_Toggle();
                    // IO_RC7_LED1_Toggle();
                     //IO_RC1_LED_Toggle();
                    IO_RB4_Btn2_Toggle();
                    touch_cnt_pre = touch_cnt;
                }
            }
            if (MTOUCH_Button_isPressed(Slider1_Seg0) == true) {
                key_id =3;
                if (touch_cnt > touch_cnt_pre) {
                    // user app
                    //IO_RB1_LED2_Toggle();
                    touch_cnt_pre = touch_cnt;
                }
            }
            if (MTOUCH_Button_isPressed(Slider1_Seg1) == true) {
                key_id =4;
                if (touch_cnt > touch_cnt_pre) {
                    // user app
                    touch_cnt_pre = touch_cnt;
                }
            }
            if (MTOUCH_Button_isPressed(Slider1_Seg2) == true) {
                key_id =5;
                if (touch_cnt > touch_cnt_pre) {
                    // user app
                    //IO_RB1_LED2_Toggle();
                    
                    touch_cnt_pre = touch_cnt;
                }
            }
          }
         
        if( MTOUCH_Slider_isPressed(Slider1)){
            
            slider_pos = MTOUCH_Slider_Position_Get(Slider1);
        }
         
         
        
        
        //UART1_Write(128);
         if(0==sys_cnt%100){
            IO_RC1_LED_Toggle();
             printf("PIC18 QT7 touch running!\r\n");
             printf("touch cnt: %d; Key ID:%d\r\n",touch_cnt,key_id);
              printf("Slider: %d\r\n",slider_pos);
             __delay_ms(10);
        // Add your application code
         }
         __delay_ms(10);
        sys_cnt++;
    }
}



void myButton1PressedCallback(enum mtouch_button_names button) {
    //printf("The button %d is pressed.\r\n", button);

    touch_reading = MTOUCH_Button_Reading_Get(button);
    //IO_RC7_LED1_Toggle();
    touch_cnt++;
    //IO_RA4_Btn1_Toggle();
    //IO_RB0_trigger_SetHigh();//need to set low according to user app neads
    
}

void myButton2PressedCallback(enum mtouch_button_names button) {
    //printf("The button %d is pressed.\r\n", button);

    touch_reading = MTOUCH_Button_Reading_Get(button);
    //IO_RC7_LED1_Toggle();
    touch_cnt++;
    //IO_RB4_Btn2_SetHigh();
    //IO_RB0_trigger_SetHigh();//need to set low according to user app neads
    
}



/**
 End of File
*/