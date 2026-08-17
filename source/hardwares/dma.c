/**
 * @file dma.c
 * @brief Interface DMA driver.
 * 
 * @author Phuc VU
 * @date 2026-08-07
 * 
 * @note Prerequisites:
 * - configure the peripheral
 * - clear IFSx bit flag
 * - don't enable IECx on the peripheral -> DMA will self manage it
 * 
 * This example use UART1 TX to transmit a block of message
 */


/********************************* Includes ***************************************/

#include <xc.h>
#include <sys/attribs.h>
#include <sys/kmem.h>  // KVA_TO_PA

#include "dma.h"

/********************************* Constants definition ***************************/

#define IPC33_DMA0_PRIORITY_MASK        (0x7U << 18)
#define IPC33_DMA0_SUBPRIORITY_MASK     (0x3U << 16)
#define IPC33_DMA0_CLR_MASK             (IPC33_DMA0_PRIORITY_MASK | IPC33_DMA0_SUBPRIORITY_MASK)

#define DCHxINT_CLR_ALL_MASK   0x00FF00FFU

/********************************* Macros definition ******************************/

/********************************* Types definition *******************************/

typedef struct
{
    bool init;
}DmaStatus_t;

/********************************* Local variable *********************************/

static DmaStatus_t _dma_status = {
    .init = false
};

//static uint8_t uart_tx_buf[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

/********************************* Local functions prototype **********************/

/********************* API implementation *****************************************/

void DMA_Initialize(void)
{
    /* channel [0..7]
     * DMACON
     * DCHxCON: DMA CHANNEL x CONTROL REGISTER
     * DCHxECON: DMA CHANNEL x EVENT CONTROL REGISTER
     * DCHxINT: DMA CHANNEL x INTERRUPT CONTROL REGISTER
     * IECx
     * IFSx
     */
    
    IEC4bits.DMA0IE = 0;        /* disable DMA channel 0 interrupts */
    IFS4bits.DMA0IF = 0;        /* clear any existing DMA channel 0 interrupt flag */
    
    DMACONbits.ON = 1;          /* Enable DMA0 */
    
    DCH0CONbits.CHEN = 0;       /* Channel Enable bit : off */
    DCH0CONbits.CHPRI = 0b11;   /* Channel Priority bits [0..3] : 3 (highest) */
    
    DCH0ECONbits.CHSIRQ = _UART1_TX_VECTOR;     /* p.120 */
    DCH0ECONbits.CHAIRQ = _UART1_FAULT_VECTOR;
    DCH0ECONbits.SIRQEN = 1; /* Channel Start IRQ Enable bit : enable */
    
    //DCH0SSA = KVA_TO_PA( &( uart_tx_buf[0] ) ); /* transfer source physical address */
    DCH0DSA = KVA_TO_PA( &U1TXREG );            /* transfer destination physical address */
    //DCH0SSIZ = 6;                               /* source size is n byte */
    DCH0DSIZ = 1;                               /* destination size at most 1 bytes */
    DCH0CSIZ = 1;                               /* one byte per UART transfer request */
    
    DCH0INTCLR = DCHxINT_CLR_ALL_MASK;      /* Clear existing events, disable all interrupts */
    DCH0INTbits.CHBCIE = 1;                 /* Channel Block Transfer Complete Interrupt Enable bit */
    
    IPC33CLR = IPC33_DMA0_CLR_MASK; /* clear the DMA channel 0 priority and sub-priority */
    IPC33bits.DMA0IP = 2;       /* Set IPL [1..7] */
    IPC33bits.DMA0IS = 0;       /* Sub-priority [0..3] */
    
    //IEC4bits.DMA0IE = 1;            /* DMA channel 0 interrupts bits : enable */
    //DCH0CONbits.CHEN = 1;           /* Channel Enable bit : on */
    
    _dma_status.init = true;
}

bool DMA_CH0_UART1_TX_Transfer(uint8_t * buf, uint32_t size)
{
    /* Is DMA initialize ? */
    if (!_dma_status.init)
    {
        return false;
    }
    
    /* Parameters error ? */
    if ((buf == NULL) || (size == 0))
    {
        return false;
    }
    
    /* DMA channel busy ? */
    if ( DCH0CONbits.CHBUSY )
    {
        return false;
    }
    
    DCH0SSA = KVA_TO_PA( buf ); /* transfer source physical address */
    DCH0SSIZ = size;            /* source size is n byte */

    DCH0INTbits.CHBCIE = 1;     /* Channel Block Transfer Complete Interrupt Enable bit */

    IFS4bits.DMA0IF = 0;        /* clear any existing DMA channel 0 interrupt flag */
    IEC4bits.DMA0IE = 1;        /* DMA channel 0 interrupts bits : enable */
    DCH0CONbits.CHEN = 1;       /* Channel Enable bit : on */

    DCH0ECONbits.CFORCE = 1; /* force transfert */

    return true;
}

void __ISR(_DMA0_VECTOR, IPL2AUTO) _InterruptDma0Handler(void)
{    
    DCH0INTCLR = DCHxINT_CLR_ALL_MASK;  /* Clear existing events, disable all interrupts */
    IEC4bits.DMA0IE = 0;                /* disable DMA channel 0 interrupts */
    IFS4bits.DMA0IF = 0;                /* clear any existing DMA channel 0 interrupt flag */
    DCH0CONbits.CHEN = 0;               /* Channel Enable bit : off */
}

/* *****************************************************************************
 End of File
 */
