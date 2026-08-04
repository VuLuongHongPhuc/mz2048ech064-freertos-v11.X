
#include "FreeRTOS.h"
#include "task.h"

#include "task_display.h"
#include "gpio.h"
#include "spi.h"
#include "ili9341.h"
#include "ili9341_test.h"


/*** Variables ****************************************************************/



/*** SPI interface function *****************************************************/
static inline void SPI_ChipSelectSignal(uint8_t state)
{
    /* RD9 */
    LATDbits.LATD9 = state;
}

static inline void SPI_ResetSignal(uint8_t state)
{
    /* RD10 */
    LATDbits.LATD10 = state;
}

static inline void SPI_DCSignal(uint8_t state)
{
    /* RD11 */
    LATDbits.LATD11 = state;
}

static inline void SPI_LEDSignal(uint8_t state)
{
    /* RD0 */
    LATDbits.LATD0 = state;
}


/*** Display screen task ******************************************************/

void DISPLAY_Task( void *pvParameters  )
{
    SPI_Interface_t driver = {
        .CS = &SPI_ChipSelectSignal,
        .Reset = &SPI_ResetSignal,
        .DC = &SPI_DCSignal,
        .Led = &SPI_LEDSignal,
        .Write = &SPI1_Write,
        .Delay = &vTaskDelay
    };
    
    SPI1_Initialize();
    ILI9341_Initialize(&driver);
    
    /* fixe screen */
    //ILI9341_TEST_Text();

    while(1)
    {
        //LED_1_Toggle();
        vTaskDelay(1000U / portTICK_PERIOD_MS);
        ILI9341_TEST_Sequence();
    }
}

/* *****************************************************************************
 End of File
 */
