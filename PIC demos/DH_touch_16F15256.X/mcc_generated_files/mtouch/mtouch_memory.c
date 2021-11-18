

/*
    MICROCHIP SOFTWARE NOTICE AND DISCLAIMER:

    You may use this software, and any derivatives created by any person or
    entity by or on your behalf, exclusively with Microchip's products.
    Microchip and its subsidiaries ("Microchip"), and its licensors, retain all
    ownership and intellectual property rights in the accompanying software and
    in all derivatives hereto.

    This software and any accompanying information is for suggestion only. It
    does not modify Microchip's standard warranty for its products.  You agree
    that you are solely responsible for testing the software and determining
    its suitability.  Microchip has no obligation to modify, test, certify, or
    support the software.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE APPLY TO THIS SOFTWARE, ITS INTERACTION WITH MICROCHIP'S
    PRODUCTS, COMBINATION WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT, WILL MICROCHIP BE LIABLE, WHETHER IN CONTRACT, WARRANTY, TORT
    (INCLUDING NEGLIGENCE OR BREACH OF STATUTORY DUTY), STRICT LIABILITY,
    INDEMNITY, CONTRIBUTION, OR OTHERWISE, FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    EXEMPLARY, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, FOR COST OR EXPENSE OF
    ANY KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWSOEVER CAUSED, EVEN IF
    MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE
    FORESEEABLE.  TO THE FULLEST EXTENT ALLOWABLE BY LAW, MICROCHIP'S TOTAL
    LIABILITY ON ALL CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED
    THE AMOUNT OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR
    THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF
    THESE TERMS.
*/


#include <stdint.h>
#include <stdio.h>
#include <xc.h>
#include "mtouch.h"
#include "../i2c1_slave.h"

/*Local Macros*/


/* Local Variables */
static          uint8_t memoryAddress;
static          bool    startNewPacket;

/* Local Functions */
static void              Touch_Memory_Addr(void);
static void              Touch_Memory_Read(void);
static void              Touch_Memory_Write(void);
static uint8_t           MTOUCH_Memory_getTouchState(uint8_t byteIndex);
void MTOUCH_Memory_Initialize(void)
{
    I2C1_Open();
    I2C1_SlaveSetWriteIntHandler(Touch_Memory_Read);
    I2C1_SlaveSetReadIntHandler(Touch_Memory_Write);
    I2C1_SlaveSetAddrIntHandler(Touch_Memory_Addr);
    SSP1CON2bits.SEN = 1; /* Enable clock stretching for I2C module */
}

static void Touch_Memory_Addr(void)
{
    I2C1_SendAck();
    startNewPacket = true;
}
static void Touch_Memory_Read(void)
{
    uint8_t temp,output = 0;
    
    if(memoryAddress==TOUCH_RESET_START_ADDR)
    {
        output = (uint8_t)MTOUCH_requestInitGet();
    }
    else if((memoryAddress>=TOUCH_STATE_START_ADDR)&&(memoryAddress<=TOUCH_STATE_END_ADDR))
    {
        output = MTOUCH_Memory_getTouchState(memoryAddress-TOUCH_STATE_START_ADDR);
    }
    else if((memoryAddress >= TOUCH_DEVIATION_START_ADDR) && (memoryAddress <= TOUCH_DEVIATION_END_ADDR))
    {
        output = MTOUCH_Button_Deviation_Get(memoryAddress - TOUCH_DEVIATION_START_ADDR);
    }
    else if((memoryAddress >= TOUCH_TRESHOLD_START_ADDR) && (memoryAddress <= TOUCH_TRESHOLD_END_ADDR))
    {
        output = MTOUCH_Button_Threshold_Get(memoryAddress - TOUCH_TRESHOLD_START_ADDR);
    }
    else if((memoryAddress >= TOUCH_SCALING_START_ADDR) && (memoryAddress <= TOUCH_SCALING_END_ADDR))
    {
        output = MTOUCH_Button_Scaling_Get(memoryAddress - TOUCH_SCALING_START_ADDR);
    }
    else
    {

    }
    
    memoryAddress++;
    
    I2C1_Write(output);
}

static void Touch_Memory_Write(void)
{   
    uint8_t value = I2C1_Read();
    
    if(startNewPacket)
    {
        memoryAddress = value;
        startNewPacket = false;
    }
    else
    {
        if((memoryAddress == TOUCH_RESET_START_ADDR) && (value !=0 ))
        {
            MTOUCH_requestInitSet();
        } 
        else if((memoryAddress >= TOUCH_TRESHOLD_START_ADDR) && (memoryAddress <= TOUCH_TRESHOLD_END_ADDR))
        {
            MTOUCH_Button_Threshold_Set(memoryAddress - TOUCH_TRESHOLD_START_ADDR,value);
        }
        else if((memoryAddress >= TOUCH_SCALING_START_ADDR) && (memoryAddress <= TOUCH_SCALING_END_ADDR))
        {
            MTOUCH_Button_Scaling_Set(memoryAddress - TOUCH_SCALING_START_ADDR,value);
        }
        else
        {
 
        }
        
        memoryAddress++;
    }
    I2C1_SendAck();
}


static uint8_t MTOUCH_Memory_getTouchState(uint8_t byteIndex)
{
    mtouch_buttonmask_t touchState;
    
    touchState = MTOUCH_Button_Buttonmask_Get();
    
    return (uint8_t) (touchState >>(byteIndex<<3));
}

