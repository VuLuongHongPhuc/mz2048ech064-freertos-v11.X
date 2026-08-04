


#include <xc.h>
#include <sys/attribs.h>  // ipl2
//#include "cp0defs.h" declarer dans xc.h
//#include "pic32m_builtins.h"  //__builtin_enable_interrupts

#include <stddef.h>             // Defines NULL

#include "core_timer.h"
//#include "bsp_gpio.h"




static uint32_t coretimer_compare_value = 0;
static uint32_t coretimer_periode = 0;




/* @brief Initialisze the core timer for interrupt
 * @param[in] period
 * 
 * MS_TO_CT_TICKS -> milliseconds
 * US_TO_CT_TICKS -> µs
 */
void CORETIMER_Initialize(uint32_t period)
{   
    uint32_t int_flag;
    
    /* Disable interrupts globally */
    int_flag = __builtin_disable_interrupts();
            
    // Set the core timer period
    coretimer_compare_value = coretimer_periode = MS_TO_CT_TICKS * period;
    _CP0_SET_COMPARE(coretimer_periode);

    // Clear the core timer count register
    _CP0_SET_COUNT(0);
    
    // Set the next compare value
    coretimer_compare_value += coretimer_periode;
    
    // Enable the core timer interrupt
    IPC0bits.CTIP = 2;  // Set core timer interrupt priority
    IPC0bits.CTIS = 0;  // Set core timer interrupt sub-priority
    IEC0SET = _IEC0_CTIE_MASK; // Enable the core timer interrupt

    if (int_flag)
    {
        /* Enable interrupts globally */
        __builtin_enable_interrupts();
    }
}

/* @brief Start Core timer - Enable IT
 */
void CORETIMER_Start(void)
{
    /* Clear the core timer interrupt flag */
    IFS0CLR = _IFS0_CTIF_MASK; 
    
    /* Enable the core timer interrupt */
    IEC0SET = _IEC0_CTIE_MASK;
}

/* @brief Stop Core timer - Disable IT
 */
void CORETIMER_Stop(void)
{
    IEC0CLR = _IEC0_CTIE_MASK;
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



typedef void (*CORETIMER_CallbackFunct)(uintptr_t context);
static CORETIMER_CallbackFunct CallbackEventHandler = NULL;
static uintptr_t CallbackContext;

void CORETIMER_CallbackRegister(void* callbackFunc, uintptr_t context)
{
    if (callbackFunc == NULL)
    {
        return;
    }
    
    CallbackEventHandler = (CORETIMER_CallbackFunct)callbackFunc;
    CallbackContext = context;
}

__attribute__((weak)) void CORETIMER_callback(void)
{
}

#if 0
/* Determine IPL and context-saving mode at runtime */
void __interrupt(2) myisr2_RUNTIME(void) 
{
}
#endif



/*! \brief CoreTimer interrupt
 * 
 * \param[in] vector name
 * \param[in] priority level
 */
void __ISR(_CORE_TIMER_VECTOR, IPL2AUTO) _InterruptCoreTimerHandler(void)
{
    // update the period
    _CP0_SET_COMPARE(coretimer_compare_value);
    
    // Set the next compare value
    coretimer_compare_value += coretimer_periode;
    
    // Toggle the LED
    //LED_3_Toggle();
    
    // Clear the core timer interrupt flag
    IFS0CLR = _IFS0_CTIF_MASK; 

    
    // Callback function
    if (CallbackEventHandler != NULL)
    {
        CallbackEventHandler(CallbackContext);
    }
    
    CORETIMER_callback();
}

/*EOF*/
