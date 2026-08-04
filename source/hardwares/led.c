

#include "xc.h"
#include "led.h"



void LED_Initialize(void)
{
    
    /* LED */
    LED_1_OutputEnable(); // Ambre
    LED_2_OutputEnable(); // Green
    LED_3_OutputEnable(); // Blue
    
    /* LED default init */
    LED_1_Set(); // Ambre
    LED_2_Set(); // Green
    LED_3_Set(); // Blue
    
    
}

/* *****************************************************************************
 End of File
 */
