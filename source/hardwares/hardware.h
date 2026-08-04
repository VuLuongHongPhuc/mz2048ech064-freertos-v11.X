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

#ifndef _HARDWARE_H    /* Guard against multiple inclusion */
#define _HARDWARE_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */



/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    /**** SYSTEM *******************************************/
    // SYSTEM CLOCK       : 100 MHz
    // OSCILLATOR EXTERN  : EC 24 MHz

//pin 1  RE5 -> SWITCH/BUTTON SW1
//pin 38 RF3 -> LED
//pin 41 RF4 -> LED
//pin 42 RF5 -> LED
    


    
/** SPI lines ****************************************************/
    // donne une indication sur les port utiliser

//#define HW_SPI_SDI_PIN  LATDbits.LATD3
#define HW_SPI_SDO_PIN  LATDbits.LATD0
#define HW_SPI_SCK_PIN  LATDbits.LATD1

//#define spi_set_tris_sdi()  -1   //pin x
#define spi_set_tris_sdo()  -1  //pin 11
#define spi_set_tris_sck()  -1  //pin 14



/** LCD EXTEND PIN ****************************************************/
#define LCD_CS LATDbits.LATD9
#define LCD_DC LATDbits.LATD11
#define LCD_RST LATDbits.LATD10
#define LCD_LED LATDbits.LATD2

#define lcd_set_tris_cs()    -1   //pin 13
#define lcd_set_tris_dc()    -1   //pin 12
#define lcd_set_tris_rst()   -1   //pin 10
#define lcd_set_tris_led()   -1   //pin 9
    
    


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _HARDWARE_H */

/* *****************************************************************************
 End of File
 */
