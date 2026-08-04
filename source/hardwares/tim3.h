/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    tim3.h

  @Summary
    For FreeRTOS statistic

  @Description
    FreeRTOS need a variable to count at a frequency. Here 20KHz is selected.
 */
/* ************************************************************************** */

#ifndef _DRV_TIM3_H    /* Guard against multiple inclusion */
#define _DRV_TIM3_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */



/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    // *****************************************************************************
    // *****************************************************************************
    // Section: Data Types
    // *****************************************************************************
    // *****************************************************************************

    typedef void (*TMR3_CALLBACK)(uint32_t status, uintptr_t context);
    
    typedef struct
    {
        /*TMR callback function happens on Period match*/
        TMR3_CALLBACK callback_fn;
        /* - Client data (Event Context) that will be passed to callback */
        uintptr_t context;

    }TMR3_TIMER_OBJECT;
   
    


    void TMR3_Initialize(void);
    void TMR3_Start(void);
    void TMR3_Stop (void);
    void TMR3_PeriodSet(uint16_t period);
    uint16_t TMR3_PeriodGet(void);
    uint16_t TMR3_CounterGet(void);
    void TMR3_InterruptEnable(void);
    void TMR3_InterruptDisable(void);
    void TMR3_CallbackRegister( TMR3_CALLBACK callback_fn, uintptr_t context );

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _DRV_TIM3_H */

/* *****************************************************************************
 End of File
 */
