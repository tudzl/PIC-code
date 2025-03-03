/**
 * POWER Generated API Header File
 * 
 * @file power.h
 * 
 * @defgroup  power POWER
 * 
 * @brief This is the generated header file for the POWER driver.
 *
 * @version POWER Driver Version 1.0.0
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

#ifndef POWER_H
#define POWER_H

/**
  Section: Included Files
 */

#include <stdbool.h>
#include <stdint.h>

/**
  Section: POWER Enumerations
 */
/**
 * @ingroup power
 * @enum power_mode_t
 * @brief Contains the available power modes.
 */
typedef enum
{
    POWER_NORMAL_MODE = 8 ,/** Sleep mode: Normal */
    POWER_DOZE_MODE = 9 ,/** Sleep mode: Doze */
    POWER_SLEEP_MODE = 10 ,/** Sleep mode: Sleep */
    POWER_IDLE_MODE = 11 
} power_mode_t;

/**
 * @ingroup power
 * @enum power_doze_t
 * @brief Contains the available doze ratio.
 */
typedef enum
{
    POWER_1_2 = 0 ,/** Doze Ratio: 1:2 */
    POWER_1_4 = 1 ,/** Doze Ratio: 1:4 */
    POWER_1_8 = 2 ,/** Doze Ratio: 1:8 */
    POWER_1_16 = 3 ,/** Doze Ratio: 1:16 */
    POWER_1_32 = 4 ,/** Doze Ratio: 1:32 */
    POWER_1_64 = 5 ,/** Doze Ratio: 1:64 */
    POWER_1_128 = 6 ,/** Doze Ratio: 1:128 */
    POWER_1_256 = 7 
} power_doze_t;

/**
 * @ingroup power
 * @enum power_peripheral_t
 * @brief Contains a list of all the PLIBs available for Peripheral Module Disable (PMD).
 */
typedef enum
{
    // Register = PMD0 =  ,
    POWER_IOC = 0x0001 ,// IOC Module
    POWER_CLKR = 0x0002 ,// CLKR Module
    POWER_NVM = 0x0004 ,// NVM Module
    POWER_FVR = 0x0040 ,// FVR Module
    POWER_SYSC = 0x0080 ,// SYSC Module
    // Register = PMD1 =  ,
    POWER_TMR0 = 0x0101 ,// TMR0 Module
    POWER_TMR1 = 0x0102 ,// TMR1 Module
    POWER_TMR2 = 0x0104 ,// TMR2 Module
    POWER_NCO = 0x0180 ,// NCO Module
    // Register = PMD2 =  ,
    POWER_ZCD = 0x0201 ,// ZCD Module
    POWER_CMP1 = 0x0202 ,// CMP1 Module
    POWER_CMP2 = 0x0204 ,// CMP2 Module
    POWER_ADC = 0x0220 ,// ADC Module
    POWER_DAC1 = 0x0240 ,// DAC1 Module
    // Register = PMD3 =  ,
    POWER_CCP1 = 0x0301 ,// CCP1 Module
    POWER_CCP2 = 0x0302 ,// CCP2 Module
    POWER_PWM3 = 0x0304 ,// PWM3 Module
    POWER_PWM4 = 0x0308 ,// PWM4 Module
    POWER_PWM5 = 0x0310 ,// PWM5 Module
    POWER_PWM6 = 0x0320 ,// PWM6 Module
    // Register = PMD4 =  ,
    POWER_CWG1 = 0x0401 ,// CWG1 Module
    POWER_MSSP1 = 0x0410 ,// MSSP1 Module
    POWER_MSSP2 = 0x0420 ,// MSSP2 Module
    POWER_UART1 = 0x0440 ,// UART1 Module
    POWER_UART2 = 0x0480 ,// UART2 Module
    // Register = PMD5 =  ,
    POWER_CLC1 = 0x0502 ,// CLC1 Module
    POWER_CLC2 = 0x0504 ,// CLC2 Module
    POWER_CLC3 = 0x0508 ,// CLC3 Module
    POWER_CLC4 = 0x0510 
} power_peripheral_t;

/**
  Section: POWER APIs
 */
/**
 * @ingroup power
 * @brief  Enters and sets the mode in the Power module and puts the device to sleep, depending on the enum entered.
 * @param powerMode Enters different power modes, specified by an enum of the type power_mode_t.
 * @retval True Enum is invalid
 * @retval False Enum is valid
 */ 
bool POWER_LowPowerModeEnter(power_mode_t powerMode);

/**
 * @ingroup power
 * @brief  Sets the doze ratio in the Power module depending on the enum entered.
 * @param ratio enter different doze ratios, specified as an enum of the type power_doze_t.
 * @return None.
 */ 
void POWER_SetDozeRatio(power_doze_t ratio);

/**
 * @ingroup power
 * @brief Gets true or false boolean data in Power module.
 * @param enable Sets/Clears Doze on Exit
 * @return None.
 */ 
void POWER_DozeOnExit(bool enable);

/**
 * @ingroup power
 * @brief  Expects true or false boolean data in Power module.
 * @param enable Sets/Clears Recover-on-Interrupt
 * @return None.
 */ 
void POWER_RecoverOnInterrupt(bool enable);

/**
 * @ingroup power
 * @brief  This routine enables the Peripheral depending on the enum entered.
 * @param peripheral enable, specified as an enum of the type power_peripheral_t.
 * @retval True Enum is invalid
 * @retval False Enum is valid
 */ 
bool POWER_PeripheralEnable(power_peripheral_t peripheral);

/**
 * @ingroup power
 * @brief  This routine disables the Peripheral depending on the enum entered.
 * @param peripheral disable, specified as an enum of the type power_peripheral_t.
 * @retval True Enum is invalid
 * @retval False Enum is valid
 */ 
bool POWER_PeripheralDisable(power_peripheral_t peripheral);

/**
 * @ingroup power
 * @brief  Disables all the Peripherals to save power.
 * @param None.
 * @return None.
 */ 
void POWER_PeripheralDisableAll(void);
#endif // POWER_H
/**
 End of File
 */
