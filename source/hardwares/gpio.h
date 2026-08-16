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

#ifndef _GPIO_INIT_H    /* Guard against multiple inclusion */
#define _GPIO_INIT_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */




/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    /* NOTES:
     * CNPUx pull-up 0:disable 1:enable (mettre disable si pin en output) (default=0)
     * ANSELx = AD1PCFG register 1:analog 0:digital (=1 si A/D module off) (default=1)
     * ODCx open drain configuration 0:drive 1:open drain (default=0)
     * SRCON0x Slew Rate Control register. exist?
     * SRCON1x Slew Rate Control register; exist?
     * SLEEP ? how to configure
     * SYSCLK dependency
     * 
     * ATOMIC bit manipulation:
     * TRISxSET
     * PORTxCLR
     * LATxINV
    */   
    
    
/**** DEF *******************************************/
    
    /* signal : LATx/PORTx */
    #define HIGH 1
    #define LOW  0

    /* mode : TRISx*/
    #define OUTPUT_PIN   0
    #define INPUT_PIN    1

    /* PULL UP : CNPUx*/
    #define CNPU_PULLUP_ENABLE 1
    #define CNPU_PULLUP_DISABLE 0

    /* ANALOG / DIGITAL : ANSELx*/
    #define IO_DIGITAL 0
    #define IO_ANALOG  1
    


/*** LED **********************************************************************/

//pin 38 RF3 - also use for USBID -> need to desactivate to use in I/O mode

//#define LED_1_Port_Mask  0x0008 // bit.3
#define LED_RF3                   LATFbits.LATF3
#define PIN_RF3_Pos               3
#define PIN_RF3_Mask              0x0008 // bit.3 = (1 << 3)
#define LED_RF3_OutputEnable()    (TRISFCLR = PIN_RF3_Mask)
#define LED_RF3_InputEnable()     (TRISFSET = PIN_RF3_Mask)
#define LED_RF3_Set()             (LATFSET  = PIN_RF3_Mask)
#define LED_RF3_Clear()           (LATFCLR  = PIN_RF3_Mask)
#define LED_RF3_Toggle()          (PORTFINV = PIN_RF3_Mask)
#define LED_RF3_Get()             ((PORTF >> PIN_RF3_Pos) & 0x1U)

//pin 41 RF4
#define PIN_RF4_Pos               4
#define PIN_RF4_Mask              0x0010 // bit.4
#define LED_RF4_OutputEnable()    (TRISFCLR = PIN_RF4_Mask)
#define LED_RF4_InputEnable()     (TRISFSET = PIN_RF4_Mask)
#define LED_RF4_Set()             (LATFSET  = PIN_RF4_Mask)
#define LED_RF4_Clear()           (LATFCLR  = PIN_RF4_Mask)
#define LED_RF4_Toggle()          (PORTFINV = PIN_RF4_Mask)
#define LED_RF4_Get()             ((PORTF >> PIN_RF4_Pos) & 0x1U)



//pin 42 RF5
#define PIN_RF5_Pos               5
#define PIN_RF5_Mask              0x0020
#define LED_RF5_OutputEnable()    (TRISFCLR = PIN_F5_Mask)
#define LED_RF5                   LATFbits.LATF5
#define LED_RF5_Set()             (LED_3 = 1)
#define LED_RF5_Clear()           (LED_3 = 0)
#define LED_RF5_Toggle()          (LED_3 ^= 1)
        
    
/*** GPIO *********************************************************************/
/* TRISx, LATx, */ 
    

    
//RB10
#define RB10_Mask                (1U<<10)
#define RB10_OutputEnable()      (TRISBCLR = RB10_Mask)//(TRISBbits.TRISB10=OUTPUT_PIN) //
#define RB10_InputEnable()       (TRISBSET = RB10_Mask)
#define RB10_Set()               (LATBSET  = RB10_Mask)
#define RB10_Clear()             (LATBCLR  = RB10_Mask)
#define RB10_Toggle()            (PORTBINV = RB10_Mask)//(LATBbits.LATB10 ^= 1)// speed switch effect?
    
/**** SWITCH / BOUTON *********************************************************/
/* PORTx, TRISx */

#define BTN_IGNORE_FACTOR 10

//pin 1
//#define SW1_set_tris()    TRISBbits.TRISB=INPUT_PIN
#define SW1         PORTEbits.RE5
#define SW1_Read()  SW1
    
/*** ILI9143 screen 240x320 ***************************************************/
#define RD9_Mask                  (1U << 9)
#define SPI_CS_OutputEnable()     (TRISDCLR = RD9_Mask)
#define SPI_CS_Set()              (LATDSET  = RD9_Mask)
#define SPI_CS_Clear()            (LATDCLR  = RD9_Mask)

#define RD10_Mask                 (1U << 10)
#define SPI_Reset_OutputEnable()  (TRISDCLR = RD10_Mask)
#define SPI_Reset_Set()           (LATDSET  = RD10_Mask)
#define SPI_Reset_Clear()         (LATDCLR  = RD10_Mask)
    
#define RD11_Mask                 (1U << 11)
#define SPI_DC_OutputEnable()     (TRISDCLR = RD11_Mask)
#define SPI_DC_Set()              (LATDSET  = RD11_Mask)
#define SPI_DC_Clear()            (LATDCLR  = RD11_Mask)
    
#define RD0_Mask                  (1U << 0)
#define SPI_LED_OutputEnable()    (TRISDCLR = RD0_Mask)
#define SPI_LED_Set()             (LATDSET  = RD0_Mask)
#define SPI_LED_Clear()           (LATDCLR  = RD0_Mask) 
    
/**** Global Function *********************************************************/
    void GPIO_init(void);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _GPIO_INIT_H */

/* *****************************************************************************
 End of File
 */
