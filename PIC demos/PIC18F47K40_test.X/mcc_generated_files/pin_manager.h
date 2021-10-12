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
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.78.1
        Device            :  PIC18F47K40
        Driver Version    :  2.11
    The generated drivers are tested against the following:
        Compiler          :  XC8 2.10 and above
        MPLAB 	          :  MPLAB X 5.30	
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
#define RA0_SetAnalogMode()         do { ANSELAbits.ANSELA0 = 1; } while(0)
#define RA0_SetDigitalMode()        do { ANSELAbits.ANSELA0 = 0; } while(0)

// get/set RA1 procedures
#define RA1_SetHigh()            do { LATAbits.LATA1 = 1; } while(0)
#define RA1_SetLow()             do { LATAbits.LATA1 = 0; } while(0)
#define RA1_Toggle()             do { LATAbits.LATA1 = ~LATAbits.LATA1; } while(0)
#define RA1_GetValue()              PORTAbits.RA1
#define RA1_SetDigitalInput()    do { TRISAbits.TRISA1 = 1; } while(0)
#define RA1_SetDigitalOutput()   do { TRISAbits.TRISA1 = 0; } while(0)
#define RA1_SetPullup()             do { WPUAbits.WPUA1 = 1; } while(0)
#define RA1_ResetPullup()           do { WPUAbits.WPUA1 = 0; } while(0)
#define RA1_SetAnalogMode()         do { ANSELAbits.ANSELA1 = 1; } while(0)
#define RA1_SetDigitalMode()        do { ANSELAbits.ANSELA1 = 0; } while(0)

// get/set RA2 procedures
#define RA2_SetHigh()            do { LATAbits.LATA2 = 1; } while(0)
#define RA2_SetLow()             do { LATAbits.LATA2 = 0; } while(0)
#define RA2_Toggle()             do { LATAbits.LATA2 = ~LATAbits.LATA2; } while(0)
#define RA2_GetValue()              PORTAbits.RA2
#define RA2_SetDigitalInput()    do { TRISAbits.TRISA2 = 1; } while(0)
#define RA2_SetDigitalOutput()   do { TRISAbits.TRISA2 = 0; } while(0)
#define RA2_SetPullup()             do { WPUAbits.WPUA2 = 1; } while(0)
#define RA2_ResetPullup()           do { WPUAbits.WPUA2 = 0; } while(0)
#define RA2_SetAnalogMode()         do { ANSELAbits.ANSELA2 = 1; } while(0)
#define RA2_SetDigitalMode()        do { ANSELAbits.ANSELA2 = 0; } while(0)

// get/set IO_RA4_Pixel1 aliases
#define IO_RA4_Pixel1_TRIS                 TRISAbits.TRISA4
#define IO_RA4_Pixel1_LAT                  LATAbits.LATA4
#define IO_RA4_Pixel1_PORT                 PORTAbits.RA4
#define IO_RA4_Pixel1_WPU                  WPUAbits.WPUA4
#define IO_RA4_Pixel1_OD                   ODCONAbits.ODCA4
#define IO_RA4_Pixel1_ANS                  ANSELAbits.ANSELA4
#define IO_RA4_Pixel1_SetHigh()            do { LATAbits.LATA4 = 1; } while(0)
#define IO_RA4_Pixel1_SetLow()             do { LATAbits.LATA4 = 0; } while(0)
#define IO_RA4_Pixel1_Toggle()             do { LATAbits.LATA4 = ~LATAbits.LATA4; } while(0)
#define IO_RA4_Pixel1_GetValue()           PORTAbits.RA4
#define IO_RA4_Pixel1_SetDigitalInput()    do { TRISAbits.TRISA4 = 1; } while(0)
#define IO_RA4_Pixel1_SetDigitalOutput()   do { TRISAbits.TRISA4 = 0; } while(0)
#define IO_RA4_Pixel1_SetPullup()          do { WPUAbits.WPUA4 = 1; } while(0)
#define IO_RA4_Pixel1_ResetPullup()        do { WPUAbits.WPUA4 = 0; } while(0)
#define IO_RA4_Pixel1_SetPushPull()        do { ODCONAbits.ODCA4 = 0; } while(0)
#define IO_RA4_Pixel1_SetOpenDrain()       do { ODCONAbits.ODCA4 = 1; } while(0)
#define IO_RA4_Pixel1_SetAnalogMode()      do { ANSELAbits.ANSELA4 = 1; } while(0)
#define IO_RA4_Pixel1_SetDigitalMode()     do { ANSELAbits.ANSELA4 = 0; } while(0)

// get/set IO_RA5_Pixel2 aliases
#define IO_RA5_Pixel2_TRIS                 TRISAbits.TRISA5
#define IO_RA5_Pixel2_LAT                  LATAbits.LATA5
#define IO_RA5_Pixel2_PORT                 PORTAbits.RA5
#define IO_RA5_Pixel2_WPU                  WPUAbits.WPUA5
#define IO_RA5_Pixel2_OD                   ODCONAbits.ODCA5
#define IO_RA5_Pixel2_ANS                  ANSELAbits.ANSELA5
#define IO_RA5_Pixel2_SetHigh()            do { LATAbits.LATA5 = 1; } while(0)
#define IO_RA5_Pixel2_SetLow()             do { LATAbits.LATA5 = 0; } while(0)
#define IO_RA5_Pixel2_Toggle()             do { LATAbits.LATA5 = ~LATAbits.LATA5; } while(0)
#define IO_RA5_Pixel2_GetValue()           PORTAbits.RA5
#define IO_RA5_Pixel2_SetDigitalInput()    do { TRISAbits.TRISA5 = 1; } while(0)
#define IO_RA5_Pixel2_SetDigitalOutput()   do { TRISAbits.TRISA5 = 0; } while(0)
#define IO_RA5_Pixel2_SetPullup()          do { WPUAbits.WPUA5 = 1; } while(0)
#define IO_RA5_Pixel2_ResetPullup()        do { WPUAbits.WPUA5 = 0; } while(0)
#define IO_RA5_Pixel2_SetPushPull()        do { ODCONAbits.ODCA5 = 0; } while(0)
#define IO_RA5_Pixel2_SetOpenDrain()       do { ODCONAbits.ODCA5 = 1; } while(0)
#define IO_RA5_Pixel2_SetAnalogMode()      do { ANSELAbits.ANSELA5 = 1; } while(0)
#define IO_RA5_Pixel2_SetDigitalMode()     do { ANSELAbits.ANSELA5 = 0; } while(0)

// get/set RC0 procedures
#define RC0_SetHigh()            do { LATCbits.LATC0 = 1; } while(0)
#define RC0_SetLow()             do { LATCbits.LATC0 = 0; } while(0)
#define RC0_Toggle()             do { LATCbits.LATC0 = ~LATCbits.LATC0; } while(0)
#define RC0_GetValue()              PORTCbits.RC0
#define RC0_SetDigitalInput()    do { TRISCbits.TRISC0 = 1; } while(0)
#define RC0_SetDigitalOutput()   do { TRISCbits.TRISC0 = 0; } while(0)
#define RC0_SetPullup()             do { WPUCbits.WPUC0 = 1; } while(0)
#define RC0_ResetPullup()           do { WPUCbits.WPUC0 = 0; } while(0)
#define RC0_SetAnalogMode()         do { ANSELCbits.ANSELC0 = 1; } while(0)
#define RC0_SetDigitalMode()        do { ANSELCbits.ANSELC0 = 0; } while(0)

// get/set RC1 procedures
#define RC1_SetHigh()            do { LATCbits.LATC1 = 1; } while(0)
#define RC1_SetLow()             do { LATCbits.LATC1 = 0; } while(0)
#define RC1_Toggle()             do { LATCbits.LATC1 = ~LATCbits.LATC1; } while(0)
#define RC1_GetValue()              PORTCbits.RC1
#define RC1_SetDigitalInput()    do { TRISCbits.TRISC1 = 1; } while(0)
#define RC1_SetDigitalOutput()   do { TRISCbits.TRISC1 = 0; } while(0)
#define RC1_SetPullup()             do { WPUCbits.WPUC1 = 1; } while(0)
#define RC1_ResetPullup()           do { WPUCbits.WPUC1 = 0; } while(0)
#define RC1_SetAnalogMode()         do { ANSELCbits.ANSELC1 = 1; } while(0)
#define RC1_SetDigitalMode()        do { ANSELCbits.ANSELC1 = 0; } while(0)

// get/set RC4 procedures
#define RC4_SetHigh()            do { LATCbits.LATC4 = 1; } while(0)
#define RC4_SetLow()             do { LATCbits.LATC4 = 0; } while(0)
#define RC4_Toggle()             do { LATCbits.LATC4 = ~LATCbits.LATC4; } while(0)
#define RC4_GetValue()              PORTCbits.RC4
#define RC4_SetDigitalInput()    do { TRISCbits.TRISC4 = 1; } while(0)
#define RC4_SetDigitalOutput()   do { TRISCbits.TRISC4 = 0; } while(0)
#define RC4_SetPullup()             do { WPUCbits.WPUC4 = 1; } while(0)
#define RC4_ResetPullup()           do { WPUCbits.WPUC4 = 0; } while(0)
#define RC4_SetAnalogMode()         do { ANSELCbits.ANSELC4 = 1; } while(0)
#define RC4_SetDigitalMode()        do { ANSELCbits.ANSELC4 = 0; } while(0)

// get/set RC5 procedures
#define RC5_SetHigh()            do { LATCbits.LATC5 = 1; } while(0)
#define RC5_SetLow()             do { LATCbits.LATC5 = 0; } while(0)
#define RC5_Toggle()             do { LATCbits.LATC5 = ~LATCbits.LATC5; } while(0)
#define RC5_GetValue()              PORTCbits.RC5
#define RC5_SetDigitalInput()    do { TRISCbits.TRISC5 = 1; } while(0)
#define RC5_SetDigitalOutput()   do { TRISCbits.TRISC5 = 0; } while(0)
#define RC5_SetPullup()             do { WPUCbits.WPUC5 = 1; } while(0)
#define RC5_ResetPullup()           do { WPUCbits.WPUC5 = 0; } while(0)
#define RC5_SetAnalogMode()         do { ANSELCbits.ANSELC5 = 1; } while(0)
#define RC5_SetDigitalMode()        do { ANSELCbits.ANSELC5 = 0; } while(0)

// get/set RC6 procedures
#define RC6_SetHigh()            do { LATCbits.LATC6 = 1; } while(0)
#define RC6_SetLow()             do { LATCbits.LATC6 = 0; } while(0)
#define RC6_Toggle()             do { LATCbits.LATC6 = ~LATCbits.LATC6; } while(0)
#define RC6_GetValue()              PORTCbits.RC6
#define RC6_SetDigitalInput()    do { TRISCbits.TRISC6 = 1; } while(0)
#define RC6_SetDigitalOutput()   do { TRISCbits.TRISC6 = 0; } while(0)
#define RC6_SetPullup()             do { WPUCbits.WPUC6 = 1; } while(0)
#define RC6_ResetPullup()           do { WPUCbits.WPUC6 = 0; } while(0)
#define RC6_SetAnalogMode()         do { ANSELCbits.ANSELC6 = 1; } while(0)
#define RC6_SetDigitalMode()        do { ANSELCbits.ANSELC6 = 0; } while(0)

// get/set IO_RD0_LCD_CD aliases
#define IO_RD0_LCD_CD_TRIS                 TRISDbits.TRISD0
#define IO_RD0_LCD_CD_LAT                  LATDbits.LATD0
#define IO_RD0_LCD_CD_PORT                 PORTDbits.RD0
#define IO_RD0_LCD_CD_WPU                  WPUDbits.WPUD0
#define IO_RD0_LCD_CD_OD                   ODCONDbits.ODCD0
#define IO_RD0_LCD_CD_ANS                  ANSELDbits.ANSELD0
#define IO_RD0_LCD_CD_SetHigh()            do { LATDbits.LATD0 = 1; } while(0)
#define IO_RD0_LCD_CD_SetLow()             do { LATDbits.LATD0 = 0; } while(0)
#define IO_RD0_LCD_CD_Toggle()             do { LATDbits.LATD0 = ~LATDbits.LATD0; } while(0)
#define IO_RD0_LCD_CD_GetValue()           PORTDbits.RD0
#define IO_RD0_LCD_CD_SetDigitalInput()    do { TRISDbits.TRISD0 = 1; } while(0)
#define IO_RD0_LCD_CD_SetDigitalOutput()   do { TRISDbits.TRISD0 = 0; } while(0)
#define IO_RD0_LCD_CD_SetPullup()          do { WPUDbits.WPUD0 = 1; } while(0)
#define IO_RD0_LCD_CD_ResetPullup()        do { WPUDbits.WPUD0 = 0; } while(0)
#define IO_RD0_LCD_CD_SetPushPull()        do { ODCONDbits.ODCD0 = 0; } while(0)
#define IO_RD0_LCD_CD_SetOpenDrain()       do { ODCONDbits.ODCD0 = 1; } while(0)
#define IO_RD0_LCD_CD_SetAnalogMode()      do { ANSELDbits.ANSELD0 = 1; } while(0)
#define IO_RD0_LCD_CD_SetDigitalMode()     do { ANSELDbits.ANSELD0 = 0; } while(0)

// get/set IO_RD1_LCD_RST aliases
#define IO_RD1_LCD_RST_TRIS                 TRISDbits.TRISD1
#define IO_RD1_LCD_RST_LAT                  LATDbits.LATD1
#define IO_RD1_LCD_RST_PORT                 PORTDbits.RD1
#define IO_RD1_LCD_RST_WPU                  WPUDbits.WPUD1
#define IO_RD1_LCD_RST_OD                   ODCONDbits.ODCD1
#define IO_RD1_LCD_RST_ANS                  ANSELDbits.ANSELD1
#define IO_RD1_LCD_RST_SetHigh()            do { LATDbits.LATD1 = 1; } while(0)
#define IO_RD1_LCD_RST_SetLow()             do { LATDbits.LATD1 = 0; } while(0)
#define IO_RD1_LCD_RST_Toggle()             do { LATDbits.LATD1 = ~LATDbits.LATD1; } while(0)
#define IO_RD1_LCD_RST_GetValue()           PORTDbits.RD1
#define IO_RD1_LCD_RST_SetDigitalInput()    do { TRISDbits.TRISD1 = 1; } while(0)
#define IO_RD1_LCD_RST_SetDigitalOutput()   do { TRISDbits.TRISD1 = 0; } while(0)
#define IO_RD1_LCD_RST_SetPullup()          do { WPUDbits.WPUD1 = 1; } while(0)
#define IO_RD1_LCD_RST_ResetPullup()        do { WPUDbits.WPUD1 = 0; } while(0)
#define IO_RD1_LCD_RST_SetPushPull()        do { ODCONDbits.ODCD1 = 0; } while(0)
#define IO_RD1_LCD_RST_SetOpenDrain()       do { ODCONDbits.ODCD1 = 1; } while(0)
#define IO_RD1_LCD_RST_SetAnalogMode()      do { ANSELDbits.ANSELD1 = 1; } while(0)
#define IO_RD1_LCD_RST_SetDigitalMode()     do { ANSELDbits.ANSELD1 = 0; } while(0)

// get/set IO_RE0_LED aliases
#define IO_RE0_LED_TRIS                 TRISEbits.TRISE0
#define IO_RE0_LED_LAT                  LATEbits.LATE0
#define IO_RE0_LED_PORT                 PORTEbits.RE0
#define IO_RE0_LED_WPU                  WPUEbits.WPUE0
#define IO_RE0_LED_OD                   ODCONEbits.ODCE0
#define IO_RE0_LED_ANS                  ANSELEbits.ANSELE0
#define IO_RE0_LED_SetHigh()            do { LATEbits.LATE0 = 1; } while(0)
#define IO_RE0_LED_SetLow()             do { LATEbits.LATE0 = 0; } while(0)
#define IO_RE0_LED_Toggle()             do { LATEbits.LATE0 = ~LATEbits.LATE0; } while(0)
#define IO_RE0_LED_GetValue()           PORTEbits.RE0
#define IO_RE0_LED_SetDigitalInput()    do { TRISEbits.TRISE0 = 1; } while(0)
#define IO_RE0_LED_SetDigitalOutput()   do { TRISEbits.TRISE0 = 0; } while(0)
#define IO_RE0_LED_SetPullup()          do { WPUEbits.WPUE0 = 1; } while(0)
#define IO_RE0_LED_ResetPullup()        do { WPUEbits.WPUE0 = 0; } while(0)
#define IO_RE0_LED_SetPushPull()        do { ODCONEbits.ODCE0 = 0; } while(0)
#define IO_RE0_LED_SetOpenDrain()       do { ODCONEbits.ODCE0 = 1; } while(0)
#define IO_RE0_LED_SetAnalogMode()      do { ANSELEbits.ANSELE0 = 1; } while(0)
#define IO_RE0_LED_SetDigitalMode()     do { ANSELEbits.ANSELE0 = 0; } while(0)

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