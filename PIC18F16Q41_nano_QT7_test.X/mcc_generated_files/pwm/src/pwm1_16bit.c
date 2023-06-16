/**
  * PWM1_16BIT Generated Driver File.
  *
  * @file pwm1_16bit.c
  *
  * @ingroup pwm1_16bit
  *
  * @brief This file contains the API implementation for the PWM1_16BIT module.
  *
  * version PWM1_16BIT Driver Version 1.0.1
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

/**
 * @section: Included Files
 */

#include <xc.h>
#include "../pwm1_16bit.h"

//Pointers to PWM1_16BIT interrupt handlers
//User can use them in application code to initialize with custom ISRs
static void (*PWM1_16BIT_RC1_Slice1Output1_InterruptHandler)(void);   //SaP1IF and hence PWMxIF is set
static void (*PWM1_16BIT_RC1_Slice1Output2_InterruptHandler)(void);   //SaP2IF and hence PWMxIF is set
static void (*PWM1_16BIT_RC1_Period_InterruptHandler)(void);          //PWMxPIF is set
static void PWM1_16BIT_RC1_Slice1Output1_DefaultInterruptHandler(void);
static void PWM1_16BIT_RC1_Slice1Output2_DefaultInterruptHandler(void);
static void PWM1_16BIT_RC1_Period_DefaultInterruptHandler(void);

void PWM1_16BIT_RC1_Initialize(void)
{
    //PWMERS External Reset Disabled; 
    PWM1ERS = 0x0;

    //PWMCLK HFINTOSC; 
    PWM1CLK = 0x3;

    //PWMLDS Autoload disabled; 
    PWM1LDS = 0x0;

    //PWMPRL 159; 
    PWM1PRL = 0x9F;

    //PWMPRH 15; 
    PWM1PRH = 0xF;

    //PWMCPRE Prescale by 80; 
    PWM1CPRE = 0x4F;

    //PWMPIPOS Postscale by 100; 
    PWM1PIPOS = 0x63;

    //PWMS1P1IF PWM1 output match did not occur; PWMS1P2IF PWM2 output match did not occur; 
    PWM1GIR = 0x0;

    //PWMS1P1IE disabled; PWMS1P2IE disabled; 
    PWM1GIE = 0x0;

    //PWMPOL1 disabled; PWMPOL2 enabled; PWMPPEN disabled; PWMMODE Center aligned mode; 
    PWM1S1CFG = 0x82;

    //PWMS1P1L 208; 
    PWM1S1P1L = 0xD0;

    //PWMS1P1H 7; 
    PWM1S1P1H = 0x7;

    //PWMS1P2L 232; 
    PWM1S1P2L = 0xE8;

    //PWMS1P2H 3; 
    PWM1S1P2H = 0x3;
    
    //Clear PWM1_16BIT period interrupt flag
    PIR4bits.PWM1PIF = 0;
    
    //Clear PWM1_16BIT interrupt flag
    PIR4bits.PWM1IF = 0;
    
    //Clear PWM1_16BIT slice 1, output 1 interrupt flag
    PWM1GIRbits.S1P1IF = 0;
    
    //Clear PWM1_16BIT slice 1, output 2 interrupt flag
    PWM1GIRbits.S1P2IF = 0;
    
    //PWM1_16BIT interrupt enable bit
    PIE4bits.PWM1IE = 1;
    
    //PWM1_16BIT period interrupt enable bit
    PIE4bits.PWM1PIE = 0;
    
    //Set default interrupt handlers
    PWM1_16BIT_RC1_Slice1Output1_SetInterruptHandler(PWM1_16BIT_RC1_Slice1Output1_DefaultInterruptHandler);
    PWM1_16BIT_RC1_Slice1Output2_SetInterruptHandler(PWM1_16BIT_RC1_Slice1Output2_DefaultInterruptHandler);
    PWM1_16BIT_RC1_Period_SetInterruptHandler(PWM1_16BIT_RC1_Period_DefaultInterruptHandler);

    //PWMEN enabled; PWMLD disabled; PWMERSPOL disabled; PWMERSNOW disabled; 
    PWM1CON = 0x80;
}

void PWM1_16BIT_RC1_Enable()
{
    PWM1CON |= _PWM1CON_EN_MASK;
}

void PWM1_16BIT_RC1_Disable()
{
    PWM1CON &= (~_PWM1CON_EN_MASK);
}

void PWM1_16BIT_RC1_WritePeriodRegister(uint16_t periodCount)
{
    PWM1PRL = (uint8_t)periodCount;
    PWM1PRH= (uint8_t)(periodCount >> 8);
}

void PWM1_16BIT_RC1_SetSlice1Output1DutyCycleRegister(uint16_t registerValue)
{    
    PWM1S1P1L = (uint8_t)(registerValue);
    PWM1S1P1H = (uint8_t)(registerValue >> 8);
}

void PWM1_16BIT_RC1_SetSlice1Output2DutyCycleRegister(uint16_t registerValue)
{        
    PWM1S1P2L = (uint8_t)(registerValue);
    PWM1S1P2H = (uint8_t)(registerValue >> 8);
}

void PWM1_16BIT_RC1_LoadBufferRegisters(void)
{
    //Load the period and duty cycle registers on the next period event
    PWM1CONbits.LD = 1;
}

void __interrupt(irq(PWM1),base(8)) PWM1_16BIT_RC1_PWMI_ISR()
{
    PIR4bits.PWM1IF = 0;
    if((PWM1GIEbits.S1P1IE == 1) && (PWM1GIRbits.S1P1IF == 1))
    {
        PWM1GIRbits.S1P1IF = 0;
        if(PWM1_16BIT_RC1_Slice1Output1_InterruptHandler != NULL)
            PWM1_16BIT_RC1_Slice1Output1_InterruptHandler();
    }
    else if((PWM1GIEbits.S1P2IE == 1) && (PWM1GIRbits.S1P2IF == 1))
    {
        PWM1GIRbits.S1P2IF = 0;
        if(PWM1_16BIT_RC1_Slice1Output2_InterruptHandler != NULL)
            PWM1_16BIT_RC1_Slice1Output2_InterruptHandler();
    }
}

void __interrupt(irq(PWM1PR),base(8)) PWM1_16BIT_RC1_PWMPI_ISR()
{
    PIR4bits.PWM1PIF = 0;
    if(PWM1_16BIT_RC1_Period_InterruptHandler != NULL)
        PWM1_16BIT_RC1_Period_InterruptHandler();
}

void PWM1_16BIT_RC1_Slice1Output1_SetInterruptHandler(void (* InterruptHandler)(void))
{
    PWM1_16BIT_RC1_Slice1Output1_InterruptHandler = InterruptHandler;
}

void PWM1_16BIT_RC1_Slice1Output2_SetInterruptHandler(void (* InterruptHandler)(void))
{
    PWM1_16BIT_RC1_Slice1Output2_InterruptHandler = InterruptHandler;
}

void PWM1_16BIT_RC1_Period_SetInterruptHandler(void (* InterruptHandler)(void))
{
    PWM1_16BIT_RC1_Period_InterruptHandler = InterruptHandler;
}

static void PWM1_16BIT_RC1_Slice1Output1_DefaultInterruptHandler(void)
{
    //Add your interrupt code here or
    //Use PWM1_16BIT_RC1_Slice1Output1_SetInterruptHandler() function to use Custom ISR
}

static void PWM1_16BIT_RC1_Slice1Output2_DefaultInterruptHandler(void)
{
    //Add your interrupt code here or
    //Use PWM1_16BIT_RC1_Slice1Output2_SetInterruptHandler() function to use Custom ISR
}

static void PWM1_16BIT_RC1_Period_DefaultInterruptHandler(void)
{
    //Add your interrupt code here or
    //Use PWM1_16BIT_RC1_Period_SetInterruptHandler() function to use Custom ISR
}
