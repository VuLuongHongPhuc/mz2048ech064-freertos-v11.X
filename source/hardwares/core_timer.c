

#include <stddef.h>             // Defines NULL
#include <xc.h>
#include <sys/attribs.h>  // ipl2
//#include "cp0defs.h" declarer dans xc.h
//#include "pic32m_builtins.h"  //__builtin_enable_interrupts


#include "core_timer.h"


typedef void (*CORETIMER_CallbackFunct)(uintptr_t context);

typedef struct
{
    CORETIMER_CallbackFunct callbackFunc;
    uintptr_t context;
}CoreTimerObj_t;

static volatile CoreTimerObj_t coretimer_obj = {
    .callbackFunc = NULL,
    .context = 0
};

static uint32_t coretimer_compare_value = 0;
static uint32_t coretimer_periode = 0;




/* @brief Initialisze the core timer for interrupt
 * @param[in] period
 * 
 * @note MS_TO_CT_TICKS -> milliseconds
 * @note US_TO_CT_TICKS -> µs
 */
void CORETIMER_Initialize(uint32_t period)
{   
    /* stop timer in debug mode */
    _CP0_SET_DEBUG(_CP0_GET_DEBUG() & ~_CP0_DEBUG_COUNTDM_MASK);
    
    /* Set the core timer period */
    coretimer_periode = MS_TO_CT_TICKS * period;
    coretimer_compare_value = coretimer_periode;
    _CP0_SET_COMPARE(coretimer_periode);

    /* Clear the core timer count register */
    _CP0_SET_COUNT(0);
    
    /* Set the next compare value */
    coretimer_compare_value += coretimer_periode;
    
    /* Set interrupt priority */
    IPC0bits.CTIP = 1;  /* Set core timer interrupt priority [1..7] */
    IPC0bits.CTIS = 0;  /* Set core timer interrupt sub-priority [0..3] */
    
    CORETIMER_Start();
}

void CORETIMER_count_tick(unsigned long nCount)
{
    unsigned long stop;
    stop = _CP0_GET_COUNT() + nCount;
    while (_CP0_GET_COUNT() < stop);
}


/* wait at least usec microseconds */
void CORETIMER_delay_us(unsigned long usec)
{
    unsigned long start, stop;

    /* get start ticks */

    start = _CP0_GET_COUNT();

    /* calculate number of ticks for the given number of microseconds */
    stop = usec * US_TO_CT_TICKS;

    /* add start value */
    stop += start;

    /* wait till Count reaches the stop value */
    while (_CP0_GET_COUNT() < stop);
}

/* wait at least msec  milliseconds */
void CORETIMER_delay_ms(unsigned long msec)
{
    unsigned long start, stop;

    /* get start ticks */

    start = _CP0_GET_COUNT();

    /* calculate number of ticks for the given number of microseconds */
    stop = msec * MS_TO_CT_TICKS;

    /* add start value */
    stop += start;

    /* wait till Count reaches the stop value */
    while (_CP0_GET_COUNT() < stop);
}

void CORETIMER_CallbackRegister(void* callbackFunc, uintptr_t context)
{
    if (callbackFunc == NULL)
    {
        return;
    }
    
    coretimer_obj.callbackFunc = (CORETIMER_CallbackFunct)callbackFunc;
    coretimer_obj.context = context;
}

__attribute__((weak)) void CORETIMER_callback(void)
{
}

void __ISR(_CORE_TIMER_VECTOR, IPL1AUTO) _InterruptCoreTimerHandler(void)
{
    /* Start Critical Section */
    (void) __builtin_disable_interrupts();
    
    /* update the period */
    _CP0_SET_COMPARE(coretimer_compare_value);
    
    /* Set the next compare value */
    coretimer_compare_value += coretimer_periode;
    
    /* Clear the core timer interrupt flag */
    IFS0CLR = _IFS0_CTIF_MASK;
    
    /* End Critical Section */
    (void) __builtin_enable_interrupts();

    /* Example 1 : Callback function with function pointer */
    if (coretimer_obj.callbackFunc != NULL)
    {
        coretimer_obj.callbackFunc(coretimer_obj.context);
    }
    
    /* Example 2 : Callback function with weak */
    CORETIMER_callback();
}

/*EOF*/
