

#include "ili9341.h"
#include "ili9341_test.h"

#define M_SWAP_int16_t(a, b)     { int16_t t = a; a = b; b = t; }

#define MAX(a,b)        (((a) > (b)) ? (a) : (b))
#define MIN(a,b)        (((a) < (b)) ? (a) : (b))

void ILI9341_TEST_Sequence(void)
{
    static uint8_t index = 0;
    
    switch(index)
    {
        case 0: ILI9341_TEST_Text(); break;
        case 1: ILI9341_TEST_Screen(); break;
        case 3: ILI9341_TEST_FastLines(ILI9341_RED, ILI9341_BLUE); break;
        case 4: ILI9341_TEST_Lines(ILI9341_CYAN); break;
        case 5: ILI9341_TEST_Rects(ILI9341_GREEN); break;
        case 6: ILI9341_TEST_FilledRects(ILI9341_YELLOW, ILI9341_MAGENTA); break;
        case 7: ILI9341_TEST_FilledCircles(10, ILI9341_MAGENTA); break;
        case 8: ILI9341_TEST_Circles(10, ILI9341_WHITE);
        case 9: ILI9341_TEST_Triangles(); break;
        case 10: ILI9341_TEST_FilledTriangles(); break;
        case 11: ILI9341_TEST_RoundRects(); break;
        case 12: ILI9341_TEST_FilledRoundRects(); break;
        
        default: index = 0; break;
    }
    
    index ++;
}

void ILI9341_TEST_Text(void)
{
    ILI9341_FillScreen(ILI9341_BLACK);

    /* Hello world */
    ILI9341_SetCursor(0, 0);
    ILI9341_SetTextColor(ILI9341_WHITE);
    ILI9341_SetTextSize(1);
    ILI9341_Println((const uint8_t*)"Hello World!");

    /* print float */
    ILI9341_SetTextColor(ILI9341_YELLOW);
    ILI9341_SetTextSize(2);
    ILI9341_PrintFloat(1234.56);
    ILI9341_Println((const uint8_t*)"");

    /* print hex */
    ILI9341_SetTextColor(ILI9341_RED);
    ILI9341_SetTextSize(3);
    ILI9341_PrintHex(0xDEADBEEF);
    ILI9341_Println((const uint8_t*)"");

    /* print text in != size */
    ILI9341_SetTextColor(ILI9341_GREEN);
    ILI9341_SetTextSize(5);
    ILI9341_Println((const uint8_t*)"Groop");
    ILI9341_SetTextSize(2);
    ILI9341_Println((const uint8_t*)"I implore thee,");
    ILI9341_SetTextSize(1);
    ILI9341_Println((const uint8_t*)"my foonting turlingdromes.");
    ILI9341_Println((const uint8_t*)"And hooptiously drangle me");
    ILI9341_Println((const uint8_t*)"with crinkly bindlewurdles,");
    ILI9341_Println((const uint8_t*)"Or I will rend thee");
    ILI9341_Println((const uint8_t*)"in the gobberwarts");
    ILI9341_Println((const uint8_t*)"with my blurglecruncheon,");
    ILI9341_Println((const uint8_t*)"see if I don't!");

}

void ILI9341_TEST_Screen(void)
{
    static int step = 0;
    
    switch (step)
    {
        case 0:
            step++;
            ILI9341_FillScreen(ILI9341_NAVY);
            break;

        case 1:
            step++;
            ILI9341_FillScreen(ILI9341_DARKGREEN);
            break;

        case 2:
            step++;
            ILI9341_FillScreen(ILI9341_DARKCYAN);
            break;

        case 3:
            step++;
            ILI9341_FillScreen(ILI9341_MAROON);
            break;

        case 4:
            step++;
            ILI9341_FillScreen(ILI9341_PURPLE);
            break;

        default:
            step = 0;
            ILI9341_FillScreen(ILI9341_OLIVE);
            break;
    }
}

/*
void testFastVLine(void)
{
    int x,y,h;
    x = 0;  //_witdh
    y = 0;  //_heigh
    h = 1;  // 1 point
    ILI9341_fillScreen(ILI9341_BLACK);
    ILI9341_drawFastHLine(x, y, h, ILI9341_GREENYELLOW);
}
*/
void ILI9341_TEST_FastLines(uint16_t color1, uint16_t color2)
{
    int x, y, w = ILI9341_GetWidth(), h = ILI9341_GetHeight();

  ILI9341_FillScreen(ILI9341_BLACK);
  
  for(y=0; y<h; y+=5) ILI9341_DrawFastHLine(0, y, w, color1);
  for(x=0; x<w; x+=5) ILI9341_DrawFastVLine(x, 0, h, color2);
}

void ILI9341_TEST_Lines(uint16_t color)
{
    int16_t x1, y1, x2, y2;
    uint16_t w,h;

    w = ILI9341_GetWidth(),
    h = ILI9341_GetHeight();

    ILI9341_FillScreen(ILI9341_BLACK);

    /* origine Top/Left */
    x1 = y1 = 0;
    y2 = h - 1;
    for(x2=0; x2<w; x2+=6)
        ILI9341_DrawLine(x1, y1, x2, y2, color);
    
    x2 = w - 1;
    for(y2=0; y2<h; y2+=6)
        ILI9341_DrawLine(x1, y1, x2, y2, color);

    ILI9341_FillScreen(ILI9341_BLACK);

    /* origine top/right */
    x1 = w - 1;
    y1 = 0;
    y2 = h - 1;
    for(x2=0; x2<w; x2+=6)
        ILI9341_DrawLine(x1, y1, x2, y2, color);
    
    x2 = 0;
    for(y2=0; y2<h; y2+=6)
        ILI9341_DrawLine(x1, y1, x2, y2, color);

    ILI9341_FillScreen(ILI9341_BLACK);

    /* origine bottom/left */
    x1 = 0;
    y1 = h - 1;
    y2 = 0;
    for(x2=0; x2<w; x2+=6) ILI9341_DrawLine(x1, y1, x2, y2, color);
    x2 = w - 1;
    for(y2=0; y2<h; y2+=6) ILI9341_DrawLine(x1, y1, x2, y2, color);

    ILI9341_FillScreen(ILI9341_BLACK);

    /* origine bottom/right */
    x1    = w - 1;
    y1    = h - 1;
    y2    = 0;

    for(x2=0; x2<w; x2+=6) ILI9341_DrawLine(x1, y1, x2, y2, color);
    x2    = 0;
    for(y2=0; y2<h; y2+=6) ILI9341_DrawLine(x1, y1, x2, y2, color);
}

void ILI9341_TEST_Rects(uint16_t color)
{
    int min_side, i, i2;
    uint16_t cx = ILI9341_GetWidth()  / 2;
    uint16_t cy = ILI9341_GetHeight() / 2;

    ILI9341_FillScreen(ILI9341_BLACK);
    min_side = MIN(ILI9341_GetWidth(), ILI9341_GetHeight());

    for(i=2; i<min_side; i+=6)
    {
        i2 = i / 2;
        ILI9341_DrawRect(cx-i2, cy-i2, i, i, color);
    }
}


void ILI9341_TEST_FilledRects(uint16_t color1, uint16_t color2)
{
    int min_side, i, i2;
    int cx = ILI9341_GetWidth()  / 2;
    int cy = ILI9341_GetHeight() / 2;

    ILI9341_FillScreen(ILI9341_BLACK);
    
    min_side = MIN(ILI9341_GetWidth(), ILI9341_GetHeight()) - 1;
    
    for(i=min_side; i>0; i-=6)
    {
        i2 = i / 2;
        ILI9341_FillRect(cx-i2, cy-i2, i, i, color1);
        // Outlines are not included in timing results
        ILI9341_DrawRect(cx-i2, cy-i2, i, i, color2);
    }
}



void ILI9341_TEST_Circles(uint8_t radius, uint16_t color)
{
  //ILI9341_FillScreen(ILI9341_BLACK);
  
  int x, y, r2 = radius * 2;
  int w = ILI9341_GetWidth()  + radius;
  int h = ILI9341_GetHeight() + radius;

  // Screen is not cleared for this one -- this is
  // intentional and does not affect the reported time.
  
  for(x=0; x<w; x+=r2)
  {
    for(y=0; y<h; y+=r2)
    {
      ILI9341_DrawCircle(x, y, radius, color);
    }
  }
}

void ILI9341_TEST_FilledCircles(uint8_t radius, uint16_t color)
{
  
  int x, y, w = ILI9341_GetWidth(), h = ILI9341_GetHeight(), r2 = radius * 2;

  ILI9341_FillScreen(ILI9341_BLACK);
  
  for(x=radius; x<w; x+=r2) {
    for(y=radius; y<h; y+=r2) {
      ILI9341_FillCircle(x, y, radius, color);
    }
  }
}

void ILI9341_TEST_Triangles(void)
{
  int min_side, i;
  int cx = ILI9341_GetWidth()  / 2 - 1;
  int cy = ILI9341_GetHeight() / 2 - 1;

  ILI9341_FillScreen(ILI9341_BLACK);
  min_side = MIN(cx, cy);
  
  for(i=0; i<min_side; i+=5)
  {
    ILI9341_DrawTriangle(
      cx    , cy - i, // peak
      cx - i, cy + i, // bottom left
      cx + i, cy + i, // bottom right
      ILI9341_Color565(i, i, i));
  }
}


// Fill a triangle
void fillTriangle (int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t color)
{

    int16_t a, b, y, last;

    int16_t dx01 = x1 - x0,
            dy01 = y1 - y0,
            dx02 = x2 - x0,
            dy02 = y2 - y0,
            dx12 = x2 - x1,
            dy12 = y2 - y1,
            sa   = 0,
            sb   = 0;


  // Sort coordinates by Y order (y2 >= y1 >= y0)
  if (y0 > y1)
  {
    M_SWAP_int16_t(y0, y1); M_SWAP_int16_t(x0, x1);
  }
  if (y1 > y2)
  {
    M_SWAP_int16_t(y2, y1); M_SWAP_int16_t(x2, x1);
  }
  if (y0 > y1)
  {
    M_SWAP_int16_t(y0, y1); M_SWAP_int16_t(x0, x1);
  }

    if(y0 == y2) { // Handle awkward all-on-same-line case as its own thing
        a = b = x0;
        if(x1 < a)      a = x1;
        else if(x1 > b) b = x1;
        if(x2 < a)      a = x2;
        else if(x2 > b) b = x2;
        ILI9341_DrawFastHLine(a, y0, b-a+1, color);
        return;
    }

  
//  uint16_t    dx01 = x1 - x0,
//                  dy01 = y1 - y0,
//                  dx02 = x2 - x0,
//                  dy02 = y2 - y0,
//                  dx12 = x2 - x1,
//                  dy12 = y2 - y1,
//                  sa   = 0,
//                  sb   = 0;

  // For upper part of triangle, find scanline crossings for segments
  // 0-1 and 0-2.  If y1=y2 (flat-bottomed triangle), the scanline y1
  // is included here (and second loop will be skipped, avoiding a /0
  // error there), otherwise scanline y1 is skipped here and handled
  // in the second loop...which also avoids a /0 error here if y0=y1
  // (flat-topped triangle).
  if(y1 == y2) last = y1;   // Include y1 scanline
  else         last = y1-1; // Skip it

  for(y=y0; y<=last; y++)
  {
    a   = x0 + sa / dy01;
    b   = x0 + sb / dy02;
    sa += dx01;
    sb += dx02;
    /* longhand:
    a = x0 + (x1 - x0) * (y - y0) / (y1 - y0);
    b = x0 + (x2 - x0) * (y - y0) / (y2 - y0);
    */
    if(a > b) M_SWAP_int16_t(a,b);
    ILI9341_DrawFastHLine(a, y, b-a+1, color);
  }

  // For lower part of triangle, find scanline crossings for segments
  // 0-2 and 1-2.  This loop is skipped if y1=y2.
  sa = dx12 * (y - y1);
  sb = dx02 * (y - y0);
  for(; y<=y2; y++)
  {
    a   = x1 + sa / dy12;
    b   = x0 + sb / dy02;
    sa += dx12;
    sb += dx02;
    /* longhand:
    a = x1 + (x2 - x1) * (y - y1) / (y2 - y1);
    b = x0 + (x2 - x0) * (y - y0) / (y2 - y0);
    */
    if(a > b) M_SWAP_int16_t(a,b);
    ILI9341_DrawFastHLine(a, y, b-a+1, color);
  }
}

void ILI9341_TEST_FilledTriangles(void)
{
    int   i;
    int cx = ILI9341_GetWidth()  / 2 - 1;
    int cy = ILI9341_GetHeight() / 2 - 1;

    ILI9341_FillScreen(ILI9341_BLACK);

    for(i=MIN(cx,cy); i>10; i-=5) 
    {
        fillTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i, ILI9341_Color565(0, i*10, i*10));
        ILI9341_DrawTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i, ILI9341_Color565(i*10, i*10, 0));
    }
}

void ILI9341_TEST_RoundRects(void)
{
    int   w, i, i2;
    int cx = ILI9341_GetWidth()  / 2 - 1;
    int cy = ILI9341_GetHeight() / 2 - 1;

    
    ILI9341_FillScreen(ILI9341_BLACK);
    w   = MIN(ILI9341_GetWidth(), ILI9341_GetHeight());

    for(i=0; i<w; i+=6) 
    {
        i2 = i / 2;
        //GFX_drawRoundRect(cx-i2, cy-i2, i, i, i/8, ILI9341_color565(i, 0, 0));
        ILI9341_DrawRoundRect(cx-i2, cy-i2, i, i, i/8, ILI9341_Color565(i, 0, 0));
    }
}

void ILI9341_TEST_FilledRoundRects(void)
{
    int     i, i2;
    int cx = ILI9341_GetWidth()  / 2 - 1;
    int cy = ILI9341_GetHeight() / 2 - 1;

    
    ILI9341_FillScreen(ILI9341_BLACK);

    for(i=MIN(ILI9341_GetWidth(), ILI9341_GetHeight()); i>20; i-=6)
    {
        i2 = i / 2;
        ILI9341_FillRoundRect(cx-i2, cy-i2, i, i, i/8, ILI9341_Color565(0, i, 0));
    }
}

/* *****************************************************************************
 End of File
 */
