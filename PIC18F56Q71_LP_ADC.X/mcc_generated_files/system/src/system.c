/**
 * System Driver Source File
 * 
 * @file system.c
 * 
 * @ingroup systemdriver
 * 
 * @brief This file contains the API implementation for the System driver.
 *
 * @version Driver Version 1.0.3
 *
 * @version Package Version 1.0.4
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

#include "../system.h"

/** 
* @ingroup systemdriver
* @brief Initializes the CPU module.
* @param None.
* @return None.
*/
void CPU_Initialize(void);

void PMD_Initialize(void);


void SYSTEM_Initialize(void)
{
    CLOCK_Initialize();
    PIN_MANAGER_Initialize();
    ADC_Initialize();
    CPU_Initialize();
    PMD_Initialize();
    UART2_Initialize();
    APM_Initialize();
    INTERRUPT_Initialize();
}

void CPU_Initialize(void)
{
    //PR priority level 7; 
    SCANPR = 0x7;
    //PR priority level 7; 
    DMA1PR = 0x7;
    //PR priority level 7; 
    DMA2PR = 0x7;
    //PR priority level 7; 
    DMA3PR = 0x7;
    //PR priority level 7; 
    DMA4PR = 0x7;
    //PR priority level 7; 
    MAINPR = 0x7;
    //PR priority level 7; 
    ISRPR = 0x7;
    //PRODH undefined; 
    PRODH = 0x0;
    //PRODL undefined; 
    PRODL = 0x0;
    //PRLOCKED unlocked; 
    PRLOCK = 0x0;
}

void PMD_Initialize(void)
{
    //IOCMD IOC enabled; CLKRMD CLKR enabled; SCANMD SCANNER disabled; CRCMD CRC disabled; FVRMD FVR disabled; SYSCMD SYSCLK enabled; HLVDMD HLVD enabled; 
    PMD0 = 0x58;
    //TMR0MD TMR0 enabled; TMR1MD TMR1 disabled; TMR2MD TMR2 disabled; TMR3MD TMR3 disabled; TMR4MD TMR4 disabled; ZCDMD ZCD disabled; CM1MD CM1 disabled; APMMD APM enabled; 
    PMD1 = 0xDE;
    //ADCMD ADC enabled; DAC1MD DAC1 disabled; CWG1MD CWG1 disabled; CM2MD CM2 disabled; ACTMD ACT disabled; NCO1MD NCO1 disabled; CCP1MD CCP1 disabled; 
    PMD2 = 0xDD;
    //UART1MD UART1 disabled; UART2MD UART2 enabled; SPI1MD SPI1 enabled; I2C1MD I2C1 disabled; PWM1MD PWM1 disabled; PWM2MD PWM2 disabled; PWM3MD PWM3 disabled; 
    PMD3 = 0x4F;
    //CLC1MD CLC1 disabled; CLC2MD CLC2 disabled; CLC3MD CLC3 disabled; CLC4MD CLC4 disabled; DMA1MD DMA1 disabled; DMA2MD DMA2 disabled; DMA3MD DMA3 disabled; 
    PMD4 = 0xFE;
    //DMA4MD DMA4 disabled; DAC2MD DAC2 disabled; OPA1MD OPA1 disabled; OPA2MD OPA2 disabled; CLC5MD CLC5 disabled; CLC6MD CLC6 disabled; CLC7MD CLC7 disabled; CLC8MD CLC8 disabled; 
    PMD5 = 0xFF;
    //PORTWMD PORTW disabled; TU2MD UT16B disabled; TU1MD UT16A disabled; DAC3MD DAC3 disabled; CCP2MD CCP2 enabled; 
    PMD6 = 0xF;
}

