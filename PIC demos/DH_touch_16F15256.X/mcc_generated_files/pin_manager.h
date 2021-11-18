/**
  @Generated Pin Manager Header File

  @Company:
    Microchip Technology Inc.

  @File Name:
    pin_manager.h

  @Summary:
    This is the Pin Manager file generated using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  @Description
    This header file provides APIs for driver for .
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.81.7
        Device            :  PIC16F15256
        Driver Version    :  2.11
    The generated drivers are tested against the following:
        Compiler          :  XC8 2.31 and above
        MPLAB 	          :  MPLAB X 5.45	
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

#ifndef PIN_MANAGER_H
#define PIN_MANAGER_H

/**
  Section: Included Files
*/

#include <xc.h>

#define INPUT   1
#define OUTPUT  0

#define HIGH    1
#define LOW     0

#define ANALOG      1
#define DIGITAL     0

#define PULL_UP_ENABLED      1
#define PULL_UP_DISABLED     0

// get/set RA0 procedures
#define RA0_SetHigh()            do { LATAbits.LATA0 = 1; } while(0)
#define RA0_SetLow()             do { LATAbits.LATA0 = 0; } while(0)
#define RA0_Toggle()             do { LATAbits.LATA0 = ~LATAbits.LATA0; } while(0)
#define RA0_GetValue()              PORTAbits.RA0
#define RA0_SetDigitalInput()    do { TRISAbits.TRISA0 = 1; } while(0)
#define RA0_SetDigitalOutput()   do { TRISAbits.TRISA0 = 0; } while(0)
#define RA0_SetPullup()             do { WPUAbits.WPUA0 = 1; } while(0)
#define RA0_ResetPullup()           do { WPUAbits.WPUA0 = 0; } while(0)
#define RA0_SetAnalogMode()         do { ANSELAbits.ANSA0 = 1; } while(0)
#define RA0_SetDigitalMode()        do { ANSELAbits.ANSA0 = 0; } while(0)

// get/set RA1 procedures
#define RA1_SetHigh()            do { LATAbits.LATA1 = 1; } while(0)
#define RA1_SetLow()             do { LATAbits.LATA1 = 0; } while(0)
#define RA1_Toggle()             do { LATAbits.LATA1 = ~LATAbits.LATA1; } while(0)
#define RA1_GetValue()              PORTAbits.RA1
#define RA1_SetDigitalInput()    do { TRISAbits.TRISA1 = 1; } while(0)
#define RA1_SetDigitalOutput()   do { TRISAbits.TRISA1 = 0; } while(0)
#define RA1_SetPullup()             do { WPUAbits.WPUA1 = 1; } while(0)
#define RA1_ResetPullup()           do { WPUAbits.WPUA1 = 0; } while(0)
#define RA1_SetAnalogMode()         do { ANSELAbits.ANSA1 = 1; } while(0)
#define RA1_SetDigitalMode()        do { ANSELAbits.ANSA1 = 0; } while(0)

// get/set RA2 procedures
#define RA2_SetHigh()            do { LATAbits.LATA2 = 1; } while(0)
#define RA2_SetLow()             do { LATAbits.LATA2 = 0; } while(0)
#define RA2_Toggle()             do { LATAbits.LATA2 = ~LATAbits.LATA2; } while(0)
#define RA2_GetValue()              PORTAbits.RA2
#define RA2_SetDigitalInput()    do { TRISAbits.TRISA2 = 1; } while(0)
#define RA2_SetDigitalOutput()   do { TRISAbits.TRISA2 = 0; } while(0)
#define RA2_SetPullup()             do { WPUAbits.WPUA2 = 1; } while(0)
#define RA2_ResetPullup()           do { WPUAbits.WPUA2 = 0; } while(0)
#define RA2_SetAnalogMode()         do { ANSELAbits.ANSA2 = 1; } while(0)
#define RA2_SetDigitalMode()        do { ANSELAbits.ANSA2 = 0; } while(0)

// get/set RA3 procedures
#define RA3_SetHigh()            do { LATAbits.LATA3 = 1; } while(0)
#define RA3_SetLow()             do { LATAbits.LATA3 = 0; } while(0)
#define RA3_Toggle()             do { LATAbits.LATA3 = ~LATAbits.LATA3; } while(0)
#define RA3_GetValue()              PORTAbits.RA3
#define RA3_SetDigitalInput()    do { TRISAbits.TRISA3 = 1; } while(0)
#define RA3_SetDigitalOutput()   do { TRISAbits.TRISA3 = 0; } while(0)
#define RA3_SetPullup()             do { WPUAbits.WPUA3 = 1; } while(0)
#define RA3_ResetPullup()           do { WPUAbits.WPUA3 = 0; } while(0)
#define RA3_SetAnalogMode()         do { ANSELAbits.ANSA3 = 1; } while(0)
#define RA3_SetDigitalMode()        do { ANSELAbits.ANSA3 = 0; } while(0)

// get/set RA5 procedures
#define RA5_SetHigh()            do { LATAbits.LATA5 = 1; } while(0)
#define RA5_SetLow()             do { LATAbits.LATA5 = 0; } while(0)
#define RA5_Toggle()             do { LATAbits.LATA5 = ~LATAbits.LATA5; } while(0)
#define RA5_GetValue()              PORTAbits.RA5
#define RA5_SetDigitalInput()    do { TRISAbits.TRISA5 = 1; } while(0)
#define RA5_SetDigitalOutput()   do { TRISAbits.TRISA5 = 0; } while(0)
#define RA5_SetPullup()             do { WPUAbits.WPUA5 = 1; } while(0)
#define RA5_ResetPullup()           do { WPUAbits.WPUA5 = 0; } while(0)
#define RA5_SetAnalogMode()         do { ANSELAbits.ANSA5 = 1; } while(0)
#define RA5_SetDigitalMode()        do { ANSELAbits.ANSA5 = 0; } while(0)

// get/set IO_RB1_LED2 aliases
#define IO_RB1_LED2_TRIS                 TRISBbits.TRISB1
#define IO_RB1_LED2_LAT                  LATBbits.LATB1
#define IO_RB1_LED2_PORT                 PORTBbits.RB1
#define IO_RB1_LED2_WPU                  WPUBbits.WPUB1
#define IO_RB1_LED2_OD                   ODCONBbits.ODCB1
#define IO_RB1_LED2_ANS                  ANSELBbits.ANSB1
#define IO_RB1_LED2_SetHigh()            do { LATBbits.LATB1 = 1; } while(0)
#define IO_RB1_LED2_SetLow()             do { LATBbits.LATB1 = 0; } while(0)
#define IO_RB1_LED2_Toggle()             do { LATBbits.LATB1 = ~LATBbits.LATB1; } while(0)
#define IO_RB1_LED2_GetValue()           PORTBbits.RB1
#define IO_RB1_LED2_SetDigitalInput()    do { TRISBbits.TRISB1 = 1; } while(0)
#define IO_RB1_LED2_SetDigitalOutput()   do { TRISBbits.TRISB1 = 0; } while(0)
#define IO_RB1_LED2_SetPullup()          do { WPUBbits.WPUB1 = 1; } while(0)
#define IO_RB1_LED2_ResetPullup()        do { WPUBbits.WPUB1 = 0; } while(0)
#define IO_RB1_LED2_SetPushPull()        do { ODCONBbits.ODCB1 = 0; } while(0)
#define IO_RB1_LED2_SetOpenDrain()       do { ODCONBbits.ODCB1 = 1; } while(0)
#define IO_RB1_LED2_SetAnalogMode()      do { ANSELBbits.ANSB1 = 1; } while(0)
#define IO_RB1_LED2_SetDigitalMode()     do { ANSELBbits.ANSB1 = 0; } while(0)

// get/set IO_RB2_LED3 aliases
#define IO_RB2_LED3_TRIS                 TRISBbits.TRISB2
#define IO_RB2_LED3_LAT                  LATBbits.LATB2
#define IO_RB2_LED3_PORT                 PORTBbits.RB2
#define IO_RB2_LED3_WPU                  WPUBbits.WPUB2
#define IO_RB2_LED3_OD                   ODCONBbits.ODCB2
#define IO_RB2_LED3_ANS                  ANSELBbits.ANSB2
#define IO_RB2_LED3_SetHigh()            do { LATBbits.LATB2 = 1; } while(0)
#define IO_RB2_LED3_SetLow()             do { LATBbits.LATB2 = 0; } while(0)
#define IO_RB2_LED3_Toggle()             do { LATBbits.LATB2 = ~LATBbits.LATB2; } while(0)
#define IO_RB2_LED3_GetValue()           PORTBbits.RB2
#define IO_RB2_LED3_SetDigitalInput()    do { TRISBbits.TRISB2 = 1; } while(0)
#define IO_RB2_LED3_SetDigitalOutput()   do { TRISBbits.TRISB2 = 0; } while(0)
#define IO_RB2_LED3_SetPullup()          do { WPUBbits.WPUB2 = 1; } while(0)
#define IO_RB2_LED3_ResetPullup()        do { WPUBbits.WPUB2 = 0; } while(0)
#define IO_RB2_LED3_SetPushPull()        do { ODCONBbits.ODCB2 = 0; } while(0)
#define IO_RB2_LED3_SetOpenDrain()       do { ODCONBbits.ODCB2 = 1; } while(0)
#define IO_RB2_LED3_SetAnalogMode()      do { ANSELBbits.ANSB2 = 1; } while(0)
#define IO_RB2_LED3_SetDigitalMode()     do { ANSELBbits.ANSB2 = 0; } while(0)

// get/set IO_RB3_LED4 aliases
#define IO_RB3_LED4_TRIS                 TRISBbits.TRISB3
#define IO_RB3_LED4_LAT                  LATBbits.LATB3
#define IO_RB3_LED4_PORT                 PORTBbits.RB3
#define IO_RB3_LED4_WPU                  WPUBbits.WPUB3
#define IO_RB3_LED4_OD                   ODCONBbits.ODCB3
#define IO_RB3_LED4_ANS                  ANSELBbits.ANSB3
#define IO_RB3_LED4_SetHigh()            do { LATBbits.LATB3 = 1; } while(0)
#define IO_RB3_LED4_SetLow()             do { LATBbits.LATB3 = 0; } while(0)
#define IO_RB3_LED4_Toggle()             do { LATBbits.LATB3 = ~LATBbits.LATB3; } while(0)
#define IO_RB3_LED4_GetValue()           PORTBbits.RB3
#define IO_RB3_LED4_SetDigitalInput()    do { TRISBbits.TRISB3 = 1; } while(0)
#define IO_RB3_LED4_SetDigitalOutput()   do { TRISBbits.TRISB3 = 0; } while(0)
#define IO_RB3_LED4_SetPullup()          do { WPUBbits.WPUB3 = 1; } while(0)
#define IO_RB3_LED4_ResetPullup()        do { WPUBbits.WPUB3 = 0; } while(0)
#define IO_RB3_LED4_SetPushPull()        do { ODCONBbits.ODCB3 = 0; } while(0)
#define IO_RB3_LED4_SetOpenDrain()       do { ODCONBbits.ODCB3 = 1; } while(0)
#define IO_RB3_LED4_SetAnalogMode()      do { ANSELBbits.ANSB3 = 1; } while(0)
#define IO_RB3_LED4_SetDigitalMode()     do { ANSELBbits.ANSB3 = 0; } while(0)

// get/set IO_RB4_LED5 aliases
#define IO_RB4_LED5_TRIS                 TRISBbits.TRISB4
#define IO_RB4_LED5_LAT                  LATBbits.LATB4
#define IO_RB4_LED5_PORT                 PORTBbits.RB4
#define IO_RB4_LED5_WPU                  WPUBbits.WPUB4
#define IO_RB4_LED5_OD                   ODCONBbits.ODCB4
#define IO_RB4_LED5_ANS                  ANSELBbits.ANSB4
#define IO_RB4_LED5_SetHigh()            do { LATBbits.LATB4 = 1; } while(0)
#define IO_RB4_LED5_SetLow()             do { LATBbits.LATB4 = 0; } while(0)
#define IO_RB4_LED5_Toggle()             do { LATBbits.LATB4 = ~LATBbits.LATB4; } while(0)
#define IO_RB4_LED5_GetValue()           PORTBbits.RB4
#define IO_RB4_LED5_SetDigitalInput()    do { TRISBbits.TRISB4 = 1; } while(0)
#define IO_RB4_LED5_SetDigitalOutput()   do { TRISBbits.TRISB4 = 0; } while(0)
#define IO_RB4_LED5_SetPullup()          do { WPUBbits.WPUB4 = 1; } while(0)
#define IO_RB4_LED5_ResetPullup()        do { WPUBbits.WPUB4 = 0; } while(0)
#define IO_RB4_LED5_SetPushPull()        do { ODCONBbits.ODCB4 = 0; } while(0)
#define IO_RB4_LED5_SetOpenDrain()       do { ODCONBbits.ODCB4 = 1; } while(0)
#define IO_RB4_LED5_SetAnalogMode()      do { ANSELBbits.ANSB4 = 1; } while(0)
#define IO_RB4_LED5_SetDigitalMode()     do { ANSELBbits.ANSB4 = 0; } while(0)

// get/set IO_RB6_PCLK aliases
#define IO_RB6_PCLK_TRIS                 TRISBbits.TRISB6
#define IO_RB6_PCLK_LAT                  LATBbits.LATB6
#define IO_RB6_PCLK_PORT                 PORTBbits.RB6
#define IO_RB6_PCLK_WPU                  WPUBbits.WPUB6
#define IO_RB6_PCLK_OD                   ODCONBbits.ODCB6
#define IO_RB6_PCLK_ANS                  ANSELBbits.ANSB6
#define IO_RB6_PCLK_SetHigh()            do { LATBbits.LATB6 = 1; } while(0)
#define IO_RB6_PCLK_SetLow()             do { LATBbits.LATB6 = 0; } while(0)
#define IO_RB6_PCLK_Toggle()             do { LATBbits.LATB6 = ~LATBbits.LATB6; } while(0)
#define IO_RB6_PCLK_GetValue()           PORTBbits.RB6
#define IO_RB6_PCLK_SetDigitalInput()    do { TRISBbits.TRISB6 = 1; } while(0)
#define IO_RB6_PCLK_SetDigitalOutput()   do { TRISBbits.TRISB6 = 0; } while(0)
#define IO_RB6_PCLK_SetPullup()          do { WPUBbits.WPUB6 = 1; } while(0)
#define IO_RB6_PCLK_ResetPullup()        do { WPUBbits.WPUB6 = 0; } while(0)
#define IO_RB6_PCLK_SetPushPull()        do { ODCONBbits.ODCB6 = 0; } while(0)
#define IO_RB6_PCLK_SetOpenDrain()       do { ODCONBbits.ODCB6 = 1; } while(0)
#define IO_RB6_PCLK_SetAnalogMode()      do { ANSELBbits.ANSB6 = 1; } while(0)
#define IO_RB6_PCLK_SetDigitalMode()     do { ANSELBbits.ANSB6 = 0; } while(0)

// get/set IO_RB7_PDAT aliases
#define IO_RB7_PDAT_TRIS                 TRISBbits.TRISB7
#define IO_RB7_PDAT_LAT                  LATBbits.LATB7
#define IO_RB7_PDAT_PORT                 PORTBbits.RB7
#define IO_RB7_PDAT_WPU                  WPUBbits.WPUB7
#define IO_RB7_PDAT_OD                   ODCONBbits.ODCB7
#define IO_RB7_PDAT_ANS                  ANSELBbits.ANSB7
#define IO_RB7_PDAT_SetHigh()            do { LATBbits.LATB7 = 1; } while(0)
#define IO_RB7_PDAT_SetLow()             do { LATBbits.LATB7 = 0; } while(0)
#define IO_RB7_PDAT_Toggle()             do { LATBbits.LATB7 = ~LATBbits.LATB7; } while(0)
#define IO_RB7_PDAT_GetValue()           PORTBbits.RB7
#define IO_RB7_PDAT_SetDigitalInput()    do { TRISBbits.TRISB7 = 1; } while(0)
#define IO_RB7_PDAT_SetDigitalOutput()   do { TRISBbits.TRISB7 = 0; } while(0)
#define IO_RB7_PDAT_SetPullup()          do { WPUBbits.WPUB7 = 1; } while(0)
#define IO_RB7_PDAT_ResetPullup()        do { WPUBbits.WPUB7 = 0; } while(0)
#define IO_RB7_PDAT_SetPushPull()        do { ODCONBbits.ODCB7 = 0; } while(0)
#define IO_RB7_PDAT_SetOpenDrain()       do { ODCONBbits.ODCB7 = 1; } while(0)
#define IO_RB7_PDAT_SetAnalogMode()      do { ANSELBbits.ANSB7 = 1; } while(0)
#define IO_RB7_PDAT_SetDigitalMode()     do { ANSELBbits.ANSB7 = 0; } while(0)

// get/set RC3 procedures
#define RC3_SetHigh()            do { LATCbits.LATC3 = 1; } while(0)
#define RC3_SetLow()             do { LATCbits.LATC3 = 0; } while(0)
#define RC3_Toggle()             do { LATCbits.LATC3 = ~LATCbits.LATC3; } while(0)
#define RC3_GetValue()              PORTCbits.RC3
#define RC3_SetDigitalInput()    do { TRISCbits.TRISC3 = 1; } while(0)
#define RC3_SetDigitalOutput()   do { TRISCbits.TRISC3 = 0; } while(0)
#define RC3_SetPullup()             do { WPUCbits.WPUC3 = 1; } while(0)
#define RC3_ResetPullup()           do { WPUCbits.WPUC3 = 0; } while(0)
#define RC3_SetAnalogMode()         do { ANSELCbits.ANSC3 = 1; } while(0)
#define RC3_SetDigitalMode()        do { ANSELCbits.ANSC3 = 0; } while(0)

// get/set RC4 procedures
#define RC4_SetHigh()            do { LATCbits.LATC4 = 1; } while(0)
#define RC4_SetLow()             do { LATCbits.LATC4 = 0; } while(0)
#define RC4_Toggle()             do { LATCbits.LATC4 = ~LATCbits.LATC4; } while(0)
#define RC4_GetValue()              PORTCbits.RC4
#define RC4_SetDigitalInput()    do { TRISCbits.TRISC4 = 1; } while(0)
#define RC4_SetDigitalOutput()   do { TRISCbits.TRISC4 = 0; } while(0)
#define RC4_SetPullup()             do { WPUCbits.WPUC4 = 1; } while(0)
#define RC4_ResetPullup()           do { WPUCbits.WPUC4 = 0; } while(0)
#define RC4_SetAnalogMode()         do { ANSELCbits.ANSC4 = 1; } while(0)
#define RC4_SetDigitalMode()        do { ANSELCbits.ANSC4 = 0; } while(0)

// get/set RC6 procedures
#define RC6_SetHigh()            do { LATCbits.LATC6 = 1; } while(0)
#define RC6_SetLow()             do { LATCbits.LATC6 = 0; } while(0)
#define RC6_Toggle()             do { LATCbits.LATC6 = ~LATCbits.LATC6; } while(0)
#define RC6_GetValue()              PORTCbits.RC6
#define RC6_SetDigitalInput()    do { TRISCbits.TRISC6 = 1; } while(0)
#define RC6_SetDigitalOutput()   do { TRISCbits.TRISC6 = 0; } while(0)
#define RC6_SetPullup()             do { WPUCbits.WPUC6 = 1; } while(0)
#define RC6_ResetPullup()           do { WPUCbits.WPUC6 = 0; } while(0)
#define RC6_SetAnalogMode()         do { ANSELCbits.ANSC6 = 1; } while(0)
#define RC6_SetDigitalMode()        do { ANSELCbits.ANSC6 = 0; } while(0)

// get/set IO_RC7_LED1 aliases
#define IO_RC7_LED1_TRIS                 TRISCbits.TRISC7
#define IO_RC7_LED1_LAT                  LATCbits.LATC7
#define IO_RC7_LED1_PORT                 PORTCbits.RC7
#define IO_RC7_LED1_WPU                  WPUCbits.WPUC7
#define IO_RC7_LED1_OD                   ODCONCbits.ODCC7
#define IO_RC7_LED1_ANS                  ANSELCbits.ANSC7
#define IO_RC7_LED1_SetHigh()            do { LATCbits.LATC7 = 1; } while(0)
#define IO_RC7_LED1_SetLow()             do { LATCbits.LATC7 = 0; } while(0)
#define IO_RC7_LED1_Toggle()             do { LATCbits.LATC7 = ~LATCbits.LATC7; } while(0)
#define IO_RC7_LED1_GetValue()           PORTCbits.RC7
#define IO_RC7_LED1_SetDigitalInput()    do { TRISCbits.TRISC7 = 1; } while(0)
#define IO_RC7_LED1_SetDigitalOutput()   do { TRISCbits.TRISC7 = 0; } while(0)
#define IO_RC7_LED1_SetPullup()          do { WPUCbits.WPUC7 = 1; } while(0)
#define IO_RC7_LED1_ResetPullup()        do { WPUCbits.WPUC7 = 0; } while(0)
#define IO_RC7_LED1_SetPushPull()        do { ODCONCbits.ODCC7 = 0; } while(0)
#define IO_RC7_LED1_SetOpenDrain()       do { ODCONCbits.ODCC7 = 1; } while(0)
#define IO_RC7_LED1_SetAnalogMode()      do { ANSELCbits.ANSC7 = 1; } while(0)
#define IO_RC7_LED1_SetDigitalMode()     do { ANSELCbits.ANSC7 = 0; } while(0)

/**
   @Param
    none
   @Returns
    none
   @Description
    GPIO and peripheral I/O initialization
   @Example
    PIN_MANAGER_Initialize();
 */
void PIN_MANAGER_Initialize (void);

/**
 * @Param
    none
 * @Returns
    none
 * @Description
    Interrupt on Change Handling routine
 * @Example
    PIN_MANAGER_IOC();
 */
void PIN_MANAGER_IOC(void);



#endif // PIN_MANAGER_H
/**
 End of File
*/