/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    bsp_tim.c

  @Summary
    BSP timer.

  @Description
    Management/interfaces timers
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include "xc.h"
#include <sys/attribs.h>  // ipl2

#include "tim2.h"

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */


volatile static TMR2_TIMER_OBJECT tmr2Obj;


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */




/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

void TMR2_Initialize(void)
{
    /* TMR 2 to 9
     * PB3DIV -> PBCLK3 = 50 MHz
     * PRx = 16 bits
     * 
     * Target: set for 1 ms => frequency = 1 KHz
     */
    
    /*
     * OFF009<17:1>
     * IFS0<9>      interrupt flag T3IF
     * IEC0<9>      enable/disable timer interrupt
     * IPC2<12:10>  interrupt priority
     * IPC2<9:8>    interrupt sub-priority
     */
    
    /* Disable Timer */
    T2CONCLR = _T2CON_ON_MASK;

    /*
    SIDL  = 0
    TCKPS = 5   prescaler 1:32
    T32   = 0
    TCS   = 0
    */
    T2CONSET = 0x50;

    /* Clear counter */
    TMR2 = 0x0;

    /* Set period */
    PR2 = 1561U;    /* PR2 = ((PBCLK/prescaler) x 1ms ) - 1 */

    /* Interrupt priority p.116 */
    IPC2bits.T2IP = 1;  /* Set timer interrupt priority : IPL 1 */
    IPC2bits.T2IS = 1;  /* Set timer interrupt sub-priority */
    
    /* Enable TMR2 Interrupt */
    IEC0SET |= _IEC0_T2IE_MASK;

}

void TMR2_Start(void)
{
    T2CONSET = _T2CON_ON_MASK;
}

void TMR2_Stop (void)
{
    T2CONCLR = _T2CON_ON_MASK;
}

void TMR2_CallbackRegister( TMR2_CALLBACK callback_fn, uintptr_t context )
{
    /* Save callback_fn and context in local memory */
    tmr2Obj.callback_fn = callback_fn;
    tmr2Obj.context = context;
}

void __ISR(_TIMER_2_VECTOR, IPL1AUTO) _InterruptTimer2Handler(void)
{
    uint32_t status  = 0U;
    status = IFS0bits.T2IF;
    IFS0CLR = _IFS0_T2IF_MASK;
    
    //LATBbits.LATB10 ^= 1; // OK
    
    if((tmr2Obj.callback_fn != NULL))
    {
        uintptr_t context = tmr2Obj.context;
        tmr2Obj.callback_fn(status, context);
    }
}

/* END: TIMER 2 */


/* *****************************************************************************
 End of File
 */
