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
#include "mcc_generated_files/system/system.h"

/*
    Main application
 * APM-ADC RA2 analog input, 2s wake up
 * RC7 LED0
 * IN0 RA0  SW0
 * UART 9600
 * CPU 1Mhz for testing
*/

#define Version_Nrd '1'
#define Version_Nrf1 '0' //2._x
#define Version_Nrf2 '1' //2.x_
char version_buf[4];
uint16_t run_cnt = 0;

uint8_t INT0_flag = 0 ;
uint8_t SW0_pressed = 0 ;
uint16_t Zeit_delay_ms = 100 ;
uint8_t APM_EN = 0;

int main(void)
{
    SYSTEM_Initialize();
    
    
    printf("\r\n< PIC18F56Q71 MPLAB 6.25 LP ADC test demo>\r\n");

    version_buf[0] = Version_Nrd;
    version_buf[1] = '.';
    version_buf[2] = Version_Nrf1;
    version_buf[3] = Version_Nrf2;
    
    printf("-Version %s, Last edit:6.July.2025 by Zell\r\n", version_buf);
    //printf("-Version 2.0B, 10.Nov.2024 by Zell-\r\n");
    printf("--FW code compiled: %s %s--\n", __DATE__, __TIME__);
    printf("--FW code compiled with XC8 Version: %d, OPT level: %d\n",  __XC8_VERSION, __OPTIM_LEVEL);
    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts 
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global Interrupts 
    // Use the following macros to: 

    // Enable the Global Interrupts 
    INTERRUPT_GlobalInterruptEnable(); 

    // Disable the Global Interrupts 
    //INTERRUPT_GlobalInterruptDisable(); 
    SWDTEN = 1; // about 8 seconds! #pragma config WDTCPS = WDTCPS_31  
    APM_Stop();

    while(1)
    {
        IO_RC7_LED0_Toggle();
        printf("#>:running loop %u,\r\n", run_cnt);
        if (INT0_flag){
            INT0_flag=0;
            SW0_pressed ++;
            printf("##>: SW0 pressed: %u,\r\n", SW0_pressed);
            APM_EN = 1 -APM_EN ;
            Zeit_delay_ms = Zeit_delay_ms+100;
            __delay_ms(100);
            if(APM_EN){
                printf("!#>: APM start now!,\r\n");
            APM_Start();
            }
            else{
                printf("!#>: APM STOP now!,\r\n");
                 APM_Stop();
            }
        }
        CLRWDT();
        __delay_ms(50);
        run_cnt++;
        SLEEP(); //will wake up every APM cycle, 2s (1s)
        
    }    
}