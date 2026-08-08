/**
 * @file ili9341.c
 * @brief module ILI9341 API.
 * 
 * @author Phuc VU
 * @date 2026-08-08
 */

/********************************* Includes ***************************************/
//#include <string.h> // memcpy
//#include <math.h>
//#include <stdio.h> //sprintf
//#include <stdlib.h>

#include "ili9341.h"
#include "font.h"


/********************************* Constants definition ***************************/
#define MADCTL_MY  0x80
#define MADCTL_MX  0x40
#define MADCTL_MV  0x20
#define MADCTL_ML  0x10
#define MADCTL_RGB 0x00
#define MADCTL_BGR 0x08
#define MADCTL_MH  0x04

/********************************* Types definition *******************************/

typedef struct
{
    uint16_t width;        /*!< screen width */
    uint16_t height;       /*!< screen height */
    uint8_t  rotation;     /*!< rotation/orientation */
    int16_t  cursorX;      /*!< cursor position X for canvas/char */
    int16_t  cursorY;      /*!< cursor position Y for canvas/char */
    uint16_t textColor;
    uint16_t textBgColor;
    uint8_t  textSize;
}ScreenParam_t;

/********************************* Macros definition ******************************/

/* MACRO SWAP */
#define M_SWAP_int8_t(a, b)      { int8_t t = a; a = b; b = t; }
#define M_SWAP_uint8_t(a, b)     { uint8_t t = a; a = b; b = t; }
#define M_SWAP_int16_t(a, b)     { int16_t t = a; a = b; b = t; }
#define M_SWAP_uint16_t(a, b)    { uint16_t t = a; a = b; b = t; }
#define M_SWAP(a, b)             { size_t t = a; a = b; b = t; }

static inline int32_t M_ABS(int32_t a)
{
    if (a<0)
    {
        return (-a);
    }
    else
    {
        return a;
    }
}

/********************************* Local functions prototype **********************/

static void InitializeScreen(void);
static void SetAddrWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1);
static void WriteCommand(uint8_t value);
static void WriteU32(uint32_t value);
static void WriteU16(uint16_t value);
static inline void WriteData(uint8_t value);

/********************************* Local variable *********************************/

static InterfaceSPI_t *_interfaceSPI = NULL;
static ScreenParam_t _screenParam = {0};

/********************************* API functions **********************************/

static void WriteU32(uint32_t value)
{
    uint8_t data[4];
    
    data[0] = (uint8_t)(value>>24);
    data[1] = (uint8_t)(value>>16);
    data[2] = (uint8_t)(value>>8);
    data[3] = (uint8_t)(value);
    
    _interfaceSPI->Write(data, 4);
}

static void WriteU16(uint16_t value)
{
    uint8_t data[2];
    
    data[0] = (uint8_t)(value>>8);
    data[1] = (uint8_t)(value);
    
    _interfaceSPI->Write(data, 2);
}

static inline void WriteData(uint8_t value)
{
    _interfaceSPI->Write((void*)&value, 1);
}


void ILI9341_Initialize(InterfaceSPI_t *interface)
{
    if (interface == NULL) 
    {
        return; 
    }
    
    _interfaceSPI = interface;
    
    InitializeScreen();
}

static void WriteCommand(uint8_t value)
{
  _interfaceSPI->DC(0);
  _interfaceSPI->CS(0);
  _interfaceSPI->Write((void*)&value, 1);
  _interfaceSPI->DC(1);
}



static void SetAddrWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
    uint32_t x = ((uint32_t)x0<<16) | (uint32_t)x1;
    uint32_t y = ((uint32_t)y0<<16) | (uint32_t)y1;
    
    
    /* Column address set */
    WriteCommand(ILI9341_CASET);
    WriteU32(x);
    
    /* Row address set */
    WriteCommand(ILI9341_PASET);
    WriteU32(y);

    /* Write to RAM */
    WriteCommand(ILI9341_RAMWR);
}

static void InitializeScreen(void)
{
    /* Command signal */
    _interfaceSPI->DC(0);
    
    /* Chip Select Idle */
    _interfaceSPI->CS(1);
    
    /* Backlight ON */
    _interfaceSPI->Led(1);
    
    /* LCD reset sequence */
    _interfaceSPI->Reset(1);
    _interfaceSPI->Delay(100);
    _interfaceSPI->Reset(0);
    _interfaceSPI->Delay(100);
    _interfaceSPI->Reset(1);
    _interfaceSPI->Delay(200);
    /* End reset */
    
    
    WriteCommand(0xEF);
    WriteData(0x03);
    WriteData(0x80);
    WriteData(0x02);

    WriteCommand(0xCF);
    WriteData(0x00);
    WriteData(0XC1);
    WriteData(0X30);

    WriteCommand(0xED);
    WriteData(0x64);
    WriteData(0x03);
    WriteData(0X12);
    WriteData(0X81);

    WriteCommand(0xE8);
    WriteData(0x85);
    WriteData(0x00);
    WriteData(0x78);

    WriteCommand(0xCB);
    WriteData(0x39);
    WriteData(0x2C);
    WriteData(0x00);
    WriteData(0x34);
    WriteData(0x02);

    WriteCommand(0xF7);
    WriteData(0x20);

    WriteCommand(0xEA);
    WriteData(0x00);
    WriteData(0x00);

    WriteCommand(ILI9341_PWCTR1);    //Power control
    WriteData(0x23);   //VRH[5:0]

    WriteCommand(ILI9341_PWCTR2);    //Power control
    WriteData(0x10);   //SAP[2:0];BT[3:0]

    WriteCommand(ILI9341_VMCTR1);    //VCM control
    WriteData(0x3e);
    WriteData(0x28);

    WriteCommand(ILI9341_VMCTR2);    //VCM control2
    WriteData(0x86);  //--

    WriteCommand(ILI9341_MADCTL);    // Memory Access Control
    WriteData(0x48);

    WriteCommand(ILI9341_PIXFMT);
    WriteData(0x55);

    WriteCommand(ILI9341_FRMCTR1);
    WriteData(0x00);
    WriteData(0x18);

    WriteCommand(ILI9341_DFUNCTR);    // Display Function Control
    WriteData(0x08);
    WriteData(0x82);
    WriteData(0x27);

    WriteCommand(0xF2);    // 3Gamma Function Disable
    WriteData(0x00);

    WriteCommand(ILI9341_GAMMASET);    //Gamma curve selected
    WriteData(0x01);

    WriteCommand(ILI9341_GMCTRP1);    //Set Gamma
    WriteData(0x0F);
    WriteData(0x31);
    WriteData(0x2B);
    WriteData(0x0C);
    WriteData(0x0E);
    WriteData(0x08);
    WriteData(0x4E);
    WriteData(0xF1);
    WriteData(0x37);
    WriteData(0x07);
    WriteData(0x10);
    WriteData(0x03);
    WriteData(0x0E);
    WriteData(0x09);
    WriteData(0x00);

    WriteCommand(ILI9341_GMCTRN1);    //Set Gamma
    WriteData(0x00);
    WriteData(0x0E);
    WriteData(0x14);
    WriteData(0x03);
    WriteData(0x11);
    WriteData(0x07);
    WriteData(0x31);
    WriteData(0xC1);
    WriteData(0x48);
    WriteData(0x08);
    WriteData(0x0F);
    WriteData(0x0C);
    WriteData(0x31);
    WriteData(0x36);
    WriteData(0x0F);

    WriteCommand(ILI9341_SLPOUT);    //Exit Sleep
    _interfaceSPI->Delay(120);
    WriteCommand(ILI9341_DISPON);    //Display on
    _interfaceSPI->Delay(120);
    
    /* CS idle */
    _interfaceSPI->CS(1);
   
    _screenParam.width  = ILI9341_TFTWIDTH;
    _screenParam.height = ILI9341_TFTHEIGHT;
    
    _screenParam.rotation = 0;

}

void ILI9341_DrawPixel(int16_t x, int16_t y, uint16_t color)
{
    if ((x < 0) || (x >= _screenParam.width) || (y < 0) || (y >= _screenParam.height))
        return;

    SetAddrWindow(x, y, x + 1, y + 1);
    WriteU16(color);
    
    /* CS idle */
    _interfaceSPI->CS(1);
}

void ILI9341_PushColor(uint16_t color)
{
    /* CS start frame */
    _interfaceSPI->CS(0);

    WriteU16(color);

    /* CS idle */
    _interfaceSPI->CS(1);
}

void ILI9341_FillScreen(uint16_t color)
{
    uint32_t nPixel;

    SetAddrWindow(0, 0, _screenParam.width - 1, _screenParam.height - 1);
    nPixel = (uint32_t)(_screenParam.width * _screenParam.height);
    
    for(size_t i=0; i<nPixel; i++)
    {
        WriteU16(color);
    }

    /* CS idle */
    _interfaceSPI->CS(1);
}


// Draw lines faster by calculating straight sections and drawing them with fastVline and fastHline.
void ILI9341_DrawLine(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color)
{
    //uint8_t steep;
    int16_t dx, dy;
    int16_t err;
    int16_t ystep;
    int16_t xbegin;
    int16_t len;
    
    /* only positive value -> limitation on max */
    if (x0 >= _screenParam.width)  { x0 = _screenParam.width -1; }
    if (y0 >= _screenParam.height) { y0 = _screenParam.height -1;}
    if (x1 >= _screenParam.width)  { x1 = _screenParam.width -1; }
    if (y1 >= _screenParam.height) { y1 = _screenParam.height -1;}
    
    /* it can be a pixel but not a line */
    //if ((x0==x1) && (y0==y1)) return;
	
    
	if (y0 == y1)
    {
		if (x1 > x0)
        {
			ILI9341_DrawFastHLine(x0, y0, x1 - x0 + 1, color);
		}
		else if (x1 < x0)
        {
			ILI9341_DrawFastHLine(x1, y0, x0 - x1 + 1, color);
		}
		else
        {
			ILI9341_DrawPixel(x0, y0, color);
		}
		return;
	}
	else if (x0 == x1)
    {
		if (y1 > y0)
        {
			ILI9341_DrawFastVLine(x0, y0, y1 - y0 + 1, color);
		}
		else
        {
			ILI9341_DrawFastVLine(x0, y1, y0 - y1 + 1, color);
		}
		return;
	}

    
	uint8_t steep = (M_ABS(y1 - y0) > M_ABS(x1 - x0)) ? 1 : 0;
	if (steep)
    {
		M_SWAP_uint16_t(x0, y0);
		M_SWAP_uint16_t(x1, y1);
	}
	if (x0 > x1)
    {
		M_SWAP_uint16_t(x0, x1);
		M_SWAP_uint16_t(y0, y1);
	}

	// int16_t dx, dy;
	dx = x1 - x0;
	dy = (int16_t)M_ABS(y1 - y0);

	//int16_t err;
    err = dx / 2;
	//int16_t ystep;

	if (y0 < y1)
    {
		ystep = 1;
	}
	else
    {
		ystep = -1;
	}

	//int16_t xbegin = x0;
    xbegin = x0;
	if (steep)
    {
		for (; x0 <= x1; x0++)
        {
			err -= dy;
			if (err < 0)
            {
                //int16_t len
                len = x0 - xbegin;
				if (len)
                {
					ILI9341_DrawFastVLine (y0, xbegin, len + 1, color);
					//writeVLine_cont_noCS_noFill(y0, xbegin, len + 1);
				}
				else
                {
					ILI9341_DrawPixel(y0, x0, color);
					//writePixel_cont_noCS(y0, x0, color);
				}
				xbegin = x0 + 1;
				y0 += ystep;
				err += dx;
			}
		}
		if (x0 > xbegin + 1)
        {
			//writeVLine_cont_noCS_noFill(y0, xbegin, x0 - xbegin);
			ILI9341_DrawFastVLine(y0, xbegin, x0 - xbegin, color);
		}
	}
	else
    {
		for (; x0 <= x1; x0++)
        {
			err -= dy;
			if (err < 0)
            {
				len = x0 - xbegin;
				if (len)
                {
					ILI9341_DrawFastHLine(xbegin, y0, len + 1, color);
					//writeHLine_cont_noCS_noFill(xbegin, y0, len + 1);
				}
				else
                {
					ILI9341_DrawPixel(x0, y0, color);
					//writePixel_cont_noCS(x0, y0, color);
				}
				xbegin = x0 + 1;
				y0 += ystep;
				err += dx;
			}
		}
		if (x0 > xbegin + 1)
        {
			//writeHLine_cont_noCS_noFill(xbegin, y0, x0 - xbegin);
			ILI9341_DrawFastHLine(xbegin, y0, x0 - xbegin, color);
		}
	}
}

void ILI9341_DrawFastVLine(uint16_t x, uint16_t y, uint16_t h, uint16_t color)
{
    /* only positive value -> limitation on max */
    if (x >= _screenParam.width)  return;
    if (y >= _screenParam.height) return;
    if (h < 1) return;

    /* pixel size ? */
    if (h < 2 )
    {
        ILI9341_DrawPixel(x, y, color);
        return;
    }
    
    SetAddrWindow(x, y, x, y + h - 1);
    while(h--)
    {
        WriteU16(color);  
    }
  
    /* CS idle */
    _interfaceSPI->CS(1);
}

void ILI9341_DrawFastHLine(uint16_t x, uint16_t y, uint16_t w, uint16_t color)
{
    /* only positive value -> limitation on max */
    if (x >= _screenParam.width)  return;
    if (y >= _screenParam.height) return;
    if (w < 1) return;
    
    if (w < 2 ) 
    {
        ILI9341_DrawPixel(x, y, color);
        return;
    }
    
    SetAddrWindow(x, y, x + w - 1, y);
    while(w--)  
    {
        WriteU16(color);
    }

    /* CS idle */
    _interfaceSPI->CS(1);
}

// Pass 8-bit (each) R,G,B, get back 16-bit packed color
uint16_t ILI9341_Color565(uint8_t r, uint8_t g, uint8_t b)
{
  return ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3);
}

void ILI9341_SetRotation(uint8_t rotation)
{
    _screenParam.rotation = rotation % 4; // can't be higher than 3
    switch (_screenParam.rotation)
    {
        case 0:
            rotation = (MADCTL_MX | MADCTL_BGR);
            _screenParam.width  = ILI9341_TFTWIDTH;
            _screenParam.height = ILI9341_TFTHEIGHT;
            break;
            
        case 1:
            rotation = (MADCTL_MV | MADCTL_BGR);
            _screenParam.width  = ILI9341_TFTHEIGHT;
            _screenParam.height = ILI9341_TFTWIDTH;
            break;
            
        case 2:
            rotation = (MADCTL_MY | MADCTL_BGR);
            _screenParam.width  = ILI9341_TFTWIDTH;
            _screenParam.height = ILI9341_TFTHEIGHT;
            break;
            
        case 3:
            rotation = (MADCTL_MX | MADCTL_MY | MADCTL_MV | MADCTL_BGR);
            _screenParam.width  = ILI9341_TFTHEIGHT;
            _screenParam.height = ILI9341_TFTWIDTH;
            break;
    }
  
    WriteCommand(ILI9341_MADCTL);
    WriteData(rotation);

    /* CS idle */
    _interfaceSPI->CS(1);
}

void ILI9341_InvertDisplay(bool invert)
{
    WriteCommand( invert ? ILI9341_INVON : ILI9341_INVOFF );
    
    /* CS idle */
    _interfaceSPI->CS(1);
}


void ILI9341_FillCircle(int16_t x, int16_t y, int16_t radius, uint16_t color)
{
    ILI9341_DrawFastVLine(x, y-radius, 2*radius+1, color);
    ILI9341_FillCircleHelper(x, y, radius, 3, 0, color);
}

void ILI9341_FillCircleHelper(  int16_t x,
                                int16_t y,
                                int16_t radius,
                                uint8_t cornername,
                                int16_t delta,
                                uint16_t color)
{
    int16_t f     = 1 - radius;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * radius;
    int16_t cx     = 0;
    int16_t cy     = radius;

    while (cx < cy) 
    {
      if (f >= 0) 
      {
        cy--;
        ddF_y += 2;
        f     += ddF_y;
      }
      cx++;
      ddF_x += 2;
      f     += ddF_x;

      if (cornername & 0x1)
      {
        ILI9341_DrawFastVLine(x+cx, y-cy, 2*cy+1+delta, color);
        ILI9341_DrawFastVLine(x+cy, y-cx, 2*cx+1+delta, color);
      }
      if (cornername & 0x2)
      {
        ILI9341_DrawFastVLine(x-cx, y-cy, 2*cy+1+delta, color);
        ILI9341_DrawFastVLine(x-cy, y-cx, 2*cx+1+delta, color);
      }
    }
}
void ILI9341_DrawCircleHelper( int16_t x0, int16_t y0, int16_t r, uint8_t cornername, uint16_t color)
{
  int16_t f     = 1 - r;
  int16_t ddF_x = 1;
  int16_t ddF_y = -2 * r;
  int16_t cx    = 0;
  int16_t cy    = r;

  while (cx < cy)
  {
    if (f >= 0)
    {
      cy--;
      ddF_y += 2;
      f     += ddF_y;
    }
    
    cx++;
    ddF_x += 2;
    f     += ddF_x;
    
    if (cornername & 0x4)
    {
      ILI9341_DrawPixel(x0 + cx, y0 + cy, color);
      ILI9341_DrawPixel(x0 + cy, y0 + cx, color);
    } 
    if (cornername & 0x2)
    {
      ILI9341_DrawPixel(x0 + cx, y0 - cy, color);
      ILI9341_DrawPixel(x0 + cy, y0 - cx, color);
    }
    if (cornername & 0x8)
    {
      ILI9341_DrawPixel(x0 - cy, y0 + cx, color);
      ILI9341_DrawPixel(x0 - cx, y0 + cy, color);
    }
    if (cornername & 0x1)
    {
      ILI9341_DrawPixel(x0 - cy, y0 - cx, color);
      ILI9341_DrawPixel(x0 - cx, y0 - cy, color);
    }
  }
}

void ILI9341_DrawRect(int16_t x, int16_t y, int16_t width, int16_t heigh, uint16_t color)
{
    ILI9341_DrawFastHLine(x, y, width, color);
    ILI9341_DrawFastHLine(x, y+heigh-1, width, color);
    ILI9341_DrawFastVLine(x, y, heigh, color);
    ILI9341_DrawFastVLine(x+width-1, y, heigh, color);
}

// fill a rectangle
void ILI9341_FillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color)
{
    uint32_t nPixels;
    
    // rudimentary clipping (drawChar w/big text requires this)
    if ((x >= _screenParam.width) || (y >= _screenParam.height || h < 1 || w < 1)) return;
    if ((x + w - 1) >= _screenParam.width)  w = _screenParam.width  - x;
    if ((y + h - 1) >= _screenParam.height) h = _screenParam.height - y;
    if (w == 1 && h == 1)
    {
        ILI9341_DrawPixel(x, y, color);
        return;
    }

    SetAddrWindow(x, y, x + w - 1, y + h - 1);

    nPixels = w * h;
    for(uint32_t i=0; i<nPixels; i++)
    {
        WriteU16(color);
    }

    /* CS idle */
    _interfaceSPI->CS(1);
}

void ILI9341_DrawRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, uint16_t color)
{
    /* smarter version */
    ILI9341_DrawFastHLine(x+r  , y    , w-2*r, color); // Top
    ILI9341_DrawFastHLine(x+r  , y+h-1, w-2*r, color); // Bottom
    ILI9341_DrawFastVLine(x    , y+r  , h-2*r, color); // Left
    ILI9341_DrawFastVLine(x+w-1, y+r  , h-2*r, color); // Right
    
    /* draw four corners */
    ILI9341_DrawCircleHelper(x+r    , y+r    , r, 1, color);
    ILI9341_DrawCircleHelper(x+w-r-1, y+r    , r, 2, color);
    ILI9341_DrawCircleHelper(x+w-r-1, y+h-r-1, r, 4, color);
    ILI9341_DrawCircleHelper(x+r    , y+h-r-1, r, 8, color);
}

void ILI9341_FillRoundRect(int16_t x, int16_t y, int16_t width, int16_t heigh, int16_t radius, int16_t color)
{
    /* smarter version */
  ILI9341_FillRect(x+radius, y, width-2*radius, heigh, color);

  /* draw four corners */
  ILI9341_FillCircleHelper(x+width-radius-1, y+radius, radius, 1, heigh-2*radius-1, color);
  ILI9341_FillCircleHelper(x+radius        , y+radius, radius, 2, heigh-2*radius-1, color);
}


/*** GFX **********************************************************************/
/* May split it one day in another file */

/* Draw a circle outline */
void ILI9341_DrawCircle(int16_t x, int16_t y, int16_t radius, uint16_t color)
{

    int16_t f = 1 - radius;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * radius;
    int16_t cx = 0;
    int16_t cy = radius;

    ILI9341_DrawPixel(x       , y+radius, color);
    ILI9341_DrawPixel(x       , y-radius, color);
    ILI9341_DrawPixel(x+radius, y       , color);
    ILI9341_DrawPixel(x-radius, y       , color);

    while (cx < cy)
    {
        if (f >= 0)
        {
            cy--;
            ddF_y += 2;
            f += ddF_y;
        }
        cx++;
        ddF_x += 2;
        f += ddF_x;

        ILI9341_DrawPixel(x + cx, y + cy, color);
        ILI9341_DrawPixel(x - cx, y + cy, color);
        ILI9341_DrawPixel(x + cx, y - cy, color);
        ILI9341_DrawPixel(x - cx, y - cy, color);
        ILI9341_DrawPixel(x + cy, y + cx, color);
        ILI9341_DrawPixel(x - cy, y + cx, color);
        ILI9341_DrawPixel(x + cy, y - cx, color);
        ILI9341_DrawPixel(x - cy, y - cx, color);
    }
}

void ILI9341_DrawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color)
{
    ILI9341_DrawLine(x0, y0, x1, y1, color);
    ILI9341_DrawLine(x1, y1, x2, y2, color);
    ILI9341_DrawLine(x2, y2, x0, y0, color);
}

void ILI9341_SetCursor(int16_t x, int16_t y) 
{
  _screenParam.cursorX = x;
  _screenParam.cursorY = y;
}

void ILI9341_SetTextColor(uint16_t color) 
{
  // For 'transparent' background, we'll set the bg 
  // to the same as fg instead of using a flag
  _screenParam.textColor = _screenParam.textBgColor = color;
}

void ILI9341_SetTextSize(uint8_t size)
{
  _screenParam.textSize = (size > 0) ? size : 1;
}

// Draw a character
void ILI9341_DrawChar(  int16_t x,
                    int16_t y, 
                    uint8_t car, 
                    uint16_t color, 
                    uint16_t bgColor, 
                    uint8_t size) 
{

    uint8_t i,j;
    uint8_t line;

    if (ILI9341_DrawPixel == NULL) return;

    if( (x >= _screenParam.width)            || // Clip right
        (y >= _screenParam.height)           || // Clip bottom
        ((x + 6 * size - 1) < 0) || // Clip left
        ((y + 8 * size - 1) < 0))   // Clip top
        return;

    for (i=0; i<6; i++ )
    {
        if (i == 5) 
          line = 0x0;
        else 
          line = *(font+(car*5)+i);

        for ( j = 0; j<8; j++)
        {
            if (line & 0x1)
            {
                if (size == 1)
                {// default size
                    ILI9341_DrawPixel(x+i, y+j, color);
                }
                else
                {  // big size
                    ILI9341_FillRect(x+(i*size), y+(j*size), size, size, color);
                } 
            }
            else if (bgColor != color)
            {
                if (size == 1) // default size
                    ILI9341_DrawPixel(x+i, y+j, bgColor);
                else 
                {  // big size
                    ILI9341_FillRect(x+i*size, y+j*size, size, size, bgColor);
                }
            }
            line >>= 1;
        }
    }
}


void ILI9341_OutputText(uint8_t const * text)
{
    while(*text != '\0')
    {
        if (*text == '\n' || *text == '\r')
        {/* LF or CR */
            /* heigh is 7, +1 for space. total = 8 */
            _screenParam.cursorY += _screenParam.textSize *8; 
            _screenParam.cursorX = 0;
            text++;
        }
        else
        {
            ILI9341_DrawChar(   _screenParam.cursorX,
                                _screenParam.cursorY,
                                *(text++),
                                _screenParam.textColor,
                                _screenParam.textBgColor,
                                _screenParam.textSize);
            
            /* width is 5, +1 for space. total = 6 */
            _screenParam.cursorX += _screenParam.textSize * 6;
        }
    }
}

/*EOF*/
