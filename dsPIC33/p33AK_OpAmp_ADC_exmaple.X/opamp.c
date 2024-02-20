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

// Configure OpAmp 1 as a unity gain buffer
void opamp1_init() {
    AMP1CON1bits.AMPEN = 1;         //Enable OP-AMP 1
    AMP1CON1bits.UGE = 1;           //Enable unity gain mode
}

// Configure OpAmp 2 as a unity gain buffer
void opamp2_init() {
    AMP2CON1bits.AMPEN = 1;         //Enable OP-AMP 2
    AMP2CON1bits.UGE = 1;           //Enable unity gain mode
}
