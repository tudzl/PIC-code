/**
 * TMR0 Generated Timer Driver File
 * 
 * @file tmr0.c
 * 
 * @ingroup timerdriver
 * 
 * @brief Timer Driver implementation for the TMR0 driver
 *
 * @version TMR0 Timer Driver Version 3.0.0
 *
 * @version Package Version 5.0.0
*/
/*
� [2025] Microchip Technology Inc. and its subsidiaries.

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

#include <xc.h>
#include "../tmr0.h"

extern uint16_t TMR0_INT_cnt;

const struct TIMER_INTERFACE Timer0 = {
    .Initialize = TMR0_Initialize,
    .Deinitialize = TMR0_Deinitialize,
    .Start = TMR0_Start,
    .Stop = TMR0_Stop,
    .PeriodSet = TMR0_PeriodSet,
    .PeriodGet = TMR0_PeriodGet,
    .CounterGet = TMR0_CounterGet,
    .CounterSet = TMR0_CounterSet,
    .MaxCountGet = TMR0_MaxCountGet,
    .TimeoutCallbackRegister = TMR0_OverflowCallbackRegister,
    .Tasks = NULL
};

static volatile uint16_t tmr0PeriodCount;
static void (*TMR0_OverflowCallback)(void);
static void TMR0_DefaultOverflowCallback(void);

/**
  Section: TMR0 APIs
*/ 

void TMR0_Initialize(void)
{
    TMR0H = 0xE7;                    // Period 100ms; Frequency 62500Hz; Count 59286
    TMR0L = 0x96;
    
    T0CON1 = (2 << _T0CON1_T0CS_POSN)   // T0CS FOSC/4
        | (7 << _T0CON1_T0CKPS_POSN)   // T0CKPS 1:128
        | (1 << _T0CON1_T0ASYNC_POSN);  // T0ASYNC not_synchronised
    
    tmr0PeriodCount = ((uint16_t)TMR0H << 8) | TMR0L;
    
    TMR0_OverflowCallback = TMR0_DefaultOverflowCallback;
    
    PIR0bits.TMR0IF = 0;	   
    PIE0bits.TMR0IE = 1;	

    T0CON0 = (0 << _T0CON0_T0OUTPS_POSN)   // T0OUTPS 1:1
        | (1 << _T0CON0_T0EN_POSN)   // T0EN enabled
        | (1 << _T0CON0_T016BIT_POSN);  // T016BIT 16-bit
}

void TMR0_Deinitialize(void)
{
    T0CON0bits.T0EN = 0;
    
    PIR0bits.TMR0IF = 0;	   
    PIE0bits.TMR0IE = 0;		
    
    T0CON0 = 0x0;
    T0CON1 = 0x0;
    TMR0H = 0xFF;
    TMR0L =0x0;
}

void TMR0_Start(void)
{
    T0CON0bits.T0EN = 1;
}

void TMR0_Stop(void)
{
    T0CON0bits.T0EN = 0;
}

uint32_t TMR0_CounterGet(void)
{
    uint16_t counterValue;
    uint8_t counterLowByte;
    uint8_t counterHighByte;

    counterLowByte  = TMR0L;
    counterHighByte = TMR0H;
    counterValue  = ((uint16_t)counterHighByte << 8) + counterLowByte;

    return (uint32_t)counterValue;
}

void TMR0_CounterSet(uint32_t counterValue)
{
    TMR0H = (uint8_t)(counterValue >> 8);
    TMR0L = (uint8_t)(counterValue);
}

void TMR0_PeriodSet(uint32_t periodCount)
{
   tmr0PeriodCount = TMR0_MAX_COUNT - (uint16_t)periodCount;
  
   TMR0H = (uint8_t)(tmr0PeriodCount >> 8);
   TMR0L = (uint8_t)(tmr0PeriodCount);
}

uint32_t TMR0_PeriodGet(void)
{
    return ((uint32_t)TMR0_MAX_COUNT - tmr0PeriodCount);
}

uint32_t TMR0_MaxCountGet(void)
{
    return (uint32_t)TMR0_MAX_COUNT;
}

void TMR0_ISR(void)
{
    TMR0H = (uint8_t)(tmr0PeriodCount >> 8);
    TMR0L = (uint8_t)(tmr0PeriodCount);

    if(NULL != TMR0_OverflowCallback)
    {
        TMR0_OverflowCallback();
    }
    PIR0bits.TMR0IF = 0;
}

void TMR0_OverflowCallbackRegister(void (* callbackHandler)(void))
{
    TMR0_OverflowCallback = callbackHandler;
}

static void TMR0_DefaultOverflowCallback(void)
{
    // Default interrupt handler
    
    TMR0_INT_cnt ++;
}