/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#include "xc.h"
#include <sys/attribs.h>  // IPLxAUTO, IPLxSRS
#include "tim3.h"

#define TMR3_FREQ_WISH   20000u /* 20kHz */

volatile static TMR3_TIMER_OBJECT tmr3Obj;



void TMR3_Initialize(void)
{
    /* TMR 2 to 9
     * PB3DIV -> PBCLK3 = 50 MHz
     * PRx = 16 bits
     * 
     * Target : set for 50 µs => frequency = 20 KHz
     * priority level : 0->won't trig, 1->lowest, 7->highest
     */
    
    /* Disable Timer */
    T3CONCLR = _T3CON_ON_MASK;

    /*
    SIDL  = 0
    TCKPS = 3   prescaler 1:8
    T32   = 0
    TCS   = 0
    */
    T3CONSET = 0x30;

    /* Clear counter */
    TMR3 = 0x0;

    /* Set period */
    PR3 = 311U;     /* PR3 = ((PBCLK3/prescaler) x 50us ) - 1 */

    /* Interrupt priority p.116 */
    IPC3bits.T3IP = 1;  // Set timer interrupt priority
    IPC3bits.T3IS = 0;  // Set timer interrupt sub-priority
    
    /* Enable TMR3 Interrupt */
    IEC0SET |= _IEC0_T3IE_MASK;

    /*
     * OFF014<17:1>
     * IFS0<14>     interrupt flag T3IF
     * IEC0<14>     enable/disable timer interrupt
     * IPC3<20:18>  interrupt priority
     * IPC3<17:16>  interrupt sub-priority
     */
    
    /* TxCON: TYPE B TIMER CONTROL REGISTER (?x? = 2-9) p.280
     * PBxDIV: PERIPHERAL BUS ?x? CLOCK DIVISOR CONTROL REGISTER (?x? = 1-8) p.160
     */
    
    /* INTCON: INTERRUPT CONTROL REGISTER     p.141
     * PRISS: PRIORITY SHADOW SELECT REGISTER p.142
     * INTSTAT: INTERRUPT STATUS REGISTER     p.144
     * IPTMR: INTERRUPT PROXIMITY TIMER REGISTER p.144
     * OFFx: INTERRUPT VECTOR ADDRESS OFFSET REGISTER (x = 0-190) p.148
     * IFSx: INTERRUPT FLAG STATUS REGISTER      p.145
     * IECx: INTERRUPT ENABLE CONTROL REGISTER   p.145
     * IPCx: INTERRUPT PRIORITY CONTROL REGISTER p.146
     */
}

void TMR3_Start(void)
{
    T3CONSET = _T3CON_ON_MASK;
}

void TMR3_Stop (void)
{
    T3CONCLR = _T3CON_ON_MASK;
}

void TMR3_PeriodSet(uint16_t period)
{
    PR3  = period;
}

uint16_t TMR3_PeriodGet(void)
{
    return (uint16_t)PR3;
}

uint16_t TMR3_CounterGet(void)
{
    return (uint16_t)(TMR3);
}

uint32_t TMR3_FrequencyGet(void)
{
    return (TMR3_FREQ_WISH);
}

void TMR3_InterruptEnable(void)
{
    IEC0SET = _IEC0_T3IE_MASK;
}

void TMR3_InterruptDisable(void)
{
    IEC0CLR = _IEC0_T3IE_MASK;
}

/**
 * @brief Set callback
 * @param callback_fn
 * @param context
 */
void TMR3_CallbackRegister( TMR3_CALLBACK callback_fn, uintptr_t context )
{
    /* Save callback_fn and context in local memory */
    tmr3Obj.callback_fn = callback_fn;
    tmr3Obj.context = context;
}


void __attribute__((used)) TIMER_3_InterruptHandler (void)
{
    uint32_t status  = 0U;
    status = IFS0bits.T3IF;    /* Copy status */
    IFS0CLR = _IFS0_T3IF_MASK; /* Clear flag */

    if((tmr3Obj.callback_fn != NULL))
    {
        uintptr_t context = tmr3Obj.context;
        tmr3Obj.callback_fn(status, context);
    }
}

void __ISR(_TIMER_3_VECTOR, IPL1AUTO) _InterruptTimer3Handler(void)
{
    TIMER_3_InterruptHandler();
}

/*** Interrupt ****************************************************************/
//https://forum.microchip.com/s/topic/a5C3l000000MVQpEAO/t350883
//IPCx registers and SRS control registers
//IPL2SOFT, IPL3AUTO, IPL5SRS
// #pragma config  FSRSSEL = PRIORITY_5   /* Priority to use for SRS register set. */ 

/* *****************************************************************************
 End of File
 */
