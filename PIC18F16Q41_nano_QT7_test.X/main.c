 /*
 * MAIN Generated Driver File
 * 
 * @file main.c
 * 
 * @defgroup main MAIN
 * 
 * @brief This is the generated driver implementation file for the MAIN driver.
 *
 * @version MAIN Driver Version 1.0.0
*/

/*
? [2023] Microchip Technology Inc. and its subsidiaries.

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
#include "PIC18F56Q71_CNANO_header.h"
#include <string.h>
/*
    Main application
 * FCY = 64M/2/4=8M
 * UART2 19200 printf supported!
 * Timer 1 used for CCP, 1us tick, overflow every 16.384mS
 * TImer 0 used for PWM in center aligned mode, 2.5us/count
*/
uint16_t sys_cnt = 0;
uint8_t sys_cnt_8bitLSB = 0;
uint8_t sys_cnt_8bitMSB = 0;
uint8_t Flg_tmp = 0;
#define BLINK_DELAY         200
//----------------CCP var, Timer0 module, RC6 TMR out
uint8_t CCP_IF_flag = 0 ; 
uint8_t CCP1_tck_L = 0;
uint8_t CCP1_tck_H = 0;
uint16_t CCP1_tck_current = 0;
uint16_t CCP1_tck_pre = 0;
uint16_t CCP1_tck_current_buf = 0;
uint16_t CCP1_tck_pre_buf = 0;
uint8_t CCP1_tck_L_pre = 0;
uint8_t CCP1_tck_H_pre = 0;
uint8_t CCP_data_valid = 0 ; 
uint16_t CCP1_time_diff = 0;
uint16_t Timer0_tck = 0 ; 
uint16_t Timer0_tck_pre = 0 ; 
uint8_t Timer0_flag = 0;
//----------------Timer 1 PWM module
//RC1  PWM out

int main(void)
{
    SYSTEM_Initialize();

     printf("PIC18F56Q71 test Program for UART and CCP, Ver2.0 by Zell\r\n");
     printf("Date:16.June.2023\r\n");
    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts 
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global Interrupts 
    // Use the following macros to: 
     IO_RE2_Toggle(); 
     Flg_tmp = INTERRUPT_GlobalInterruptHighStatus();
     printf("SYS boot status: _GlobalInterruptHighStatus-%d \r\n",Flg_tmp);
     Flg_tmp = INTERRUPT_GlobalInterruptLowEnable();
     printf("SYS boot status: _GlobalInterruptLowStatus-%d \r\n",Flg_tmp);
    // Enable the Global High Interrupts 
    INTERRUPT_GlobalInterruptHighEnable(); 
    Flg_tmp = INTERRUPT_GlobalInterruptHighStatus();
    printf("#>: Enable GlobalInterruptHigh:%d \r\n",Flg_tmp);
    IO_RE2_Toggle(); 
    
    PWM1_16BIT_RC1_Disable();
    //what is push pull mode combined with center aligned!
    //? Push-pull operation (available in Left and Right Aligned modes only)
    //In the Push-Pull mode, the outputs are Active every other PWM period.

    PWM1PRH = 0x07;// for 200Hz 0x07D0= 2000
    PWM1PRL = 0xD6;
    PWM1S1P1H = 0x3;//0x03E8= 1000, 50% duty cycle
    PWM1S1P2L = 0xE8;
    printf("#>: Change PWM Freq to 200Hz \r\n");
    PWM1_16BIT_RC1_Enable();
    // Disable the Global High Interrupts 
    //INTERRUPT_GlobalInterruptHighDisable(); 

    // Enable the Global Low Interrupts 
    //INTERRUPT_GlobalInterruptLowEnable(); 

    // Disable the Global Low Interrupts 
    //INTERRUPT_GlobalInterruptLowDisable(); 
    sys_cnt_8bitLSB = 0;
    sys_cnt_8bitMSB = 0 ;
   // Timer0_Start();
    Timer1_Start();
    CCP1_tck_pre = 0;
    
    while(1)
    {
        
         sys_cnt++;
         sys_cnt_8bitLSB++;
         if (Timer0_flag){
             //TMR overflow interval at 16.384 ms
             IO_RE2_Toggle(); //32.85 Khz, almost same to RC6_TMR0_out
             Timer0_flag =0;
         }
         if(CCP_IF_flag){
             if (CCP1_tck_current>CCP1_tck_pre){
                CCP1_tck_current_buf =CCP1_tck_current;
                CCP1_tck_pre_buf =CCP1_tck_pre;
                CCP1_time_diff = CCP1_tck_current_buf-CCP1_tck_pre_buf;
                //CCP1_tck_pre =0;
                //CCP1_tck_current =0;
                CCP_data_valid = 1; 
                //CCP1_tck_pre = CCP1_tck_current;
             }
             CCP_IF_flag =0;
         }
         //__delay_ms(BLINK_DELAY);
         if (0==sys_cnt_8bitLSB%255){
            sys_cnt_8bitLSB = 0;
            sys_cnt_8bitMSB++;
            //CCP1_tck_pre= (uint16_t)((CCP1_tck_H_pre << 8) | CCP1_tck_L_pre);
            //CCP1_tck_pre = CCP1_tck_L_pre+ (uint8_t) (CCP1_tck_H_pre<<8);
            //CCP1_tck_current = CCP1_tck_L+ (uint8_t) (CCP1_tck_H<<8);
           // CCP1_tck_current= (uint16_t)((CCP1_tck_H << 8) | CCP1_tck_L);

            //0.62Hz @ 20000 @8MKhz
            }
        
//         if (0==sys_cnt_8bitMSB%8){
//            sys_cnt_8bitMSB = 0 ;
//            sys_cnt_8bitLSB = 0;
//            STATUS_LED_toggle();
//            //6.611KHz @ 2048 count @16MKhz sys clock
//            }
           if (0==sys_cnt_8bitMSB% 255){
            sys_cnt_8bitMSB = 0 ;
            sys_cnt_8bitLSB = 0;
            //IO_RE2_Toggle(); 
            //2.8 KHz @ 65536 count @4MKhz DOSC out
            
            //STATUS_LED_toggle();
            //3.572 KHz @ 65536 count @16MKhz sys clock
            //223.3Hz @ 65536 count @1MKhz sys clock
            
            }   
                

         if (0==sys_cnt%4000){
            STATUS_LED_toggle();
            sys_cnt =0;
           // PWM1S1P2L++;
            if (CCP_data_valid){
                printf("#>:CCP_data_valid!\r\n");
                CCP1_time_diff = CCP1_tck_current - CCP1_tck_pre;//most fresh data
                printf("#>:CCP_diff:%u ,Raw:%u, %u\r\n",CCP1_time_diff,CCP1_tck_current,CCP1_tck_pre );
                printf("#>:Captured Freq:%u Hz\r\n", 1000000/CCP1_time_diff );
                CCP_data_valid =0;
           // }
            //if (CCP_IF_flag){
               // CCP_IF_flag = 0;
                //printf("#>:CCP_IF!\r\n");
                printf("#>:CCP_BUF_diff:%u ,Raw:%u, %u\r\n",CCP1_time_diff,CCP1_tck_current_buf,CCP1_tck_pre_buf );
            }
            printf("#>sys loop running!\r\n");
            //88.2 us loop? 
            //5.67Hz @ 2000 @16Mhz FCY @16bit sys_cnt uint16_t 
        }
        // STATUS_LED_toggle();
        
    }    
}

/*
 #>:CCP_IF!
#>:CCP_diff:0 ,Raw:19505, 0
#>sys loop running!
#>:CCP_IF!

#>:CCP_diff:0 ,Raw:-16265, 0
#>sys loop running!
#>:CCP_IF!
#>:CCP_diff:0 ,Raw:28977, 0
 #>:CCP_diff:2418 ,Raw:39155, 64275
#>:CCP_IF!
#>:CCP_diff:2418 ,Raw:64167, 64275
 */