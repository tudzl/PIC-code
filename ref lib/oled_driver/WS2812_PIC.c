/* 
 * File:   WS2812_PIC.c
 * Author: ling
 *
 * Created on April 25, 2018, 11:15 AM
 */

#include <stdio.h>
#include <stdlib.h>
#include <WS2812_head.h>
/*
 * 
 */
uint16_t ls_t;
uint8_t LED_data[45][3];
uint8_t led_size = led_ring_size;
uint8_t LED_data_mode1_len;
uint8_t LED_data_mode1[45][3];

//ws2811 24bits data GRB, MSB first

void WS2811_pin_Init(void) {
    //PIC pin


}

void WS2811_SendByte(uint8_t dat)//??1BIT???
{
    uint8_t i;
    for (i = 0; i < 8; i++) {
        if (dat & 0x80) //send bit 1
        {
            Light_SDA = 1;
            __delay_us(1);
            Light_SDA = 0;
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
        } else //send bit 0
        {
            Light_SDA = 1; //0
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
            __nop();
            Light_SDA = 0;
            __delay_us(1);
        }
        dat <<= 1;
    }
}

void RGB_LED_Reset(void) {
    Light_SDA = 0;
    __delay_ms(30);
}

void WS2811_send_color(uint32_t color) {
    uint8_t i;
    uint8_t RGB_tmp = 0;
    for (i = 0; i < led_size; i++) {

        RGB_tmp = (color & 0x00ff00) >> 8;
        WS2811_SendByte(RGB_tmp);
        RGB_tmp = (color & 0xff0000) >> 16;
        WS2811_SendByte(RGB_tmp);
        RGB_tmp = (color & 0x0000ff);
        WS2811_SendByte(RGB_tmp);

        //

        // WS2811_SendByte(G);
        // WS2811_SendByte(R);
        // WS2811_SendByte(B);
    }
    RGB_LED_Reset();
}

void WS2811_send_data(uint8_t R, uint8_t G, uint8_t B) {
    uint8_t i;
    for (i = 0; i < led_size; i++) {
        WS2811_SendByte(G);
        WS2811_SendByte(R);
        WS2811_SendByte(B);
    }
    RGB_LED_Reset();
}

void cycle_color_function(uint8_t mode, uint8_t idx) {
    uint8_t i;
    //mode 1: 8 LED
    //mode 24: 24 LED Ring
    if (mode == 1) {

        for (i = led_size; i > 0; i--) {
            // if(idx<LED_data_mode1_len)
            //  {

            WS2811_SendByte(LED_data_mode1[(idx % LED_data_mode1_len)][1]); //R
            WS2811_SendByte(LED_data_mode1[(idx % LED_data_mode1_len)][0]); //G
            WS2811_SendByte(LED_data_mode1[(idx % LED_data_mode1_len)][2]); //B
            idx++;
            //  }

        }




    }

    if (mode == 24) {

        for (i = led_ring_size; i > 0; i--) {
            // if(idx<LED_data_mode1_len)
            //  {

            WS2811_SendByte(LED_data_mode1[(idx % LED_data_mode1_len)][1]); //R
            WS2811_SendByte(LED_data_mode1[(idx % LED_data_mode1_len)][0]); //G
            WS2811_SendByte(LED_data_mode1[(idx % LED_data_mode1_len)][2]); //B
            idx++;
            //  }

        }




    }




}

void ls_mode(void) {
    uint8_t i = 0, ys = 0, yz = 0;
    for (i = led_size; i > 0; i--) {
        if (i <= ls_t) {
            if (ys < ls_t) {
                ys++;
            } else
                ys = 0;
            WS2811_SendByte(LED_data[45 - (ys % 45)][1]); //R
            WS2811_SendByte(LED_data[45 - (ys % 45)][0]); //G
            WS2811_SendByte(LED_data[45 - (ys % 45)][2]); //B
        } else {
            if (yz > 0) {
                yz--;
            } else
                yz = led_size - ls_t;
            WS2811_SendByte(LED_data[yz % 45][1]);
            WS2811_SendByte(LED_data[yz % 45][0]);
            WS2811_SendByte(LED_data[yz % 45][2]);
        }
    }
    RGB_LED_Reset();
}




uint8_t LED_data_mode1[45][3] = {

    {15, 0, 245}, //G,R,B
    {25, 0, 235},
    {45, 0, 225},
    {55, 0, 215}, //G,R,B
    {100, 0, 180}, //5
    {155, 0, 155},
    {180, 0, 100},
    {215, 0, 55},
    {235, 0, 35},
    {255, 0, 15}, //10
    {255, 0, 0},
    {255, 0, 0},
    {255, 0, 0},
    {255, 0, 0},
    {255, 0, 0}, //15
    {255, 0, 0},
    {255, 15, 0},
    {235, 35, 0},
    {215, 55, 0},
    {180, 100, 0},
    {155, 155, 0}, //20
    {100, 180, 0}, //G,R,B
    {55, 215, 0},
    {35, 235, 0},
    {15, 255, 0},
    {0, 255, 0},
    {0, 255, 0},
    {0, 255, 0},
    {0, 255, 0},
    {0, 255, 0},
    {0, 255, 0}, //30
    {0, 255, 15}, //G,R,B
    {0, 235, 35},
    {0, 215, 55},
    {0, 180, 100},
    {0, 155, 155},
    {0, 100, 180}, //35
    {0, 55, 215},
    {0, 35, 235},
    {0, 15, 255},
    {0, 0, 255},
    {0, 0, 255},
    {0, 0, 255},
    {0, 0, 255},
    {0, 0, 255}//45
};

uint8_t LED_data_mode1_len = 45;

uint8_t LED_data[45][3] = {
    {55, 0, 255}, //G,R,B
    {100, 0, 200},
    {155, 0, 155},
    {200, 0, 100},
    {255, 0, 55}, //5
    {255, 0, 0},
    {255, 0, 0},
    {255, 0, 0},
    {255, 0, 0},
    {255, 0, 0},
    {255, 0, 0},
    {255, 0, 0},
    {255, 0, 0},
    {255, 0, 0},
    {255, 0, 0}, //15
    {255, 55, 0},
    {200, 100, 0},
    {155, 155, 0},
    {100, 200, 0},
    {55, 255, 0}, //20
    {0, 255, 0}, //G,R,B
    {0, 255, 0},
    {0, 255, 0},
    {0, 255, 0},
    {0, 255, 0},
    {0, 255, 0},
    {0, 255, 0},
    {0, 255, 0},
    {0, 255, 0},
    {0, 255, 0}, //30
    {0, 255, 55}, //G,R,B
    {0, 200, 100},
    {0, 155, 155},
    {0, 100, 200},
    {0, 55, 255},
    {0, 0, 255}, //35
    {0, 0, 255},
    {0, 0, 255},
    {0, 0, 255},
    {0, 0, 255},
    {0, 0, 255},
    {0, 0, 255},
    {0, 0, 255},
    {0, 0, 255},
    {0, 0, 255}//45
};

