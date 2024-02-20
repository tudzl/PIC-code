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

#include <xc.h>

// Set ADC clock to 320MHz
void clock_ADC_for_40Msps_from_PLL2() {
    
    PLL2CONbits.ON = 1; //Enable PLL generator 2, if not already enabled
    
    //Select FRC as PLL2's clock source
    PLL2CONbits.NOSC = 1;
    //Request PLL2 clock switch
    PLL2CONbits.OSWEN = 1;
    //Wait for PLL2 clock switch to complete
    while(PLL2CONbits.OSWEN);
    
    //Set up PLL2 dividers to output 200MHz
    PLL2DIVbits.PLLPRE = 1; //Reference input will be 8MHz, no division
    PLL2DIVbits.PLLFBDIV = 120; //Fvco = 8MHz * 120 = 960MHz
    PLL2DIVbits.POSTDIV1 = 3; //Divide Fcvo by 3
    PLL2DIVbits.POSTDIV2 = 1; //Fpllo = Fvco / 3 / 1 = 320 MHz

    //The PLLSWEN bit controls changes to the PLL feedback divider.
    //Request PLL2 feedback divider switch
    PLL2CONbits.PLLSWEN = 1;
    //Wait for PLL2 feedback divider switch to complete
    while(PLL2CONbits.PLLSWEN);

    //The FOUTSWEN bit controls changes to the PLL output dividers.
    //Request PLL2 output divider switch
    PLL2CONbits.FOUTSWEN = 1;
    //Wait for PLL2 output divider switch to complete
    while(PLL2CONbits.FOUTSWEN);
    
    //Enable CLKGEN6
    CLK6CONbits.ON = 1;
    
    //Reset CLKGEN6 fractional divider for 1:1 ratio
    CLK6DIVbits.INTDIV = 0;
    CLK6DIVbits.FRACDIV = 0;
    //Request CLKGEN6 fractional divider switch
    CLK6CONbits.DIVSWEN = 1;
    //Wait for CLKGEN6 fractional divider switch to complete
    while(CLK6CONbits.DIVSWEN);

    //Set PLL2 Fout as new CLKGEN6 clock source
    CLK6CONbits.NOSC = 6;
    //Request CLKGEN6 clock switch
    CLK6CONbits.OSWEN = 1; 
    //Wait for CLKGEN6 clock switch to complete
    while (CLK6CONbits.OSWEN);
}

void adc_init(void)
{
    // Configure ADC 1 Channel 0
    // Select single conversion mode.
    AD1CHCON0bits.MODE = 0;
    // Software trigger will start a conversion.
    AD1CHCON0bits.TRG1SRC = 1; 
    // Use a differential input.
    AD1CHCON0bits.DIFF = 1;
    // Select the AD1AN0 analog positive input/pin for the signal.
    AD1CHCON0bits.PINSEL = 0;
    // Select the AD1ANN3 analog negative input/pin for the signal.
    AD1CHCON0bits.NINSEL = 3;
    // Select signal sampling time (6.5 TADs = 81nS).
    AD1CHCON0bits.SAMC = 3;
    
    // Set ADC to RUN mode.
    AD1CONbits.MODE = 2;
    // Enable ADC.
    AD1CONbits.ON = 1;
    // Wait till ADC is ready/calibrated.
    while(AD1CONbits.ADRDY == 0);
    
    // Configure ADC 2 Channel 1
    // Select single conversion mode.
    AD2CHCON1bits.MODE = 0;
    // Software trigger will start a conversion.
    AD2CHCON1bits.TRG1SRC = 1; 
    // Use a differential input.
    AD2CHCON1bits.DIFF = 1;
    // Select the AD2AN1 analog positive input/pin for the signal.
    AD2CHCON1bits.PINSEL = 1;
    // Select the AD2ANN3 analog negative input/pin for the signal.
    AD2CHCON1bits.NINSEL = 3;
    // Select signal sampling time (6.5 TADs = 81nS).
    AD2CHCON1bits.SAMC = 3;
    
    // Set ADC to RUN mode.
    AD2CONbits.MODE = 2;
    // Enable ADC.
    AD2CONbits.ON = 1;
    // Wait till ADC is ready/calibrated.
    while(AD2CONbits.ADRDY == 0);
}


