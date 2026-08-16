


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include "xc.h"
//#include <p32xxxx.h>
#include "gpio.h"
#include "can1.h"
#include "uart1.h"
#include "spi.h"
#include "core_timer.h"

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */

static void PeripheralClock(void);
static void SystemUnlockSequenceKey(void);



/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

static inline void SystemLockSequenceKey(void)
{
    /* Lock sequence KEY */
    SYSKEY = 0x33333333;
}

static void SystemUnlockSequenceKey(void)
{
    /* Unlock sequence KEY */
    SYSKEY = 0x00000000;
	SYSKEY = 0xAA996655;
	SYSKEY = 0x556699AA;
}

static inline void SYS_INT_Enable(void)
{
    // doit avoir IE=1 EXL=0 ERL=0 DM=0 pour que l'interrupt soit actif
    //__builtin_mtc0(12, 0,(__builtin_mfc0(12, 0) | 0x0001));    
    __builtin_mtc0(_CP0_STATUS, _CP0_STATUS_SELECT,(__builtin_mfc0(_CP0_STATUS, _CP0_STATUS_SELECT) | 0x0001));
}

static inline void SYS_INT_Disable(void)
{
    __builtin_mtc0(_CP0_STATUS, _CP0_STATUS_SELECT,(__builtin_mfc0(_CP0_STATUS, _CP0_STATUS_SELECT) & 0xFFFFFFFE));
}


void SYS_Initialize(void)
{
    /* NOTE: Interrupts must be disabled when enabling the Prefetch Cache Module */
    
    (void)__builtin_disable_interrupts();
    
    PeripheralClock();
    
    /* Configure Prefetch, Wait States and ECC */
    PRECONbits.PREFEN = 0b11;
    PRECONbits.PFMWS  = 0b001;
    CFGCONbits.ECCCON = 0b11; // (default)
    CFGCONbits.JTAGEN = 0;    // disable JTAG (default)
    
    // Data Memory SRAM wait states: Default Setting = 1; set it to 0
    //BMXCONbits.BMXWSDRM = 1;
    
// *** interrupt **********************
    
    // 0: Interrupt controller configured for Single-vectored mode
    // 1: Interrupt controller configured for Multi-vectored mode
    INTCONSET = _INTCON_MVEC_MASK; // INTCONbits.MVEC = 1;
    
    // Interrupt Proximity Timer Control bits
    //INTCONbits.TPC = 0; //default disable
    
    
    GPIO_init();
    
    /* Initialize peripheral */
    CORETIMER_Initialize(1000);
    UART1_Initialize();
    //SPI1_Initialize();

    
    (void)__builtin_enable_interrupts();
}


static void PeripheralClock(void)
{   
    SystemUnlockSequenceKey();
    
    
    //OSCCONbits.FRCDIV = 0; // OSC_FRC_DIV_1 (default)
    //OSCCONbits.SOSCRDY    secondary oscillator ready indicator
    
    /* PBxDIV : PERIPHERAL BUS ?x? CLOCK DIVISOR CONTROL REGISTER */
    
    /* PBCLK1: OSC2 */
    //PB2DIVbits.ON !                  /*!< The clock for peripheral bus 1 cannot be turned off */
    while(PB1DIVbits.PBDIVRDY == 0);
    PB1DIVbits.PBDIV = 1;              /*!< PBCLK1 is SYSCLK divided by 2 (default value=1)*/
    
    /* PBCLK2: PMP, I2C, UART, SPI */
    /* PB2DIVbits.ON default ON */
    if (PB2DIVbits.ON)
    {
        while(PB2DIVbits.PBDIVRDY == 0);
        PB2DIVbits.PBDIV = 1;              /*!< PBCLK2 is SYSCLK divided by 2 (default value=1)*/
    }
    
    /* PBCLK3: ADC, CMP, Timers, Output compare, Input compare */
    if (PB3DIVbits.ON)
    {
        while(PB3DIVbits.PBDIVRDY == 0);
        PB3DIVbits.PBDIV = 1;              /*!< PBCLK3 is SYSCLK divided by 2 (default value=1)*/
    }
    
    /* PBCLK4: Ports */
    if (PB4DIVbits.ON)
    {
        while(PB4DIVbits.PBDIVRDY == 0);
        PB4DIVbits.PBDIV = 1;             /*!< PBCLK4 is SYSCLK divided by 2 (default value=1)*/
    }
    
    /* PBCLK5 : Flash, Crypto, CAN, Ethernet, SQI */
    if (PB5DIVbits.ON)
    {
        while(PB5DIVbits.PBDIVRDY == 0);
        PB5DIVbits.PBDIV = 1;             /*!< PBCLK5 is SYSCLK divided by 2 (default value=1)*/
    }
    
    /* PBCLK7: CPU, Deadman Timer */
    if (PB7DIVbits.ON)
    {
        while(PB7DIVbits.PBDIVRDY == 0);
        PB7DIVbits.PBDIV = 0;              /*!< PBCLK7 is SYSCLK (default value=0)*/
    }
    
    /* PBCLK8: EBI */
    if (PB8DIVbits.ON)
    {
        while(PB8DIVbits.PBDIVRDY == 0);
        PB8DIVbits.PBDIV = 1;              /*!< PBCLK8 is SYSCLK divided by 2 (default value=1)*/
    }
    
    
    
    REFO1CONbits.ON = 0; /* Disable REFCLKO1*/
    REFO1CONbits.OE = 0; /* Disable REFCLK1_OE*/
    
    REFO2CONbits.ON = 0; /* Disable REFCLKO2*/
    REFO2CONbits.OE = 0; /* Disable REFCLK2_OE*/
    
    REFO3CONbits.ON = 0; /* Disable REFCLKO3*/
    REFO3CONbits.OE = 0; /* Disable REFCLK3_OE*/
    
    REFO4CONbits.ON = 0; /* Disable REFCLKO4*/
    REFO4CONbits.OE = 0; /* Disable REFCLK4_OE*/
    
    
    SystemLockSequenceKey();
}


/*EOF*/
