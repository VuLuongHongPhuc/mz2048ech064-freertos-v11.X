

#ifndef _ILI9341_H    /* Guard against multiple inclusion */
#define _ILI9341_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>
#include "typedefs.h"


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

/*** Constants ****************************************************************/
#define ILI9341_TFTWIDTH  240
#define ILI9341_TFTHEIGHT 320

#define ILI9341_NOP     0x00
#define ILI9341_SWRESET 0x01
#define ILI9341_RDDID   0x04
#define ILI9341_RDDST   0x09

#define ILI9341_SLPIN   0x10
#define ILI9341_SLPOUT  0x11
#define ILI9341_PTLON   0x12
#define ILI9341_NORON   0x13

#define ILI9341_RDMODE  0x0A
#define ILI9341_RDMADCTL  0x0B
#define ILI9341_RDPIXFMT  0x0C
#define ILI9341_RDIMGFMT  0x0A
#define ILI9341_RDSELFDIAG  0x0F

#define ILI9341_INVOFF  0x20
#define ILI9341_INVON   0x21
#define ILI9341_GAMMASET 0x26
#define ILI9341_DISPOFF 0x28    //display off
#define ILI9341_DISPON  0x29    //display on

#define ILI9341_CASET   0x2A
#define ILI9341_PASET   0x2B
#define ILI9341_RAMWR   0x2C
#define ILI9341_RAMRD   0x2E

#define ILI9341_PTLAR   0x30
#define ILI9341_MADCTL  0x36
#define ILI9341_PIXFMT  0x3A

#define ILI9341_FRMCTR1 0xB1
#define ILI9341_FRMCTR2 0xB2
#define ILI9341_FRMCTR3 0xB3
#define ILI9341_INVCTR  0xB4
#define ILI9341_DFUNCTR 0xB6

#define ILI9341_PWCTR1  0xC0
#define ILI9341_PWCTR2  0xC1
#define ILI9341_PWCTR3  0xC2
#define ILI9341_PWCTR4  0xC3
#define ILI9341_PWCTR5  0xC4
#define ILI9341_VMCTR1  0xC5
#define ILI9341_VMCTR2  0xC7

#define ILI9341_RDID1   0xDA
#define ILI9341_RDID2   0xDB
#define ILI9341_RDID3   0xDC
#define ILI9341_RDID4   0xDD

#define ILI9341_GMCTRP1 0xE0
#define ILI9341_GMCTRN1 0xE1
/*
#define ILI9341_PWCTR6  0xFC

*/

/*** Color definitions ********************************************************/
#define ILI9341_BLACK       0x0000      /*   0,   0,   0 */
#define ILI9341_NAVY        0x000F      /*   0,   0, 128 */
#define ILI9341_DARKGREEN   0x03E0      /*   0, 128,   0 */
#define ILI9341_DARKCYAN    0x03EF      /*   0, 128, 128 */
#define ILI9341_MAROON      0x7800      /* 128,   0,   0 */
#define ILI9341_PURPLE      0x780F      /* 128,   0, 128 */
#define ILI9341_OLIVE       0x7BE0      /* 128, 128,   0 */
#define ILI9341_LIGHTGREY   0xC618      /* 192, 192, 192 */
#define ILI9341_DARKGREY    0x7BEF      /* 128, 128, 128 */
#define ILI9341_BLUE        0x001F      /*   0,   0, 255 */
#define ILI9341_GREEN       0x07E0      /*   0, 255,   0 */
#define ILI9341_CYAN        0x07FF      /*   0, 255, 255 */
#define ILI9341_RED         0xF800      /* 255,   0,   0 */
#define ILI9341_MAGENTA     0xF81F      /* 255,   0, 255 */
#define ILI9341_YELLOW      0xFFE0      /* 255, 255,   0 */
#define ILI9341_WHITE       0xFFFF      /* 255, 255, 255 */
#define ILI9341_ORANGE      0xFD20      /* 255, 165,   0 */
#define ILI9341_GREENYELLOW 0xAFE5      /* 173, 255,  47 */
#define ILI9341_PINK        0xF81F

    
    

    
#define ILI9341_GetWidth()  ILI9341_TFTWIDTH
#define ILI9341_GetHeight() ILI9341_TFTHEIGHT
    
    
typedef BOOL (*SPI_Write)(const void * const data, size_t size);
typedef void (*SPI_SetOutput)(uint8_t state);
typedef void (*SPI_Delay)(uint32_t millis);

typedef struct
{
    SPI_Write Write;
    SPI_SetOutput CS;
    SPI_SetOutput DC;
    SPI_SetOutput Reset;
    SPI_SetOutput Led;
    SPI_Delay Delay;
}SPI_Interface_t;
    
    
void ILI9341_Initialize(SPI_Interface_t* p);
    
/* Entry point for GFX */
void ILI9341_DrawPixel(int16_t x, int16_t y, uint16_t color);

void ILI9341_PushColor(uint16_t color);
void ILI9341_FillScreen(uint16_t color);

uint16_t ILI9341_Color565(uint8_t r, uint8_t g, uint8_t b);
void ILI9341_SetRotation(uint8_t r);
void ILI9341_InvertDisplay(bool inverse);

/*** Same as GFX but faster (protocol specific) *******************************/
void ILI9341_DrawLine(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color);
void ILI9341_DrawFastVLine(uint16_t x, uint16_t y, uint16_t h, uint16_t color);
void ILI9341_DrawFastHLine(uint16_t x, uint16_t y, uint16_t w, uint16_t color);

void ILI9341_FillCircle(int16_t x, int16_t y, int16_t radius, uint16_t color);
void ILI9341_FillCircleHelper(int16_t x, int16_t y, int16_t radius, uint8_t cornername, int16_t delta, uint16_t color);
void ILI9341_DrawCircleHelper( int16_t x, int16_t y, int16_t r, uint8_t cornername, uint16_t color);

void ILI9341_DrawRect(int16_t x, int16_t y, int16_t width, int16_t heigh, uint16_t color);
void ILI9341_FillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
void ILI9341_DrawRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, uint16_t color);
void ILI9341_FillRoundRect(int16_t x, int16_t y, int16_t width, int16_t heigh, int16_t radius, int16_t color);    

/*** GFX **********************************************************************/
/* May split it one day */

void ILI9341_DrawCircle(int16_t x, int16_t y, int16_t radius, uint16_t color);
void ILI9341_DrawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color);

/* CHAR */
void ILI9341_SetCursor(int16_t x, int16_t y);
void ILI9341_SetTextColor(uint16_t color);
void ILI9341_SetTextSize(uint8_t size);
void ILI9341_DrawChar(int16_t x, int16_t y, uint8_t car, uint16_t color, uint16_t bgColor, uint8_t size);

/* Display text */
void ILI9341_Print(const uint8_t* outputText);
void ILI9341_Println(const uint8_t* outputText);
void ILI9341_PrintFloat(float value);
void ILI9341_PrintHex(uint32_t value);


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _ILI9341_H */

/* *****************************************************************************
 End of File
 */
