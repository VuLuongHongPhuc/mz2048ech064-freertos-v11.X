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

#ifndef _DRV_CORE_TIMER_H    /* Guard against multiple inclusion */
#define _DRV_CORE_TIMER_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */

#include <stdint.h>


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    /**** SYSTEM *******************************************/
    // SYSTEM CLOCK       : 100 MHz
    // OSCILLATOR EXTERN  : EC 24 MHz

    /* CP0.Count counts at half the CPU rate */
    #define SYSCLOCK_HZ 100000000       // SYSCLOCK 100 MHz
    #define CORE_TICK_HZ (SYSCLOCK_HZ / 2)
    #define US_TO_CT_TICKS  (CORE_TICK_HZ/1000000UL) // uS to CoreTimer Ticks => n ticks/millisec
    #define MS_TO_CT_TICKS  (CORE_TICK_HZ/1000UL)    // mS to CoreTimer Ticks => n ticks/millisec




    void CORETIMER_Initialize(uint32_t period);
    //#define CORETIMER_Start()  (IEC0SET = _IEC0_CTIE_MASK) // Enable the core timer interrupt
    //#define CORETIMER_Stop()   (IEC0CLR = _IEC0_CTIE_MASK) // Disable the core timer interrupt
    void CORETIMER_CallbackRegister(void* callbackFunc, uintptr_t context);
    
    void CORETIMER_count_tick(unsigned long nCount);
    void CORETIMER_delay_us(unsigned long uSec);
    void CORETIMER_delay_ms(unsigned long mSec);

    
    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _DRV_CORE_TIMER_H */

/* *****************************************************************************
 End of File
 */
