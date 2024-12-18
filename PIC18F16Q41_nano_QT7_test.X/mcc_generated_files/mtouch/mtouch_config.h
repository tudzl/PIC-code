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
#ifndef MTOUCH_CONFIG_H
#define MTOUCH_CONFIG_H

#include <stdint.h>
#include <stdbool.h>
#include "mtouch_sensor.h"
#include "mtouch_button.h"
#include "mtouch_slider.h"
#include "mtouch_datastreamer.h"

/*
 * =======================================================================
 * Application / Configuration Settings
 * =======================================================================
 */
    #define MTOUCH_SENSORS          5u
    #define MTOUCH_BUTTONS          5u
    #define MTOUCH_SLIDERS          1u
    #define MTOUCH_DEBUG_COMM_ENABLE      0u

    /* 
     * =======================================================================
     * Sensor Parameters
     * =======================================================================
     */

    /*
     *  Defines the scan interval (milliseconds)
     *  Range - 1 to 255
     */
    #define MTOUCH_SCAN_INTERVAL    20u      //unit ms
    
    #define MTOUCH_SENSOR_ADPCH_Sensor_ANA0              0x0
    #define MTOUCH_SENSOR_PRECHARGE_Sensor_ANA0          48u
    #define MTOUCH_SENSOR_ACQUISITION_Sensor_ANA0        16u
    #define MTOUCH_SENSOR_OVERSAMPLING_Sensor_ANA0       32u
    #define MTOUCH_SENSOR_ADDITIONALCAP_Sensor_ANA0      0u
    /*-----------------------------------------------------------------------------*/
    #define MTOUCH_SENSOR_ADPCH_Sensor_ANC0              0x10
    #define MTOUCH_SENSOR_PRECHARGE_Sensor_ANC0          48u
    #define MTOUCH_SENSOR_ACQUISITION_Sensor_ANC0        16u
    #define MTOUCH_SENSOR_OVERSAMPLING_Sensor_ANC0       32u
    #define MTOUCH_SENSOR_ADDITIONALCAP_Sensor_ANC0      0u
    /*-----------------------------------------------------------------------------*/
    #define MTOUCH_SENSOR_ADPCH_Sensor_ANA5              0x5
    #define MTOUCH_SENSOR_PRECHARGE_Sensor_ANA5          48u
    #define MTOUCH_SENSOR_ACQUISITION_Sensor_ANA5        16u
    #define MTOUCH_SENSOR_OVERSAMPLING_Sensor_ANA5       32u
    #define MTOUCH_SENSOR_ADDITIONALCAP_Sensor_ANA5      0u
    /*-----------------------------------------------------------------------------*/
    #define MTOUCH_SENSOR_ADPCH_Sensor_ANC6              0x16
    #define MTOUCH_SENSOR_PRECHARGE_Sensor_ANC6          48u
    #define MTOUCH_SENSOR_ACQUISITION_Sensor_ANC6        16u
    #define MTOUCH_SENSOR_OVERSAMPLING_Sensor_ANC6       32u
    #define MTOUCH_SENSOR_ADDITIONALCAP_Sensor_ANC6      0u
    /*-----------------------------------------------------------------------------*/
    #define MTOUCH_SENSOR_ADPCH_Sensor_ANC2              0x12
    #define MTOUCH_SENSOR_PRECHARGE_Sensor_ANC2          48u
    #define MTOUCH_SENSOR_ACQUISITION_Sensor_ANC2        16u
    #define MTOUCH_SENSOR_OVERSAMPLING_Sensor_ANC2       32u
    #define MTOUCH_SENSOR_ADDITIONALCAP_Sensor_ANC2      0u
    /*-----------------------------------------------------------------------------*/
    #define MTOUCH_SENSOR_ACTIVE_THRESHOLD               100u  

    /* 
     * =======================================================================
     * Button Parameters
     * =======================================================================
     */

    #define MTOUCH_BUTTON_READING_GAIN              ((uint8_t)2u)
    #define MTOUCH_BUTTON_BASELINE_GAIN             ((uint8_t)4u)
    #define MTOUCH_BUTTON_BASELINE_INIT             ((mtouch_button_baselinecounter_t)16u)
    #define MTOUCH_BUTTON_BASELINE_RATE             ((mtouch_button_baselinecounter_t)64u)
    #define MTOUCH_BUTTON_BASELINE_HOLD             ((mtouch_button_baselinecounter_t)1024u)
    #define MTOUCH_BUTTON_NEGATIVEDEVIATION         ((mtouch_button_statecounter_t)64u)
    #define MTOUCH_BUTTON_PRESSTIMEOUT              ((mtouch_button_statecounter_t)1000u)

    #define MTOUCH_BUTTON_SENSOR_Button1             Sensor_ANA5
    #define MTOUCH_BUTTON_SENSOR_Button2             Sensor_ANA0
    #define MTOUCH_BUTTON_SENSOR_Slider1_Seg0             Sensor_ANC6
    #define MTOUCH_BUTTON_SENSOR_Slider1_Seg1             Sensor_ANC0
    #define MTOUCH_BUTTON_SENSOR_Slider1_Seg2             Sensor_ANC2

    #define MTOUCH_BUTTON_THRESHOLD_Button1          30u
    #define MTOUCH_BUTTON_THRESHOLD_Button2          30u
    #define MTOUCH_BUTTON_THRESHOLD_Slider1_Seg0          40u
    #define MTOUCH_BUTTON_THRESHOLD_Slider1_Seg1          40u
    #define MTOUCH_BUTTON_THRESHOLD_Slider1_Seg2          40u
    
    #define MTOUCH_BUTTON_SCALING_Button1            2u
    #define MTOUCH_BUTTON_SCALING_Button2            2u
    #define MTOUCH_BUTTON_SCALING_Slider1_Seg0            1u
    #define MTOUCH_BUTTON_SCALING_Slider1_Seg1            1u
    #define MTOUCH_BUTTON_SCALING_Slider1_Seg2            1u

    #define MTOUCH_BUTTON_COMMON_HYSTERESIS         HYST_50_PERCENT
    

    /* 
     * =======================================================================
     * Slider Parameters
     * =======================================================================
     */

  /**  Config:  Slider1 **/
    /* Slider Type <0-65534>
     * Type of the slider
     * Range: MTOUCH_TYPE_SLIDER or MTOUCH_TYPE_WHEEL
     */
    #define Slider1_TYPE                  MTOUCH_TYPE_SLIDER 
    /* Start Segment <0-65534>
     * Start Segment of the slider
     * Range: 0 to 65534
     */
    #define Slider1_START_SEGMENT         Slider1_Seg0    
    /* Number of Channel <0-255>
     * Number of Channels for the slider
     * Range: 0 to 255
     */
    #define Slider1_NUM_SEGMENTS          3u
    /*  Position Resolution 
     *  Full scale position resolution reported
     *  RESOL_2_BIT - RESOL_12_BIT
     */
    #define Slider1_RESOLUTION            7
    /*  Position Deadband Percentage
     *  Full scale position deadband Percentage
     *  DB_NONE - DB_15_PERCENT
     */
    #define Slider1_DEADBAND              0
    /* Position Hysteresis <0-255>
     * The minimum travel distance to be reported after contact or direction change
     */
    #define Slider1_POS_HYST              15u
    /* Contact Threshold <0-65534>
     * The minimum contact size measurement for persistent contact tracking.
     * Contact size is the sum of neighbouring Segments touch deltas forming the touch contact.
     * By default, contact Threshold parameter should be set equal to threshold value of the underlying keys.
     * Then the parameter has to be tuned based on the actual contact size of the touch when moved over the slider.
     */
    #define Slider1_THRESHOLD             100u





#endif // MTOUCH_CONFIG_H
/**
 End of File
*/
