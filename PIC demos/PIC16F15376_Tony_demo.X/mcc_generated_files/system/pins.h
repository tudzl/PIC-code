/**
 * Generated Pins header File
 * 
 * @file pins.h
 * 
 * @defgroup  pinsdriver Pins Driver
 * 
 * @brief This is generated driver header for pins. 
 *        This header file provides APIs for all pins selected in the GUI.
 *
 * @version Driver Version  3.0.0
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

#ifndef PINS_H
#define PINS_H

#include <xc.h>

#define INPUT   1
#define OUTPUT  0

#define HIGH    1
#define LOW     0

#define ANALOG      1
#define DIGITAL     0

#define PULL_UP_ENABLED      1
#define PULL_UP_DISABLED     0

// get/set IO_RB0 aliases
#define IO_RB0_TRIS                 TRISBbits.TRISB0
#define IO_RB0_LAT                  LATBbits.LATB0
#define IO_RB0_PORT                 PORTBbits.RB0
#define IO_RB0_WPU                  WPUBbits.WPUB0
#define IO_RB0_OD                   ODCONBbits.ODCB0
#define IO_RB0_ANS                  ANSELBbits.ANSB0
#define IO_RB0_SetHigh()            do { LATBbits.LATB0 = 1; } while(0)
#define IO_RB0_SetLow()             do { LATBbits.LATB0 = 0; } while(0)
#define IO_RB0_Toggle()             do { LATBbits.LATB0 = ~LATBbits.LATB0; } while(0)
#define IO_RB0_GetValue()           PORTBbits.RB0
#define IO_RB0_SetDigitalInput()    do { TRISBbits.TRISB0 = 1; } while(0)
#define IO_RB0_SetDigitalOutput()   do { TRISBbits.TRISB0 = 0; } while(0)
#define IO_RB0_SetPullup()          do { WPUBbits.WPUB0 = 1; } while(0)
#define IO_RB0_ResetPullup()        do { WPUBbits.WPUB0 = 0; } while(0)
#define IO_RB0_SetPushPull()        do { ODCONBbits.ODCB0 = 0; } while(0)
#define IO_RB0_SetOpenDrain()       do { ODCONBbits.ODCB0 = 1; } while(0)
#define IO_RB0_SetAnalogMode()      do { ANSELBbits.ANSB0 = 1; } while(0)
#define IO_RB0_SetDigitalMode()     do { ANSELBbits.ANSB0 = 0; } while(0)
#define RB0_SetInterruptHandler  IO_RB0_SetInterruptHandler
// get/set IO_RD0 aliases
#define IO_RD0_TRIS                 TRISDbits.TRISD0
#define IO_RD0_LAT                  LATDbits.LATD0
#define IO_RD0_PORT                 PORTDbits.RD0
#define IO_RD0_WPU                  WPUDbits.WPUD0
#define IO_RD0_OD                   ODCONDbits.ODCD0
#define IO_RD0_ANS                  ANSELDbits.ANSD0
#define IO_RD0_SetHigh()            do { LATDbits.LATD0 = 1; } while(0)
#define IO_RD0_SetLow()             do { LATDbits.LATD0 = 0; } while(0)
#define IO_RD0_Toggle()             do { LATDbits.LATD0 = ~LATDbits.LATD0; } while(0)
#define IO_RD0_GetValue()           PORTDbits.RD0
#define IO_RD0_SetDigitalInput()    do { TRISDbits.TRISD0 = 1; } while(0)
#define IO_RD0_SetDigitalOutput()   do { TRISDbits.TRISD0 = 0; } while(0)
#define IO_RD0_SetPullup()          do { WPUDbits.WPUD0 = 1; } while(0)
#define IO_RD0_ResetPullup()        do { WPUDbits.WPUD0 = 0; } while(0)
#define IO_RD0_SetPushPull()        do { ODCONDbits.ODCD0 = 0; } while(0)
#define IO_RD0_SetOpenDrain()       do { ODCONDbits.ODCD0 = 1; } while(0)
#define IO_RD0_SetAnalogMode()      do { ANSELDbits.ANSD0 = 1; } while(0)
#define IO_RD0_SetDigitalMode()     do { ANSELDbits.ANSD0 = 0; } while(0)
// get/set IO_RD1 aliases
#define IO_RD1_TRIS                 TRISDbits.TRISD1
#define IO_RD1_LAT                  LATDbits.LATD1
#define IO_RD1_PORT                 PORTDbits.RD1
#define IO_RD1_WPU                  WPUDbits.WPUD1
#define IO_RD1_OD                   ODCONDbits.ODCD1
#define IO_RD1_ANS                  ANSELDbits.ANSD1
#define IO_RD1_SetHigh()            do { LATDbits.LATD1 = 1; } while(0)
#define IO_RD1_SetLow()             do { LATDbits.LATD1 = 0; } while(0)
#define IO_RD1_Toggle()             do { LATDbits.LATD1 = ~LATDbits.LATD1; } while(0)
#define IO_RD1_GetValue()           PORTDbits.RD1
#define IO_RD1_SetDigitalInput()    do { TRISDbits.TRISD1 = 1; } while(0)
#define IO_RD1_SetDigitalOutput()   do { TRISDbits.TRISD1 = 0; } while(0)
#define IO_RD1_SetPullup()          do { WPUDbits.WPUD1 = 1; } while(0)
#define IO_RD1_ResetPullup()        do { WPUDbits.WPUD1 = 0; } while(0)
#define IO_RD1_SetPushPull()        do { ODCONDbits.ODCD1 = 0; } while(0)
#define IO_RD1_SetOpenDrain()       do { ODCONDbits.ODCD1 = 1; } while(0)
#define IO_RD1_SetAnalogMode()      do { ANSELDbits.ANSD1 = 1; } while(0)
#define IO_RD1_SetDigitalMode()     do { ANSELDbits.ANSD1 = 0; } while(0)
// get/set IO_RE0 aliases
#define IO_RE0_LED_TRIS                 TRISEbits.TRISE0
#define IO_RE0_LED_LAT                  LATEbits.LATE0
#define IO_RE0_LED_PORT                 PORTEbits.RE0
#define IO_RE0_LED_WPU                  WPUEbits.WPUE0
#define IO_RE0_LED_OD                   ODCONEbits.ODCE0
#define IO_RE0_LED_ANS                  ANSELEbits.ANSE0
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
#define IO_RE0_LED_SetAnalogMode()      do { ANSELEbits.ANSE0 = 1; } while(0)
#define IO_RE0_LED_SetDigitalMode()     do { ANSELEbits.ANSE0 = 0; } while(0)
// get/set IO_RE2 aliases
#define IO_RE2_SW0_TRIS                 TRISEbits.TRISE2
#define IO_RE2_SW0_LAT                  LATEbits.LATE2
#define IO_RE2_SW0_PORT                 PORTEbits.RE2
#define IO_RE2_SW0_WPU                  WPUEbits.WPUE2
#define IO_RE2_SW0_OD                   ODCONEbits.ODCE2
#define IO_RE2_SW0_ANS                  ANSELEbits.ANSE2
#define IO_RE2_SW0_SetHigh()            do { LATEbits.LATE2 = 1; } while(0)
#define IO_RE2_SW0_SetLow()             do { LATEbits.LATE2 = 0; } while(0)
#define IO_RE2_SW0_Toggle()             do { LATEbits.LATE2 = ~LATEbits.LATE2; } while(0)
#define IO_RE2_SW0_GetValue()           PORTEbits.RE2
#define IO_RE2_SW0_SetDigitalInput()    do { TRISEbits.TRISE2 = 1; } while(0)
#define IO_RE2_SW0_SetDigitalOutput()   do { TRISEbits.TRISE2 = 0; } while(0)
#define IO_RE2_SW0_SetPullup()          do { WPUEbits.WPUE2 = 1; } while(0)
#define IO_RE2_SW0_ResetPullup()        do { WPUEbits.WPUE2 = 0; } while(0)
#define IO_RE2_SW0_SetPushPull()        do { ODCONEbits.ODCE2 = 0; } while(0)
#define IO_RE2_SW0_SetOpenDrain()       do { ODCONEbits.ODCE2 = 1; } while(0)
#define IO_RE2_SW0_SetAnalogMode()      do { ANSELEbits.ANSE2 = 1; } while(0)
#define IO_RE2_SW0_SetDigitalMode()     do { ANSELEbits.ANSE2 = 0; } while(0)
/**
 * @ingroup  pinsdriver
 * @brief GPIO and peripheral I/O initialization
 * @param none
 * @return none
 */
void PIN_MANAGER_Initialize (void);

/**
 * @ingroup  pinsdriver
 * @brief Interrupt on Change Handling routine
 * @param none
 * @return none
 */
void PIN_MANAGER_IOC(void);

/**
 * @ingroup  pinsdriver
 * @brief Interrupt on Change Handler for the IO_RB0 pin functionality
 * @param none
 * @return none
 */
void IO_RB0_ISR(void);

/**
 * @ingroup  pinsdriver
 * @brief Interrupt Handler Setter for IO_RB0 pin interrupt-on-change functionality.
 *        Allows selecting an interrupt handler for IO_RB0 at application runtime.
 * @pre Pins intializer called
 * @param InterruptHandler function pointer.
 * @return none
 */
void IO_RB0_SetInterruptHandler(void (* InterruptHandler)(void));

/**
 * @ingroup  pinsdriver
 * @brief Dynamic Interrupt Handler for IO_RB0 pin.
 *        This is a dynamic interrupt handler to be used together with the IO_RB0_SetInterruptHandler() method.
 *        This handler is called every time the IO_RB0 ISR is executed and allows any function to be registered at runtime.
 * @pre Pins intializer called
 * @param none
 * @return none
 */
extern void (*IO_RB0_InterruptHandler)(void);

/**
 * @ingroup  pinsdriver
 * @brief Default Interrupt Handler for IO_RB0 pin. 
 *        This is a predefined interrupt handler to be used together with the IO_RB0_SetInterruptHandler() method.
 *        This handler is called every time the IO_RB0 ISR is executed. 
 * @pre Pins intializer called
 * @param none
 * @return none
 */
void IO_RB0_DefaultInterruptHandler(void);


#endif // PINS_H
/**
 End of File
*/