/**
 * @file uart1.c
 * @brief UART1 interface
 * @details This file contains the interface for UART1 operations.
 * 
 * @author Phuc VU
 * @date 2026-08-06
 */

/* FIFO 8 deep
 */

/********************************* Includes ***********************************/

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

#include "xc.h"
#include <sys/attribs.h>  // IPLxAUTO, IPLxSRS

#include <FreeRTOS.h>
#include <stream_buffer.h>

#include "gpio.h"
#include "stream.h"

/********************************* Constants***********************************/

#define __UART1_INT_TX_ENABLE__     1
#define __UART1_INT_RX_ENABLE__     1
#define __UART1_INT_FAULT_ENABLE__  0

#define UART1_FIFO_SIZE            8U
#define TX_BUFFER_SIZE           128U


/********************************* Local variables ****************************/
static uint8_t _txBuf[TX_BUFFER_SIZE+1];

static Stream_t _txStream;
/********************************* Local prototypes ***************************/
static void SetBaudrate(uint32_t baud);
static void InterruptConfiguration(void);
static void RemapPinConfiguration(void);

/********************************* API ****************************************/

void UART1_Initialize(void)
{
    /*
     * UxMode
     * UxSTA
     * UxTXREG
     * UxRXREG
     * UxBRG
     * 
     * FIFO 8 level deep
     * UxMode Default 8N1
     */
    
    STREAM_Initialize(&_txStream, _txBuf, TX_BUFFER_SIZE);
    
    /* Disable */
    U1MODEbits.ON = 0;
    
    
    
    /* UxSTA */
    U1STAbits.URXEN = 1; /* 1:Enable RX */
    U1STAbits.UTXEN = 1; /* 1:Enable TX */
    U1STAbits.OERR = 0;  /* Clear overrun error - buffer overflowed */
    
    
    SetBaudrate(115200UL);
    
    
    RemapPinConfiguration();
    
    
    /* Set interrupt */
    InterruptConfiguration();

    
    /* Enable */
    U1MODEbits.ON = 1;
}

static void RemapPinConfiguration(void)
{
    /* Mandatory - set IO to digital */
    ANSELBCLR = 1U<<3;  /* U1TX */
    ANSELBCLR = 1U<<5;  /* U1RX */
    
    
    /* Unlock Peripheral Pin. Writes to PPS registers are allowed */
    //CFGCONbits.IOLOCK = 0U;
    
    /* PPS (Peripheral Pin Select) : pin remap */
    RPB3R = 0b0001; // U1TX RB3 pin.13
    U1RXR = 0b1000; // U1RX RB5 pin.11
    
    /* Lock Peripheral Pin. Writes to PPS registers are not allowed */
    //CFGCONbits.IOLOCK = 1U;
}

static void SetBaudrate(uint32_t baud)
{
    /* F_peripheral = 50 MHz 
     * BRGH = 0
     * val = 50000000UL;
     * val /= (16*baud);
     * val--;
     * U1BRG = val
     */
    
    /* baud 115200*/
    U1MODEbits.BRGH = 1;
    U1BRG = 0x6C;

}

static void InterruptConfiguration(void)
{
/*
 * Priority    [0..7]
 * SubPriority [0..3]
 * 
 * UxRXIE -> UxRXIF -> URXISEL<1:0> & UxSTA<7:6>
 * UxTXIE -> UxTXIF -> UTXISEL<1:0> & UxSTA<15:14>
 * UxEIE  -> UxEIF  -> PERR & UxSTA<3>
 *                  -> FERR & UxSTA<2>
 *                  -> OERR & UxSTA<1>
*/
    
#if __UART1_INT_RX_ENABLE__
    U1STAbits.URXISEL = 0b00; /* Interrupt flag bit is asserted while receive buffer is not empty (default) */
    
    IPC28bits.U1RXIP = 1;           /* Set Rx interrupt priority */
    IPC28bits.U1RXIS = 1;           /* Set Rx interrupt sub-priority */
    IFS3CLR = _IFS3_U1RXIF_MASK;    /* Clear flag */
    IEC3SET = _IEC3_U1RXIE_MASK;    /* Enable interrupt */
#endif
    
#if __UART1_INT_TX_ENABLE__
    U1STAbits.UTXISEL = 0b10;   /* Interrupt is generated and asserted while the transmit buffer is empty */
    //U1STAbits.UTXISEL = 0b01; /* Interrupt is generated and asserted when all characters have been transmitted */
    
    IPC28bits.U1TXIP = 1;           /* Set Tx interrupt priority */
    IPC28bits.U1TXIS = 0;           /* Set Tx interrupt sub-priority */
    IFS3CLR = _IFS3_U1TXIF_MASK;    /* Clear flag */
    //IEC3SET = _IEC3_U1TXIE_MASK;    /* Enable interrupt */
#endif
    
#if __UART1_INT_FAULT_ENABLE__
    IPC28bits.U1EIP = 1;            /* Set Fault interrupt priority */
    IPC28bits.U1EIS = 2;            /* Set Fault interrupt sub-priority */
    IFS3CLR = _IFS3_U1EIF_MASK;     /* Clear flag */
    //IEC3SET = _IEC3_U1EIE_MASK;     /* Enable interrupt */
#endif

}

bool UART1_Write(uint8_t const * const pBuf, size_t length)
{
    /* check paramaters */
    if ( !pBuf || !length)
	{
		return false;
	}
    
    int index = 0;
    while (length != 0)
    {
        /* wait TX FIFO free space */
        while (U1STAbits.UTXBF)
        {
            /* Do nothing */
        }
        
        U1TXREG = pBuf[index++];
        
        length--;
    }
    
    return true;
}

bool UART1_WriteIT(uint8_t const * const pBuf, size_t length)
{
    /* check paramaters */
    if ( !pBuf || !length)
	{
		return false;
	}

	if (IEC3 & _IEC3_U1TXIE_MASK)
    {
        IEC3CLR = _IEC3_U1TXIE_MASK;    /* Disable interrupt */
    }

    /* TXFIFO full ? */
    if (!U1STAbits.UTXBF)
    {
        if (length > 1) 
        {            
            (void) STREAM_Write(&_txStream, &pBuf[1], length - 1);
        }

        U1TXREG = pBuf[0];
    }
    else
    {
        (void) STREAM_Write(&_txStream, pBuf, length);
    }

    IEC3SET = _IEC3_U1TXIE_MASK;    /* Enable interrupt */

    return true;
}

/*** Interrupt ****************************************************************/


__attribute__((weak)) void UART1_RX_Callback( uintptr_t context )
{
    if ((*(uint32_t*)context) == 1)
    {
        U1TXREG = U1RXREG + 1;
    }
}

__attribute__((weak)) void UART1_ERROR_Callback(void)
{
}

void __ISR(_UART1_RX_VECTOR, IPL1AUTO) _InterruptUart1RxHandler(void)
{    
    static volatile uint32_t status = 1;

    UART1_RX_Callback((uintptr_t)&status);
    
    // Clear the interrupt flag
    IFS3CLR = _IFS3_U1RXIF_MASK;
}

void __ISR(_UART1_TX_VECTOR, IPL1AUTO) _InterruptUart1TxHandler(void)
{
    static uint8_t data[UART1_FIFO_SIZE+1] = {0};
    
    size_t numberOfBytesRead = STREAM_Read(&_txStream, data, UART1_FIFO_SIZE);
    if (numberOfBytesRead > 0)
    {
        for(size_t i=0; i<numberOfBytesRead; i++)
        {
            U1TXREG = data[i];
        }
    }
    else
    {
        IEC3CLR = _IEC3_U1TXIE_MASK;    /* Disable interrupt */
    }    
    
    IFS3CLR = _IFS3_U1TXIF_MASK;    /* Clear the interrupt flag */
}

void __ISR(_UART1_FAULT_VECTOR, IPL1AUTO) _InterruptUart1FaultHandler(void)
{    
    UART1_ERROR_Callback();
    
    // Clear the interrupt flag
    IFS3CLR = _IFS3_U1EIF_MASK;
}

/* *****************************************************************************
 End of File
 */
