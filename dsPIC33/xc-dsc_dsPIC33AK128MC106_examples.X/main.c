/* Microchip Technology Inc. and its subsidiaries.  You may use this software 
 * and any derivatives exclusively with Microchip products. 
 * 
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER 
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED 
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A 
 * PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION 
 * WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS 
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE 
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS 
 * IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF 
 * ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE 
 * TERMS. 
 */

/*
 * File:   main.c
 * Author: C68555
 *
 * Created on May 22, 2023, 2:42 PM
 */

/*
 * UART tested working, but printf not working!
 * Author: Zell
 * V1.0  UART printf a complete line string works! 
 * Date: 20.Feb.2024
 * V0.1, added uart init codes, RC7 TX working OK, original codes not working
 * Modified on Jan 16, 2024,  
 */


#include "xc.h"
#include "examples.h"
#include "stdio.h"
#include "string.h"

//Some code examples are complete programs and define their own main(),
//if one of those is used, comment this main() out.
//#define ADC_SINGLE_CONVERSION_EXAMPLE  comment out to disable this example, see example.h

int UART_MCP2221_init(void);
//UART printf vars
#define TX_CHAR_SIZE 64
char TX_Char[TX_CHAR_SIZE] ;
uint8_t TX_Count = 0;



int main(void) {
    
    UART_MCP2221_init();
    //printf("<This is the hello world demo for dsPIC33AK device test!>/r/n");
    
    IFS2bits.U1TXIF = 0; // Clear TX interrupt flag    
    //U1TXREG = 0;  //how to clear TXREG buffer?
    IEC2bits.U1TXIE = 0;
    sprintf(TX_Char, "<This is the hello world demo for dsPIC33AK device test!>\r\n");
    for(TX_Count=0; TX_Count <TX_CHAR_SIZE; TX_Count++){
          //printf((char) TX_Char[TX_Count]); //single Char works! 
          while(U1STAbits.UTXBF);   // working ?
          printf("%c", TX_Char[TX_Count]); //single Char works! 
          while(!U1STAbits.UTXBE); //not working   !
          for (uint16_t i = 0; i < 0x1000; i++); //delay required
        
    }
    
     //printf("<This is the hello world demo for dsPIC33AK device test!>\r\n");
   // printf("Z"); //single Char works! 
      for (uint16_t i = 0; i < 0x1000; i++);
      
    while(1){
        
         printf("Z"); //single Char works! 
         for (uint16_t i = 0; i < 0x1000; i++); //delay required
         printf("E"); //next Char  not working! 
         for (uint16_t i = 0; i < 0x1000; i++);
         printf("L"); //next Char  not working! 
         for (uint16_t i = 0; i < 0x1000; i++); //delay required
         printf("L"); //next Char  not working! 
         for (uint16_t i = 0; i < 0x1000; i++); //delay required
         printf("\r"); //next Char  not working! 
         for (uint16_t i = 0; i < 0x1000; i++); //delay required
         printf("\n"); //next Char  not working! 
         

        for (uint16_t i = 0; i < 0x8000; i++);
        

}
    
    return 0;
}

