
/**
  Generated main.c file from MPLAB Code Configurator
  @Version: 
    *V1.2 PWM freq, duty display bugs, added ADC contol-->PWM freq 
    *V1.1 added debug printf support, run cnt, 
   
  @Company
    Microchip Technology Inc.
    Author: Modified by Zell

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
        MPLAB 	          :  MPLAB X v6.05
*/

/*
    (c) 2020 Microchip Technology Inc. and its subsidiaries. You may use this
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
#include <xc.h>
#include "mcc_generated_files/system.h"
#include "main.h"

/* ********************************************************************* *
 * PWM Complementary Output PWM Configuration Example
 * 
 * Description:
 * 
   In this code example PWM generator channel #3 is initialized 
 *   to produce a complementary output signal at pins PWM3H and PWM3L.
 *   Between rising and falling edges of the output signals a dead time 
 *   is added (100ns at rising edge of PWMxH and 150ns at falling edge of
 *   PWMxH). The initial frequency after startup is set to 200 kHz. By
 *   pressing push button [USER], the frequency is stepped to 1 MHz. By 
 *   pressing [USER] again, the frequency switches back to 200 khz,
 *   The duty ratio will always remain 25% of the switching period.
 * 
 * Please note:
 *   This code example can be run on dsPIC33CK as well as on dsPIC33CH
 *   devices. The PWM outputs of each device may be routed to different 
 *   test points. Please refer to the table below to quickly find the 
 *   right signal outputs. 
 * 
 * Recommended Use of this example:
 *   In this example Microchip Code Configurator (MCC) is used to set 
 *   up the device main and auxiliary clock as well as Timer1 used
 *   to create a deterministic execution of code within the main() 
 *   loop.The project folder 'drivers' contains generic PWM module 
 *   driver files,which are independent from MCC to better demonstrate 
 *   the PWM generator register configuration in more detail. 
 *   These driver files are providing an abstraction layer of the 
 *   user code, allowing quick migration of code across different 
 *   device peripherals and device families.
 * 
 *   To better understand these mechanisms please open file 'pwm.h' on
 *   code line 49 and change the following PWM generator index number to
 *   configure another PWM generator than #3.
 *
 *     #define MY_PWM_GENERATOR    3 
 * 
 *   Valid numbers are 1-8 for PG1 through PG8 on dsPIC33CK and 
 *   1-4 for PG1 through PG4 on dsPIC33CH. Due to hardware limitations
 *   not all PWM generator outputs may be accessible. Please refer to 
 *   the Test Pin table below to review if the selected PWM generator 
 *   outputs are available and accessible.
 * 
 * Hardware:
 *  - Digital Power Development Board (DM330029) 
 *  - dsPIC33CK Digital Power Plug-In Module (MA330048)
 *
 * Software:
 *  - MPLAB X IDE, v5.40
 *  - Microchip Code Configuration (MCC), v3.95.0
 *  - XC16 C-Compiler, v1.50
 *  - dsPIC33CK-MP Device File Pack v1.4.102
 * 
 * ********************************************************************* */  

/* ********************************************************************* *
 * Digital Power Development Board (DM330029) Test Pin Assignment:
 * *********************************************************************
 * 
 * Board Overview:
 * 
 *         ------------------------------------
 *        |        DIGITAL TEST POINTS         |
 *        |------------------------------------|
 *        |           __________           ----|
 *        |          |__________|         | USB|
 *        |         DP PIM SOCKET          ----|
 *        |                               -----|
 *        |                   RESET O    | ICSP|
 *        |      _   _                    -----|
 *        |   P2|O| |O|P1      USER O          |
 *         ------------------------------------ 
 * 
 * Signal     | Test-Pin              | Comment
 *            | dsPIC33CK | dsPIC33CH | 
 * ---------------------------------------------------------------------
 * PWM1H      | TP45      | TP35      | PWM Generator #1 output HIGH
 * PWM1L      | TP47      | TP38      | PWM Generator #1 output LOW
 *            |           |           | 
 * PWM2H      | TP42      | TP25      | PWM Generator #2 output HIGH
 * PWM2L      | TP40      | TP27  (2) | PWM Generator #2 output LOW
 *            |           |           | 
 * PWM3H      | TP37      | TP36      | PWM Generator #3 output HIGH (default)
 * PWM3L      | TP41      | TP34      | PWM Generator #3 output LOW  (default)
 *            |           |           | 
 * PWM4H      | TP43      | TP46      | PWM Generator #4 output HIGH
 * PWM4L      | TP44      | TP48      | PWM Generator #4 output LOW
 *            |           |           | 
 * PWM5H      | TP35      | (n/a) (3) | PWM Generator #5 output HIGH
 * PWM5L      | TP38      | (n/a) (3) | PWM Generator #5 output LOW
 *            |           |           | 
 * PWM6H      | TP31      | (n/a) (3) | PWM Generator #6 output HIGH
 * PWM6L      | TP33      | (n/a) (3) | PWM Generator #6 output LOW
 *            |           |           | 
 * PWM7H      | TP25      | (n/a) (3) | PWM Generator #7 output HIGH
 * PWM7L      | TP27 (1)  | (n/a) (3) | PWM Generator #7 output LOW
 *            |           |           | 
 * PWM8H      | TP46      | (n/a) (3) | PWM Generator #8 output HIGH
 * PWM8L      | TP48      | (n/a) (3) | PWM Generator #8 output LOW
 * ---------------------------------------------------------------------
 *
 * (1): not available on dsPIC33CK DP PIM; Shared with on-board push button SW1
 * (2): not available on dsPIC33CH DP PIM Master Core; Shared with on-board push button SW1
 * (3): not available on dsPIC33CH DP PIM Master Core
 * 
 * ********************************************************************* */

#include "stdio.h"
#include "adc1.h"

// Digital Power Plug-In Module On-Board LED control
#define LED_INTERVAL    3000
#define tmr_interval  100 //100us
volatile uint16_t dbgled_cnt = 0;

//User Vars
uint32_t sys_run_cnt;
uint16_t sys_cnt; //in seconds
uint16_t printf_interval = 1000; //in ms 
uint32_t loop_interval = 0;
//UI
uint8_t Btn_press_cnt = 0;
//ADC
uint16_t ADC_conversion = 0;
uint16_t ADC_conversion2 = 0;
float ADC_Voltage = 0 ;
float Ref_voltage= 3.25;
//PWM related vars
uint32_t PWM_Per = 0; //raw, ns
float PWM_Per_us = 0; //in us
float PWM_Freq = 0; //in KHz
float PWM_Freq_Mhz = 0; //in KHz
uint16_t PWM_Duty =0;
uint32_t PWM_Duty_32bit = 0; // e.g. 55 represents 55%
float PWM_Duty_P= 0; // in %
//user functions
uint8_t Set_PWM_period(uint16_t Per_ns);

/*
                         Main application
 */
int main(void)
{
    
    // initialize the device
    SYSTEM_Initialize();
    printf("dsPIC33CK256MP506 PWM ADC demo v1.2 by Zell \r\n");
    // User PWM Initialization
    PWM_Initialize();
    printf("#>: PWM Initialized !\r\n");
    // * PWM3H      | TP37      | TP36      | PWM Generator #3 output HIGH (default)
    //* PWM3L      | TP41      | TP34      | PWM Generator #3 output LOW  (default)
    // Initialize DP PIM and DP DevBoard function pins
    _T1IF = 0;
    DBGPIN_InitAsOutput();
    DBGLED_InitAsOutput();
    SW_InitAsInput();
    ADC1_Core0PowerEnable ( ) ;
    
    loop_interval = printf_interval/tmr_interval ;
    loop_interval = loop_interval*1000;
    printf("#>: Debug printf loop interval time: %d ms. loop_interval: %d \r\n", printf_interval, loop_interval);
    printf("#>: main loop starts !\r\n");
    uint16_t Per_tmp_value = 0;
    uint8_t res = 0;
    /* main loop */
    while (1)
    {
        while(!_T1IF);  // Wait for Timer1 to expire  ? 100us
        //sys_run_cnt++;
        _T1IF = 0;      // Reset interrupt flag bit
        DBGPIN_Clear(); // Clear device debug pin
        
        // Count main-loop execution cycles until on-board LED needs to be toggled
        if(++dbgled_cnt > LED_INTERVAL)
        {
            dbgled_cnt = 0;     // Reset LED toggle counter
            DBGLED_Toggle();    // Toggle on-board LED
        }
        
        // Check if on-board push button has been pressed
        if (SW_Read() == SW_PRESSED)
        {
            // Wait until switch is released
            while(SW_Read() == SW_PRESSED); 
            Btn_press_cnt ++;
            if(6>Btn_press_cnt){
                // Update PWM timing registers, Default PWM Initialization for 500 MHz input clock from AUX PLL, 250ps resolution
                if(my_pg->PGxPER.value == 20000)   // IF period is set to 200 kHz)
                {
                    my_pg->PGxPER.value = 4000;    // set period to 1 MHz
                    my_pg->PGxDC.value = 2000;     // rescale to 25% duty cycle
                }
                else
                {
                    my_pg->PGxPER.value = 20000;   // set period to 200 kHz
                    my_pg->PGxDC.value = 5000;     // rescale to 25% duty cycle
                }
            }
            else{
                if (ADC_conversion>0){
                    Per_tmp_value = ADC_conversion*4; //12bit to 14 bit nS
                    res = Set_PWM_period(Per_tmp_value) ;
                    if (res)
                         printf("##>:Set new PWM period based on ADC Pot2 value failed @ %d ns!\r\n",Per_tmp_value);
                    else 
                        printf("##>:Setting new PWM period based on ADC Pot2 successful!@ %d ns\r\n",Per_tmp_value);
                }
               
                
            }

            // Set UPDATE bit of master PWM generator #1
            DBGPIN_Set();                   // Set debug pin as oscilloscope trigger
            my_pg->PGxSTAT.bits.UPDREQ = 1;  // Set Update Bit (apply new timing to PWM generator)
        }
    sys_run_cnt++;    
    //Debug info output
    if (sys_run_cnt>loop_interval ){
        sys_run_cnt=0;
        sys_cnt++;
        ADC1_Enable();
        ADC1_ChannelSelect(channel_AN0);
        ADC1_SoftwareTriggerEnable();
        
        //bug here if too small the Per value! e.g. 172 ns, <1000 ns
        PWM_Per = my_pg->PGxPER.value /4;  //ns, 1-250ps
        PWM_Per_us =  (float)PWM_Per /1000; //us
        printf("-----------------\r\n");
        if(PWM_Per_us>1 ){
            PWM_Freq = 1000/PWM_Per_us; //KHz
            printf("#>: Current PWM freq: %.3f KHz, Duty cycle: %d %%, \r\n", PWM_Freq,PWM_Duty);  //-1 Khz bug!
        }
        else  {
            PWM_Freq_Mhz = 1000/PWM_Per; //MHz
             printf("#>: Current PWM freq: %.3f MHz, Duty cycle: %d %%, \r\n", PWM_Freq_Mhz,PWM_Duty);  //-1 Khz bug!
        }
        PWM_Duty_32bit =  (uint32_t)(100*(uint32_t)(my_pg->PGxDC.value)) / (my_pg->PGxPER.value);  //bugs here
        PWM_Duty = (uint8_t)PWM_Duty_32bit ;
        PWM_Duty_P = 100*(float) (my_pg->PGxDC.value) / (float)(my_pg->PGxPER.value);
       

        printf("#>: Current PWM Duty cycle: %3.1f %%, \r\n", PWM_Duty_P);
        
        ADC1_SoftwareTriggerDisable();
        //while(!ADC1_IsConversionComplete(channel_AN0));
        ADC_conversion = ADC1_ConversionResultGet(channel_AN0);
        
        ADC1_ChannelSelect(channel_AN1);
        ADC1_SoftwareTriggerEnable();
        ADC_Voltage = Ref_voltage * (float)ADC_conversion/4095.0; //12bit
        printf("#>: ADC_AN0: %4.3f V\r\n", ADC_Voltage);
        ADC1_SoftwareTriggerDisable();
        ADC_conversion2 = ADC1_ConversionResultGet(channel_AN1);
        ADC_Voltage = Ref_voltage * (float)ADC_conversion2/4095.0; //12bit
        printf("#>: ADC_AN1: %4.3f V\r\n", ADC_Voltage);
        ADC1_Disable(); 
        
        printf("#>: Sys_run: %d .\r\n", sys_cnt);
        printf("-----------------\r\n");
    }
    
    }
    
    return(1);  // If this line is ever reached, something really bad happened....
}

//Val desired period in nS,set PWM period in nS with high resolution mode, 250ps resolution
uint8_t Set_PWM_period(uint16_t Per_ns){
    //Max period is 16.384us, which is 61.035Khz
    uint16_t tmp_val = 0;
    DBGPIN_Set();                   // Set debug pin as oscilloscope trigger
    if (Per_ns> 16383)
        return 1;
    tmp_val = Per_ns*4;
    my_pg->PGxPER.value = tmp_val ;
    printf("#>: PGxPER.value = %d,", tmp_val);
    tmp_val =(uint16_t) (PWM_Duty_P*tmp_val/100); //bugs!
    //tmp_val = tmp_val/2;
    my_pg->PGxDC.value = tmp_val;//make sure the duty unchanged!
    printf("PGxDC.value = %d.\r\n\r\n", tmp_val);
    my_pg->PGxSTAT.bits.UPDREQ = 1;  // Set Update Bit (apply new timing to PWM generator)
    DBGPIN_Clear(); 
    return 0; //successful
    
}

/**
 End of File
*/

