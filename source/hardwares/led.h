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

#ifndef _BOARD_LED_H    /* Guard against multiple inclusion */
#define _BOARD_LED_H



/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif




//pin 38 RF3 - also use for USBID -> need to desactivate to use in I/O mode
#define LED_1       LATFbits.LATF3  // ambre
//#define LED_1_Port_Mask  0x0008 // bit.3
#define PIN_F3_Mask               (1U<<3) // bit.3
#define LED_1_OutputEnable()      (TRISFCLR = (1U<<3))
#define LED_1_InputEnable()       (TRISFSET = (1U<<3))
#define LED_1_Set()               (LATFSET  = PIN_F3_Mask)
#define LED_1_Clear()             (LATFCLR  = PIN_F3_Mask)
#define LED_1_Toggle()            (PORTFINV = PIN_F3_Mask)
#define LED_1_Get()               ((PORTF >> 3) & 0x1U)


//pin 41 RF4
#define PIN_F4_Mask               (1U<<4) // bit.4
#define LED_2_OutputEnable()      (TRISFCLR = PIN_F4_Mask)
#define LED_2_InputEnable()       (TRISFSET = PIN_F4_Mask)
#define LED_2_Set()               (LATFSET  = PIN_F4_Mask)
#define LED_2_Clear()             (LATFCLR  = PIN_F4_Mask)
#define LED_2_Toggle()            (PORTFINV = PIN_F4_Mask)
#define LED_2_Get()               ((PORTF >> 4) & 0x1U)


//pin 42 RF5
#define PIN_F5_Mask               (1U<<5)
#define LED_3_OutputEnable()      (TRISFCLR = PIN_F5_Mask)
#define LED_3                     LATFbits.LATF5  // blue
#define LED_3_Set()               (LED_3 = 1)
#define LED_3_Clear()             (LED_3 = 0)
#define LED_3_Toggle()            (LED_3 ^= 1)
    

void LED_Initialize(void);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _BOARD_LED_H */

/* *****************************************************************************
 End of File
 */
