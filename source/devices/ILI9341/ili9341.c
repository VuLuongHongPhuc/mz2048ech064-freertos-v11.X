/* NOTE:
 * Not fast but standard.
 * Using "sprintf" is easier but overflow somewhere?
 */

/*** Includes *****************************************************************/
//#include <string.h> // memcpy
//#include <math.h>
//#include <stdio.h> //sprintf
//#include <stdlib.h>


#include "ili9341.h"
#include "font.h"
#include "format_string.h"


/*** Define **************************************************************/
#define MADCTL_MY  0x80
#define MADCTL_MX  0x40
#define MADCTL_MV  0x20
#define MADCTL_ML  0x10
#define MADCTL_RGB 0x00
#define MADCTL_BGR 0x08
#define MADCTL_MH  0x04

typedef struct
{
    uint16_t width;        /*!< screen width */
    uint16_t height;       /*!< screen height */
    uint8_t  rotation;     /*!< rotation/orientation */
    int16_t cursorX;       /*!< cursor position X for canvas/char */
    int16_t cursorY;       /*!< cursor position Y for canvas/char */
    uint16_t textColor;
    uint16_t textBgColor;
    uint8_t  textSize;
}ScreenParam_t;

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

/*** Local Prototypes *********************************************************/
static void ILI9341_InitScreen(void);
static void ILI9341_WriteCommand(uint8_t value);
static inline void ILI9341_WriteData(uint8_t value);
static void ILI9341_SetAddrWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1);


/*** Local Variables **********************************************************/
static SPI_Interface_t* pSpi = NULL;
static ScreenParam_t Param = {0};

static uint8_t _buff[50] = {0}; /*!< Buffer for string convertion */

/*** Define ILI9341 signal ****************************************************/
static inline void cs_set(void)
{
    pSpi->CS(1);
}
        
static inline void cs_clear(void)
{
    pSpi->CS(0);
}

static inline void dc_command(void)
{
    pSpi->DC(0);
}

static inline void dc_data(void)
{
    pSpi->DC(1);
}

/*** API **********************************************************************/
static void ILI9341_Write32(uint32_t value)
{
    uint8_t data[4];
    
    //memcpy(&data[0], &value, 4);
    data[0] = (uint8_t)(value>>24);
    data[1] = (uint8_t)(value>>16);
    data[2] = (uint8_t)(value>>8);
    data[3] = (uint8_t)(value);
    
    pSpi->Write(data, 4);
}

static void ILI9341_Write16(uint16_t value)
{
    uint8_t data[2];
    
    //memcpy(&data[0], &value, 2);
    data[0] = (uint8_t)(value>>8);
    data[1] = (uint8_t)(value);
    
    pSpi->Write(data, 2);
}

/*** Functions ****************************************************************/

void ILI9341_Initialize(SPI_Interface_t* p)
{
    if (p == NULL) { return; }
    
    pSpi = p;
    
    ILI9341_InitScreen();
}


static void ILI9341_WriteCommand(uint8_t value)
{
  pSpi->DC(0);
  pSpi->CS(0);
  pSpi->Write((void*)&value, 1);
  pSpi->DC(1);
}

static inline void ILI9341_WriteData(uint8_t value)
{
    pSpi->Write((void*)&value, 1);
}

static void ILI9341_SetAddrWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
    uint32_t x = ((uint32_t)x0<<16) | (uint32_t)x1;
    uint32_t y = ((uint32_t)y0<<16) | (uint32_t)y1;
    
    
    /* Column address set */
    ILI9341_WriteCommand(ILI9341_CASET);
    ILI9341_Write32(x);
    
    /* Row address set */
    ILI9341_WriteCommand(ILI9341_PASET);
    ILI9341_Write32(y);

    /* Write to RAM */
    ILI9341_WriteCommand(ILI9341_RAMWR);
}

static void ILI9341_InitScreen(void)
{
    /* Command signal */
    pSpi->DC(0);
    
    /* Chip Select Idle */
    pSpi->CS(1);
    
    /* Backlight ON */
    pSpi->Led(1);
    
    /* LCD reset sequence */
    pSpi->Reset(1);
    pSpi->Delay(100);
    pSpi->Reset(0);
    pSpi->Delay(100);
    pSpi->Reset(1);
    pSpi->Delay(200);
    /* End reset */
    
    
    ILI9341_WriteCommand(0xEF);
    ILI9341_WriteData(0x03);
    ILI9341_WriteData(0x80);
    ILI9341_WriteData(0x02);

    ILI9341_WriteCommand(0xCF);
    ILI9341_WriteData(0x00);
    ILI9341_WriteData(0XC1);
    ILI9341_WriteData(0X30);

    ILI9341_WriteCommand(0xED);
    ILI9341_WriteData(0x64);
    ILI9341_WriteData(0x03);
    ILI9341_WriteData(0X12);
    ILI9341_WriteData(0X81);

    ILI9341_WriteCommand(0xE8);
    ILI9341_WriteData(0x85);
    ILI9341_WriteData(0x00);
    ILI9341_WriteData(0x78);

    ILI9341_WriteCommand(0xCB);
    ILI9341_WriteData(0x39);
    ILI9341_WriteData(0x2C);
    ILI9341_WriteData(0x00);
    ILI9341_WriteData(0x34);
    ILI9341_WriteData(0x02);

    ILI9341_WriteCommand(0xF7);
    ILI9341_WriteData(0x20);

    ILI9341_WriteCommand(0xEA);
    ILI9341_WriteData(0x00);
    ILI9341_WriteData(0x00);

    ILI9341_WriteCommand(ILI9341_PWCTR1);    //Power control
    ILI9341_WriteData(0x23);   //VRH[5:0]

    ILI9341_WriteCommand(ILI9341_PWCTR2);    //Power control
    ILI9341_WriteData(0x10);   //SAP[2:0];BT[3:0]

    ILI9341_WriteCommand(ILI9341_VMCTR1);    //VCM control
    ILI9341_WriteData(0x3e);
    ILI9341_WriteData(0x28);

    ILI9341_WriteCommand(ILI9341_VMCTR2);    //VCM control2
    ILI9341_WriteData(0x86);  //--

    ILI9341_WriteCommand(ILI9341_MADCTL);    // Memory Access Control
    ILI9341_WriteData(0x48);

    ILI9341_WriteCommand(ILI9341_PIXFMT);
    ILI9341_WriteData(0x55);

    ILI9341_WriteCommand(ILI9341_FRMCTR1);
    ILI9341_WriteData(0x00);
    ILI9341_WriteData(0x18);

    ILI9341_WriteCommand(ILI9341_DFUNCTR);    // Display Function Control
    ILI9341_WriteData(0x08);
    ILI9341_WriteData(0x82);
    ILI9341_WriteData(0x27);

    ILI9341_WriteCommand(0xF2);    // 3Gamma Function Disable
    ILI9341_WriteData(0x00);

    ILI9341_WriteCommand(ILI9341_GAMMASET);    //Gamma curve selected
    ILI9341_WriteData(0x01);

    ILI9341_WriteCommand(ILI9341_GMCTRP1);    //Set Gamma
    ILI9341_WriteData(0x0F);
    ILI9341_WriteData(0x31);
    ILI9341_WriteData(0x2B);
    ILI9341_WriteData(0x0C);
    ILI9341_WriteData(0x0E);
    ILI9341_WriteData(0x08);
    ILI9341_WriteData(0x4E);
    ILI9341_WriteData(0xF1);
    ILI9341_WriteData(0x37);
    ILI9341_WriteData(0x07);
    ILI9341_WriteData(0x10);
    ILI9341_WriteData(0x03);
    ILI9341_WriteData(0x0E);
    ILI9341_WriteData(0x09);
    ILI9341_WriteData(0x00);

    ILI9341_WriteCommand(ILI9341_GMCTRN1);    //Set Gamma
    ILI9341_WriteData(0x00);
    ILI9341_WriteData(0x0E);
    ILI9341_WriteData(0x14);
    ILI9341_WriteData(0x03);
    ILI9341_WriteData(0x11);
    ILI9341_WriteData(0x07);
    ILI9341_WriteData(0x31);
    ILI9341_WriteData(0xC1);
    ILI9341_WriteData(0x48);
    ILI9341_WriteData(0x08);
    ILI9341_WriteData(0x0F);
    ILI9341_WriteData(0x0C);
    ILI9341_WriteData(0x31);
    ILI9341_WriteData(0x36);
    ILI9341_WriteData(0x0F);

    ILI9341_WriteCommand(ILI9341_SLPOUT);    //Exit Sleep
    pSpi->Delay(120);
    ILI9341_WriteCommand(ILI9341_DISPON);    //Display on
    pSpi->Delay(120);
    
    /* CS idle */
    pSpi->CS(1);
   
    Param.width  = ILI9341_GetWidth();
    Param.height = ILI9341_GetHeight();
    
    Param.rotation = 0;

}

void ILI9341_DrawPixel(int16_t x, int16_t y, uint16_t color)
{
    if ((x < 0) || (x >= Param.width) || (y < 0) || (y >= Param.height))
        return;

    ILI9341_SetAddrWindow(x, y, x + 1, y + 1);
    ILI9341_Write16(color);
    
    /* CS idle */
    pSpi->CS(1);
}

void ILI9341_PushColor(uint16_t color)
{
    /* CS start frame */
    pSpi->CS(0);

    ILI9341_Write16(color);

    /* CS idle */
    pSpi->CS(1);
}

void ILI9341_FillScreen(uint16_t color)
{
    uint32_t nPixel;

    ILI9341_SetAddrWindow(0, 0, Param.width - 1, Param.height - 1);
    nPixel = (uint32_t)(Param.width * Param.height);
    
    for(size_t i=0; i<nPixel; i++)
    {
        ILI9341_Write16(color);
    }

    /* CS idle */
    pSpi->CS(1);
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
    if (x0 >= Param.width)  { x0 = Param.width -1; }
    if (y0 >= Param.height) { y0 = Param.height -1;}
    if (x1 >= Param.width)  { x1 = Param.width -1; }
    if (y1 >= Param.height) { y1 = Param.height -1;}
    
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
    if (x >= Param.width)  return;
    if (y >= Param.height) return;
    if (h < 1) return;

    /* pixel size ? */
    if (h < 2 )
    {
        ILI9341_DrawPixel(x, y, color);
        return;
    }
    
    ILI9341_SetAddrWindow(x, y, x, y + h - 1);
    while(h--)
    {
        ILI9341_Write16(color);  
    }
  
    /* CS idle */
    pSpi->CS(1);
}

void ILI9341_DrawFastHLine(uint16_t x, uint16_t y, uint16_t w, uint16_t color)
{
    /* only positive value -> limitation on max */
    if (x >= Param.width)  return;
    if (y >= Param.height) return;
    if (w < 1) return;
    
    if (w < 2 ) 
    {
        ILI9341_DrawPixel(x, y, color);
        return;
    }
    
    ILI9341_SetAddrWindow(x, y, x + w - 1, y);
    while(w--)  
    {
        ILI9341_Write16(color);
    }

    /* CS idle */
    pSpi->CS(1);
}

// Pass 8-bit (each) R,G,B, get back 16-bit packed color
uint16_t ILI9341_Color565(uint8_t r, uint8_t g, uint8_t b)
{
  return ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3);
}

void ILI9341_SetRotation(uint8_t rotation)
{
    Param.rotation = rotation % 4; // can't be higher than 3
    switch (Param.rotation)
    {
        case 0:
            rotation = (MADCTL_MX | MADCTL_BGR);
            Param.width  = ILI9341_TFTWIDTH;
            Param.height = ILI9341_TFTHEIGHT;
            break;
            
        case 1:
            rotation = (MADCTL_MV | MADCTL_BGR);
            Param.width  = ILI9341_TFTHEIGHT;
            Param.height = ILI9341_TFTWIDTH;
            break;
            
        case 2:
            rotation = (MADCTL_MY | MADCTL_BGR);
            Param.width  = ILI9341_TFTWIDTH;
            Param.height = ILI9341_TFTHEIGHT;
            break;
            
        case 3:
            rotation = (MADCTL_MX | MADCTL_MY | MADCTL_MV | MADCTL_BGR);
            Param.width  = ILI9341_TFTHEIGHT;
            Param.height = ILI9341_TFTWIDTH;
            break;
    }
  
    ILI9341_WriteCommand(ILI9341_MADCTL);
    ILI9341_WriteData(rotation);

    /* CS idle */
    pSpi->CS(1);
}

void ILI9341_InvertDisplay(bool invert)
{
    ILI9341_WriteCommand( invert ? ILI9341_INVON : ILI9341_INVOFF );
    
    /* CS idle */
    pSpi->CS(1);
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
    if ((x >= Param.width) || (y >= Param.height || h < 1 || w < 1)) return;
    if ((x + w - 1) >= Param.width)  w = Param.width  - x;
    if ((y + h - 1) >= Param.height) h = Param.height - y;
    if (w == 1 && h == 1)
    {
        ILI9341_DrawPixel(x, y, color);
        return;
    }

    ILI9341_SetAddrWindow(x, y, x + w - 1, y + h - 1);

    nPixels = w * h;
    for(uint32_t i=0; i<nPixels; i++)
    {
        ILI9341_Write16(color);
    }

    /* CS idle */
    pSpi->CS(1);
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
  Param.cursorX = x;
  Param.cursorY = y;
}

void ILI9341_SetTextColor(uint16_t color) 
{
  // For 'transparent' background, we'll set the bg 
  // to the same as fg instead of using a flag
  Param.textColor = Param.textBgColor = color;
}

void ILI9341_SetTextSize(uint8_t size)
{
  Param.textSize = (size > 0) ? size : 1;
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

    if( (x >= Param.width)            || // Clip right
        (y >= Param.height)           || // Clip bottom
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


void ILI9341_Print(const uint8_t* outputText)
{
    while(*outputText != '\0')
    {
        ILI9341_DrawChar(   Param.cursorX,
                            Param.cursorY,
                            *(outputText++),
                            Param.textColor,
                            Param.textBgColor,
                            Param.textSize);
        
        /* width is 5, +1 for space. total = 6 */
        Param.cursorX += Param.textSize *6;
    }
}

void ILI9341_Println(const uint8_t* outputText)
{
    ILI9341_Print(outputText);
    
    /* CR */
    Param.cursorY += Param.textSize *8; /*!< heigh is 7, +1 for space. total = 8 */
    Param.cursorX = 0;
    
}


void ILI9341_PrintFloat(float value)
{   
    int n = (int)value;
    itoa(n, &_buff[0], 10);
    
    ILI9341_Print((const uint8_t*)&_buff[0]);
    
    float newf = (value - (float)n)*100;
    n = (int)newf;
    itoa(n, &_buff[0], 10);
    
    ILI9341_Print((const uint8_t*)".");
    ILI9341_Print((const uint8_t*)&_buff[0]);
    
    
    //sprintf(_buff,"%f", value);
    //ILI9341_Print((const uint8_t*)&_buff[0]);
}

void ILI9341_PrintHex(uint32_t value)
{
    utoa((uint32_t)value, &_buff[0], 16);
    // sprintf(_buff,"%x",value); // create error stack overflow on freertos
    ILI9341_Print((const uint8_t*)&_buff[0]);
}



/* *****************************************************************************
 End of File
 */
