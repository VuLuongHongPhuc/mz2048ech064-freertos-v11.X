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


/********************************* Includes ***********************************/
#include <stdint.h>
#include <xc.h>


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

/********************************* Constants definition ***********************/
    
/********************************* Macros definition **************************/
    
/********************************* Types definition ***************************/
    
    typedef void (*TMR3_CALLBACK)(uintptr_t context);
    
/********************************* Public variables ***************************/

/********************************* API functions prototype ********************/

    void TMR3_Initialize(void);

    void TMR3_InterruptEnable(void);
    void TMR3_InterruptDisable(void);
    void TMR3_CallbackRegister( TMR3_CALLBACK callback_fn, uintptr_t context );
    
    static inline void TMR3_Start(void)
    {
        T3CONSET = _T3CON_ON_MASK;
    }

    static inline void TMR3_Stop (void)
    {
        T3CONCLR = _T3CON_ON_MASK;
    }

    static inline void TMR3_PeriodSet(uint16_t period)
    {
        PR3  = period;
    }

    static inline uint16_t TMR3_PeriodGet(void)
    {
        return (uint16_t)PR3;
    }
    
    static inline uint16_t TMR3_CounterGet(void)
    {
        return (uint16_t)(TMR3);
    }


/* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _DRV_TIM3_H */

/* *****************************************************************************
 End of File
 */
