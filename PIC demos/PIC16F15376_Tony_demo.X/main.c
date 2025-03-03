/*
 * MAIN Generated Driver File
 * 
 * @file main.c
 * 
 * @defgroup main MAIN
 * 
 * @brief This is the generated driver implementation file for the MAIN driver.
 *
 * @version MAIN Driver Version 1.0.2
 *
 * @version Package Version: 3.1.2
 */

/*
© [2025] Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip 
    software and any derivatives exclusively with Microchip products. 
    You are responsible for complying with 3rd party license terms  
    applicable to your use of 3rd party software (including open source  
    software) that may accompany Microchip software. SOFTWARE IS ?AS IS.? 
    NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS 
    SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT,  
    MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT 
    WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY 
    KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF 
    MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE 
    FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP?S 
    TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT 
    EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR 
    THIS SOFTWARE.
 */

//Version 1.0 CNANO demo code for PIC16F15376 Curiosity Nano board, by ZELL, 2025.3.3
#include "mcc_generated_files/system/system.h"
#include <xc.h>

/*
    Main application
 */
uint8_t SW_status = 0;
uint16_t SW0_press_cnt = 0;
uint16_t SW0_press_cnt_pre = 0;
uint16_t ADC_res_tmp = 0;
uint16_t TMR0_INT_cnt = 0;
uint16_t TMR0_INT_cnt_pre = 0;

int main(void) {
    SYSTEM_Initialize();
    IO_RE2_SW0_SetPullup();
    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts 
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global and Peripheral Interrupts 
    // Use the following macros to: 


    printf("<PIC16F15376 demo V1.0 by Zell!>\r\n");
    printf("--FW code compiled: %s at %s--\n", __DATE__, __TIME__);
    printf("--FW code compiled with XC8 Version: %u\n", __STDC_VERSION__);
    //uint16_t sigrow_offset = SIGROW.TEMPSENSE1; // 831  Read unsigned offset from signature row 
    //uint16_t sigrow_slope = SIGROW.TEMPSENSE0; //  1024  Read unsigned gain/slope from signature row
  
    // Enable the Global Interrupts 
    INTERRUPT_GlobalInterruptEnable();

    // Disable the Global Interrupts 
    //INTERRUPT_GlobalInterruptDisable(); 

    // Enable the Peripheral Interrupts 
    INTERRUPT_PeripheralInterruptEnable();

    // Disable the Peripheral Interrupts 
    //INTERRUPT_PeripheralInterruptDisable(); 
    ADC_SelectChannel(channel_Temp);
    int16_t temperature_in_C=0;
    
    while (1) {

        if (TMR0_INT_cnt_pre != TMR0_INT_cnt) {
            //ADC_res_tmp = ADC_GetConversion(channel_Temp);
            ADC_res_tmp = ADC_GetConversionResult(); //TMR0 trigger
            if (0 == TMR0_INT_cnt % 10) {
                 //ADC_res_tmp = sigrow_offset - ADC_res_tmp;
                //temp *= sigrow_slope;   // Result will overflow 16-bit variable, 624640
                // temp += SCALING_FACTOR/2;         // Ensure correct rounding on division below
                //temp /= SCALING_FACTOR;            // Round off to nearest degree in kelvin uint16_t temperature_in_K = temp;
                
                
                
                temperature_in_C = ADC_res_tmp - 273;
                printf(">>: Chip Die temp: %d,(T_ADC raw): %u \r\n", temperature_in_C, ADC_res_tmp);
                 printf(">>: SW0 press cnt: %u \r\n", SW0_press_cnt);
                printf(">>: 100ms TMR0 INT cnt: %u \r\n", TMR0_INT_cnt);
            }
            TMR0_INT_cnt_pre = TMR0_INT_cnt;
            if (0 == SW0_press_cnt) {
                IO_RE0_LED_Toggle();
            }
            
            if(SW0_press_cnt_pre!=SW0_press_cnt)
            {
                IO_RE0_LED_Toggle();
                SW0_press_cnt_pre = SW0_press_cnt;
                __delay_ms(50);
            }
        }


        SW_status = IO_RE2_SW0_GetValue();
        if (0 == SW_status) {
            SW0_press_cnt++;
            
            //__delay_us(100);
        }
    }
}

/*
>>: SW0 press cnt: 0 
>>: 100ms TMR0 INT cnt: 40 
>>: Chip Die temp(ADC raw): 282 
>>: SW0 press cnt: 3035 
>>: 100ms TMR0 INT cnt: 50 
>>: Chip Die temp(ADC raw): 282 
>>: SW0 press cnt: 10168 
>>: 100ms TMR0 INT cnt: 60 
>>: Chip Die temp(ADC raw): 282 
>>: SW0 press cnt: 23447 
>>: 100ms TMR0 INT cnt: 70 
>>: Chip Die temp(ADC raw): 282 
>>: SW0 press cnt: 23447 
>>: 100ms TMR0 INT cnt: 80 
>>: Chip Die temp(ADC raw): 282 
>>: SW0 press cnt: 19115 


 
 
 */