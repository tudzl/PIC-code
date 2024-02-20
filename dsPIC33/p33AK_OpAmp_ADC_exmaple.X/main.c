/*
;*****************************************************************************
;                                                                   		 *
;                       Software License Agreement                  		 *
;*****************************************************************************
;? [2024] Microchip Technology Inc. and its subsidiaries.					 *
;																			 *
;   Subject to your compliance with these terms, you may use Microchip 		 *
;   software and any derivatives exclusively with Microchip products. 		 *
;    You are responsible for complying with 3rd party license terms  		 *
;    applicable to your use of 3rd party software (including open source  	 *
;    software) that may accompany Microchip software. SOFTWARE IS ?AS IS.?   *
;    NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS 	 *
;    SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT,  		 *
;    MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT 		 *
;    WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 			 *
;    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY 		 *
;    KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF 		 *
;    MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE 		 *
;    FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP?S 		 *
;    TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT 		 *
;    EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR 		 *
;   THIS SOFTWARE.															 *
;*****************************************************************************/

/*
 * dsPIC33AK OpAmp + ADC Example
 * dsPIC33AK128MC106 PIM + Explorer 16/32 Board
 * 
 * Pinout -
 * 
 *   dsPIC Pin    |   Explorer 16/32 Pin   |   Function
 * ---------------------------------------------------------------
 *    12 - RA2          P14                     OpAmp 1 Out / AD1AN0 (+ve ADC i/p)
 *    13 - RA3          P17                     OpAmp 1 In-
 *    14 - RA4          P20  (Pot)              OpAmp 1 In+
 *    20 - RB0          P18                     OpAmp 2 Out / AD2AN1 (+ve ADC i/p)
 *    21 - RB1          P19                     OpAmp 2 In-
 *    22 - RB2          P23                     OpAmp 2 In+
 *     8 - RA9          P11                     AD1ANN3 (-ve ADC i/p)
 *     9 - RA10         P12                     AD2ANN3 (-ve ADC i/p)
 * 
 * OpAmps are configured as unity gain buffers. To set gain using external
 * resistors, set the UGE bit to '0' in AMPxCON1 registers.
 */

#include <xc.h>

void opamp1_init();
void opamp2_init();
void clock_ADC_for_40Msps_from_PLL2();
void adc_init();

void clock_CPU_for_200MIPS_from_PLL1() {
    
    PLL1CONbits.ON = 1; //Enable PLL generator 1, if not already enabled
    
    //Select FRC as PLL1's clock source
    PLL1CONbits.NOSC = 1;
    //Request PLL1 clock switch
    PLL1CONbits.OSWEN = 1;
    //Wait for PLL1 clock switch to complete
    while(PLL1CONbits.OSWEN);
    
    //Set up PLL1 dividers to output 200MHz
    PLL1DIVbits.PLLPRE = 1; //Reference input will be 8MHz, no division
    PLL1DIVbits.PLLFBDIV = 125; //Fvco = 8MHz * 125 = 1000MHz
    PLL1DIVbits.POSTDIV1 = 5; //Divide Fcvo by 5
    PLL1DIVbits.POSTDIV2 = 1; //Fpllo = Fvco / 5 / 1 = 200 MHz

    //The PLLSWEN bit controls changes to the PLL feedback divider.
    //Request PLL1 feedback divider switch
    PLL1CONbits.PLLSWEN = 1;
    //Wait for PLL1 feedback divider switch to complete
    while(PLL1CONbits.PLLSWEN);

    //The FOUTSWEN bit controls changes to the PLL output dividers.
    //Request PLL1 output divider switch
    PLL1CONbits.FOUTSWEN = 1;
    //Wait for PLL1 output divider switch to complete
    while(PLL1CONbits.FOUTSWEN);

    //Reset CLKGEN1 fractional divider for 1:1 ratio
    CLK1DIVbits.INTDIV = 0;
    CLK1DIVbits.FRACDIV = 0;
    //Request CLKGEN1 fractional divider switch
    CLK1CONbits.DIVSWEN = 1;
    //Wait for CLKGEN1 fractional divider switch to complete
    while(CLK1CONbits.DIVSWEN);

    //Set PLL1 Fout as new CLKGEN1 clock source
    CLK1CONbits.NOSC = 5;
    //Request CLKGEN1 clock switch
    CLK1CONbits.OSWEN = 1; 
    //Wait for CLKGEN1 clock switch to complete
    while (CLK1CONbits.OSWEN);
}


int main(void)
{
    int32_t adc1_result = 0, adc2_result = 0;
    
    // Init clocks
    clock_CPU_for_200MIPS_from_PLL1();
    clock_ADC_for_40Msps_from_PLL2();
    
    // Init OpAmps
    opamp1_init();
    opamp2_init();
    
    // Init ADC channels
    adc_init();
    
    // Main loop
    while (1) {
        // Trigger ADC 1 Channel 0 (OpAmp 1 Output) in software
        AD1SWTRGbits.CH0TRG = 1;
        // Wait for conversion
        while (!AD1STATbits.CH0RDY);
        // Read result. It will clear the conversion ready flag.
        adc1_result = AD1DATA0;
        
        // Trigger ADC 2 Channel 1 (OpAmp 2 Output) in software
        AD2SWTRGbits.CH1TRG = 1;
        // Wait for conversion
        while (!AD2STATbits.CH1RDY);
        // Read result. It will clear the conversion ready flag.
        adc2_result = AD2DATA1;
        
        // delay before next reading
        for (uint16_t x = 0; x < 0x123; x++);
    }
    
}