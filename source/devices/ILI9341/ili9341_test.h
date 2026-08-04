/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _ILI9341_TEST_H    /* Guard against multiple inclusion */
#define _ILI9341_TEST_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */

/* TODO:  Include other files here if needed. */


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    
    void tft_ili9341_testsequence(uint8_t c);
    void testFastVLine(void);
    void testFillScreen(void);
    void testLines(uint16_t color);
    void testRects(uint16_t color);
    
    void testFastLines(uint16_t color1, uint16_t color2);
    void testFilledRects(uint16_t color1, uint16_t color2);
    void testFilledCircles(uint8_t radius, uint16_t color);
    void testCircles(uint8_t radius, uint16_t color);
    void testTriangles(void);
    void fillTriangle ( int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t color);
    void testFilledTriangles(void);
    void testRoundRects(void);
    void testFilledRoundRects(void);

    void ILI9341_TEST_Sequence(void);
    void ILI9341_TEST_Screen(void);
    void ILI9341_TEST_Text(void);
    void ILI9341_TEST_FastLines(uint16_t color1, uint16_t color2);
    void ILI9341_TEST_Lines(uint16_t color);
    void ILI9341_TEST_Rects(uint16_t color);
    void ILI9341_TEST_FilledRects(uint16_t color1, uint16_t color2);
    void ILI9341_TEST_Circles(uint8_t radius, uint16_t color);
    void ILI9341_TEST_FilledCircles(uint8_t radius, uint16_t color);
    void ILI9341_TEST_Triangles(void);
    void ILI9341_TEST_FilledTriangles(void);
    void ILI9341_TEST_RoundRects(void);
    void ILI9341_TEST_FilledRoundRects(void);
    
    
    void ili9341_InterfaceExample(void);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
