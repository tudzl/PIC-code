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

#include <xc.h>
#include <stdint.h>

#include "mtouch.h"
#include "../mcc.h"

/* ======================================================================= *
 * Definitions
 * ======================================================================= */
#define MTOUCH_SCAN_TIMER_TICK                  1032.258 //unit us
#define MTOUCH_MAX_TIMER_PERIOD                 264 //unit ms
#define MTOUCH_SCAN_PERIOD                      (uint16_t)MTOUCH_SCAN_INTERVAL
#define MTOUCH_TMR2_POST_SCALER                 (uint8_t)(MTOUCH_SCAN_PERIOD / MTOUCH_MAX_TIMER_PERIOD)
#define MTOUCH_TMR2_PERIOD                      (uint8_t)((MTOUCH_SCAN_PERIOD*1000.0)/(MTOUCH_SCAN_TIMER_TICK*(MTOUCH_TMR2_POST_SCALER+1))-1u)


/* ======================================================================= *
 * Local Variable
 * ======================================================================= */

static bool mtouch_time_toScan = false;
static bool mtouch_request_init = false;

/*
 * =======================================================================
 *  Local Functions
 * =======================================================================
 */
static void MTOUCH_ScanScheduler(void); 
static void MTOUCH_SetTimer2Period(uint16_t scanPeriod); 
static bool MTOUCH_needReburst(void);

/*
 * =======================================================================
 * MTOUCH_ScanScheduler()
 * =======================================================================
 *  The interrupt handler callback for scanrate timer  
 */
static void MTOUCH_ScanScheduler(void)         
{
    
    //schedule the scan
    mtouch_time_toScan = true;  

}

/*
 * =======================================================================
 * MTOUCH_SetTimer2Config
 * =======================================================================
 *  set Timer2 period register and the postscaler   
 */
static void MTOUCH_SetTimer2Config(void) 
{
    /* Set timer period and control register */
    T2CON = 0x00;  /* Timer OFF */
    TMR2_LoadPeriodRegister(MTOUCH_TMR2_PERIOD);     /* set period */
    T2CON = 0xD0 + (MTOUCH_TMR2_POST_SCALER & 0x0F);  /* set post-scaler, Timer ON */
} 

/*
 * =======================================================================
 * MTOUCH_Service_isInProgress()
 * =======================================================================
 *  indicate the mTouch service status
 */

bool MTOUCH_Service_isInProgress()
{
    return mtouch_time_toScan;
}


/*
 * =======================================================================
 * MTOUCH_Init()
 * =======================================================================
 *  Root initialization routine for all enabled mTouch library modules.
 */
void MTOUCH_Initialize(void)
{   
    MTOUCH_Sensor_InitializeAll();
    MTOUCH_Button_InitializeAll();
    MTOUCH_Slider_InitializeAll();
#if (MTOUCH_DEBUG_COMM_ENABLE == 1u)
    MTOUCH_DataStreamer_Initialize();    
#endif      
    MTOUCH_Sensor_Sampled_ResetAll();
    MTOUCH_Sensor_Scan_Initialize();
    MTOUCH_SetTimer2Config();
    TMR2_SetInterruptHandler(MTOUCH_ScanScheduler);

}

/*
 * =======================================================================
 * MTOUCH_Service_Mainloop()
 * =======================================================================
 *  Root mainloop service routine for all enabled mTouch library modules.
 */
bool MTOUCH_Service_Mainloop(void)
{
    if(mtouch_request_init)
    {
        MTOUCH_Initialize();
        mtouch_request_init = false;
    }
    
    if(mtouch_time_toScan)               
    {
            if(MTOUCH_Sensor_SampleAll() == false)     
                return false;           
            MTOUCH_Button_ServiceAll();             /* Execute state machine for all buttons w/scanned sensors */
            MTOUCH_Slider_ServiceAll();             /* Execute state machine for all Slider */
        #if (MTOUCH_DEBUG_COMM_ENABLE == 1u)
            MTOUCH_DataStreamer_Service();          /* Execute Data Visualizer module */  
        #endif
            mtouch_time_toScan = MTOUCH_needReburst();
            MTOUCH_Sensor_Sampled_ResetAll();  
            MTOUCH_Tick();
            return true;
    }
    else                              
    {
        return false;                
    }
}

/*
 * =======================================================================
 * MTOUCH_Tick
 * =======================================================================
 */
void MTOUCH_Tick(void)
{
    MTOUCH_Button_Tick();
}

/*
 * =======================================================================
 * MTOUCH_Reburst
 * =======================================================================
 */
 static bool MTOUCH_needReburst(void)
 {
    bool needReburst = false;
    
    return needReburst;
 }



/*
 * =======================================================================
 * Request the initialization of mTouch library
 * note: this is designed to use in the Interrupt context so that the compiler
 *  does not duplicate the MTOUCH_Initialize() and causing possible hardware 
 *  stack overflow.
 * =======================================================================
 */
 void MTOUCH_requestInitSet(void)
 {
     mtouch_request_init = true;
 }

 bool MTOUCH_requestInitGet(void)
 {
     return mtouch_request_init;
 }
