
#include "xc.h"

#include "gpio.h"


void GPIO_init(void)
{
/*** Set mode : input/output **************************************************/

    
    
    
    /* OUTPUT */
    RB10_OutputEnable();
    // switch speed ?
    
    /* SWITCH / BUTTON */
    ANSELEbits.ANSE5 = IO_DIGITAL;
    TRISEbits.TRISE5 = INPUT_PIN;
    CNPUEbits.CNPUE5 = CNPU_PULLUP_ENABLE;
   
    
    /* ILI9143 LCD */
    SPI_CS_OutputEnable();
    SPI_Reset_OutputEnable();
    SPI_DC_OutputEnable();
    SPI_LED_OutputEnable();
    //ANSELD = 0;
}

/*EOF*/
