/**
 * @file task_display.c
 * @brief Thread display.
 * 
 * @author Phuc VU
 * @date Jun 18, 2026
 */

/********************************* Includes ***************************************/

#include <FreeRTOS.h>
#include <task.h>

#include "spi.h"
#include "ili9341.h"
#include "ili9341_test.h"

/********************************* Constants definition ***************************/

#define ILI9341_SPI_SW    1

/* NOTE: need to add or remove SPI init */
#if (ILI9341_SPI_SW == 1)
    #define ILI9341_CS        9U /* RD9 */
    #define ILI9341_RESET    10U /* RD10 */
    #define ILI9341_DC       11U /* RD11 */
    #define ILI9341_MOSI      0U /* RD0 */
    #define ILI9341_SCK       1U /* RD1 */
    #define ILI9341_LED       2U /* RD2 */
    #define ILI9341_MISO      3U /* RD3 */
#else
    #define ILI9341_CS        9U /* RD9 */
    #define ILI9341_RESET    10U /* RD10 */
    #define ILI9341_DC       11U /* RD11 */
    #define ILI9341_MOSI      3U
    #define ILI9341_SCK       1U /* RD1 */
    #define ILI9341_LED       0U
    #define ILI9341_MISO      2U
#endif

/********************************* Macros definition ******************************/

/********************************* Types definition *******************************/

/********************************* Local variable *********************************/

/********************************* Local functions prototype **********************/

static void TestCan(void);

/*** SPI interface function *****************************************************/

static inline void SpiChipSelectSignal(uint8_t state)
{
    LATDbits.LATD9 = state;
}

static inline void SpiResetSignal(uint8_t state)
{
    LATDbits.LATD10 = state;
}

static inline void SpiDCSignal(uint8_t state)
{
    LATDbits.LATD11 = state;
}

static inline void SpiLedSignal(uint8_t state)
{
#if (ILI9341_SPI_SW == 1)
    LATDbits.LATD2 = state; /* RD2 */
#else
    LATDbits.LATD0 = state; /* RD0 */
#endif
}

static inline void SpiWriteByte(uint8_t value)
{
    for(int n=0; n<8; n++)
    {        
        LATDCLR = 1 << ILI9341_SCK;         /* SCK set low */

        if (value & (0x80>>n))
        {
            LATDSET = 1 << ILI9341_MOSI;    /* MOSI pin set high */
        }
        else
        {
            LATDCLR = 1 << ILI9341_MOSI;    /* MOSI pin set low */
        }

        LATDSET = 1 << ILI9341_SCK;         /* SCK set high */

        Nop();
        Nop();
        Nop();
        Nop();
    }

    LATDCLR = 1 << ILI9341_SCK;             /* SCK set low */
}

static bool SpiWrite(void const * const data, size_t size)
{
    for(int i=0; i<size; i++)
    {
        SpiWriteByte(((uint8_t*)data)[i]);
    }

    return true;
}


/*** Display screen task ******************************************************/

void DISPLAY_Task(void *parameters)
{
    (void)parameters;
    
    uint32_t value;

#if (ILI9341_SPI_SW == 1)
    value  = 1 << ILI9341_CS;
    value |= 1 << ILI9341_RESET;
    value |= 1 << ILI9341_DC;
    value |= 1 << ILI9341_MOSI;
    value |= 1 << ILI9341_SCK;
    value |= 1 << ILI9341_LED;
    TRISDCLR = value;             /* Set as output */
    TRISDSET = 1 << ILI9341_MISO; /* Set as input */

    LATDSET = 1 << ILI9341_SCK;

    InterfaceSPI_t interface = {
        .CS = &SpiChipSelectSignal,
        .Reset = &SpiResetSignal,
        .DC = &SpiDCSignal,
        .Led = &SpiLedSignal,
        .Write = &SpiWrite,
        .Delay = &vTaskDelay
    };
#else
    TRISDCLR = 0b111000000001; /* RD0, RD9, RD10, RD11 as output */

    InterfaceSPI_t interface = {
        .CS = &SpiChipSelectSignal,
        .Reset = &SpiResetSignal,
        .DC = &SpiDCSignal,
        .Led = &SpiLedSignal,
        .Write = &SPI1_Write,
        .Delay = &vTaskDelay
    };
#endif
    
    ILI9341_Initialize(&interface);

    //ILI9341_TEST_Text();

    while(1)
    {
        vTaskDelay(1000U);
        ILI9341_TEST_Sequence();
    }
}

/* *****************************************************************************
 End of File
 */
