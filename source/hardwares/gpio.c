
#include "xc.h"

#include "gpio.h"


void GPIO_init(void)
{
/*** Set mode : input/output **************************************************/

    /* LED */
    LATFCLR = PIN_RF3_Mask | PIN_RF4_Mask | PIN_RF5_Mask;
    TRISFCLR = PIN_RF3_Mask | PIN_RF4_Mask | PIN_RF5_Mask;
    
    /* OUTPUT */
    RB10_OutputEnable();
    // switch speed ?
    
    /* SWITCH / BUTTON */
    ANSELEbits.ANSE5 = IO_DIGITAL;
    TRISEbits.TRISE5 = INPUT_PIN;
    CNPUEbits.CNPUE5 = CNPU_PULLUP_ENABLE;
 
  
}

/*EOF*/
