/* HARDWARE description
 * Transfer in Polling
 * 
 * Hardware spec.:
 * Separate SPI FIFO buffers for receive and transmit
 *  - FIFO buffers act as 4/8/16-level deep FIFOs based on 32/16/8-bit data width
 * 
 * 
 * 
 * SPI software configuration for TFT 2.2" ILI9341:
 * 3.3
 * GND
 * RD9----CS
 * RD10---RESET
 * RD11---DC
 * RD0----SDI/MOSI
 * RD1----SCK
 * RD2----LED
 * RD3----SDO/MISO
 *   
 * SPI hardware configuration for TFT 2.2" ILI9341:
 * RD9 --- CS
 * RD10 -- RESET
 * RD11 -- DC
 * RD0 --- LED
 * RD1 --- SCK1      pin.49
 * RD2 ---           MISO/SDI1
 * RD3 ---           MOSI/SDO1
*/

#include "xc.h"
#include <sys/attribs.h>  // IPLxAUTO, IPLxSRS


#include "spi.h"



/*** Define *******************************************************************/
#define DEF_DUMMY_DATA  0xffffffff


/*** Variables ****************************************************************/



/*** Private Prototypes *******************************************************/




/*** Functions ****************************************************************/

static void Initialize_GPIO()
{
    /* Unlock system for PPS configuration */
    SYSKEY = 0x00000000U;
    SYSKEY = 0xAA996655U;
    SYSKEY = 0x556699AAU;

    CFGCONbits.IOLOCK = 0U;

    /* PPS Input Remapping */
    //SDI1R = 0;  /*!< RD2 SPI Data In MISO */

    /* PPS Output Remapping */
    RPD3R = 5;   /*!< RD3 SPI Data Out MOSI*/

    /* Lock back the system after PPS configuration */
    CFGCONbits.IOLOCK = 1U;

    SYSKEY = 0x00000000U;
}

void SPI1_Initialize()
{
    Initialize_GPIO();
    
   
    /*
     * SPI1CON
     * SPI1STAT
     * SPI1BUF
     * SPI1BRG
     * SPI1CON2     
     */
    
    uint32_t dummyData = 0U;

    /* Disable SPI1 Interrupts */
    IEC3CLR = 0x2000;
    IEC3CLR = 0x4000;
    IEC3CLR = 0x8000;

    /* STOP and Reset the SPI */
    SPI1CON = 0;

    /* Clear the Receiver buffer */
    dummyData = SPI1BUF;
    (void)dummyData;

    /* Clear SPI1 Interrupt flags */
    IFS3CLR = 0x2000;
    IFS3CLR = 0x4000;
    IFS3CLR = 0x8000;

    /* BAUD Rate register Setup 
     * REFCLK = SYSCLK/2 = 50MHz
     * F_SCK = REFCLK/(2*(+1)) */
    SPI1BRG = 12;

    /* CLear RX flag Overflow */
    SPI1STATCLR = _SPI1STAT_SPIROV_MASK;

    /*
    MSTEN = 1
    CKP = 0
    CKE = 1
    MODE<32,16> = 0
    ENHBUF = 1
    MSSEN = 0
    MCLKSEL = 0
    */
    /* SPI CONTROL REGISTER p.308*/
    SPI1CONbits.MSTEN   = 1;  /*!< Master Mode Enable bit */
    SPI1CONbits.CKP     = 0;  /*!< Clock Polarity Select bit. 0 = Idle state for clock is a low level; active state is a high level */
    SPI1CONbits.CKE     = 1;  /*!< SPI Clock Edge Select bit. 1 = Serial output data changes on transition from active clock state to Idle clock state (see CKP bit) */
    SPI1CONbits.ENHBUF  = 1;  /*!< Enhanced Buffer Enable bit */
    SPI1CONbits.MODE16  = 0;  /*!< 32/16-Bit Communication Select bits. 00 = 8-bit communication */
    SPI1CONbits.MODE32  = 0;
    SPI1CONbits.MSSEN   = 0;  /*!< Slave Select Enable (CS). 0 = SSx pin not used for Slave mode, pin controlled by port function. */
    SPI1CONbits.MCLKSEL = 0;  /*!< Master Clock Enable bit. 0 = PBCLK2 is used by the Baud Rate Generator */
    SPI1CONbits.STXISEL = 1;  /*!< SPI Transmit Buffer Empty Interrupt Mode bits. 01 = Interrupt is generated when the buffer is completely empty */
    SPI1CONbits.SRXISEL = 1;  /*!< SPI Receive Buffer Full Interrupt Mode bits. 01 = Interrupt is generated when the buffer is not empty */

    
    /* Initialize Transfer Done interrupt p.120 p.146 */
    //IPC27bits.SPI1TXIP = 0;      /*!< TX priority 0-7 */
    //IPC27bits.SPI1TXIS = 3;      /*!< TX sub priority 0-3 */
    //IPC27bits.SPI1RXIP = 0;      /*!< RX priority 0-7 */
    //IPC27bits.SPI1RXIS = 2;      /*!< RX sub priority 0-3 */
    //IPC27bits.SPI1EIP  = 0;      /*!< Fault priority 0-7 */
    //IPC27bits.SPI1EIS  = 1;      /*!< Fault sub priority 0-3 */
    
    
    /* Enable Transfer Done Interrupt */
    //IEC3SET |= _IEC3_SPI1TXIE_MASK;   /*!< Enable TX interrupt */
    //IEC3SET |= _IEC3_SPI1RXIE_MASK;   /*!< Enable RX interrupt */
    //IEC3SET |= _IEC3_SPI1EIE_MASK;    /*!< Enable Error interrupt */

    SPI1CON2 = 0;
    SPI1CON2bits.IGNROV = 1;// ignore overflow RX
    SPI1CON2bits.IGNTUR = 1;// ignore overflow TX
    
    dummyData = SPI1BUF;          /*!< Read rx buffer to reset flag FIFO */
    (void)dummyData;              /*!< dummy -> prevent warning at build */
    
    /* Enable SPI1 */
    SPI1CONbits.ON = 1;    
}

/*
bool SPI1_TransferSetup (SPI_TRANSFER_SETUP* setup, uint32_t spiSourceClock )
{
    uint32_t t_brg;
    uint32_t baudHigh;
    uint32_t baudLow;
    uint32_t errorHigh;
    uint32_t errorLow;

    if ((setup == NULL) || (setup->clockFrequency == 0U))
    {
        return FALSE;
    }

    if(spiSourceClock == 0U)
    {
        // Use Master Clock Frequency set in GUI
        spiSourceClock = 50000000;
    }

    t_brg = (((spiSourceClock / (setup->clockFrequency)) / 2u) - 1u);
    baudHigh = spiSourceClock / (2u * (t_brg + 1u));
    baudLow = spiSourceClock / (2u * (t_brg + 2u));
    errorHigh = baudHigh - setup->clockFrequency;
    errorLow = setup->clockFrequency - baudLow;

    if (errorHigh > errorLow)
    {
        t_brg++;
    }

    if(t_brg > 8191U)
    {
        return FALSE;
    }

    SPI1BRG = t_brg;
    SPI1CON = (SPI1CON & (~(_SPI1CON_MODE16_MASK | _SPI1CON_MODE32_MASK | _SPI1CON_CKP_MASK | _SPI1CON_CKE_MASK))) |
                            ((uint32_t)setup->clockPolarity | (uint32_t)setup->clockPhase | (uint32_t)setup->dataBits);

    return TRUE;
}*/


/**
 * @brief Write buffer
 * @param pBuffer - data to transmit
 * @param size - number of byte in buffer
 * @return TRUE/FALSE
 */
BOOL SPI1_Write(const void* const pBuffer, size_t size)
{
    size_t count = 0;
    
    if (pBuffer == NULL) { return FALSE; }
    if (size == 0) { return FALSE; }
    
    /* Clear the receive overflow error if any */
    SPI1STATCLR = _SPI1STAT_SPIROV_MASK;
    
    /* Flush out any unread data in SPI read buffer from the previous transfer */
    while ((SPI1STAT & _SPI1STAT_SPIRBE_MASK) == 0U)
    {
        (void)SPI1BUF;
    }
    
    /* If dataBit size is 32 bits */
    if (_SPI1CON_MODE32_MASK == (SPI1CON & _SPI1CON_MODE32_MASK))
    {
        size >>= 2;
    }
    /* If dataBit size is 16 bits */
    else if (_SPI1CON_MODE16_MASK == (SPI1CON & _SPI1CON_MODE16_MASK))
    {
        size >>= 1;
    }
    else
    {
         /* Nothing to process */
    }
    
    while((SPI1STAT & _SPI1STAT_SPITBE_MASK) == 0U)
    {
        /* Wait for transmit buffer to be empty */
    }
    
    while (count != size)
    {
        if((_SPI1CON_MODE32_MASK) == (SPI1CON & (_SPI1CON_MODE32_MASK)))
        {
            SPI1BUF = ((uint32_t*)pBuffer)[count];
        }
        else if((_SPI1CON_MODE16_MASK) == (SPI1CON & (_SPI1CON_MODE16_MASK)))
        {
            SPI1BUF = ((uint16_t*)pBuffer)[count];
        }
        else
        {
            SPI1BUF = ((uint8_t*)pBuffer)[count];
        }
        count++;

#define __READ_SO 0
#if (__READ_SO == 1)
        /* If data is read, wait for the Receiver Data to become available */
        while((SPI1STAT & _SPI1STAT_SPIRBE_MASK) == _SPI1STAT_SPIRBE_MASK);

        /* We have data waiting in the SPI buffer */
        dummyData = SPI1BUF;
#endif
    }
    
    /* Make sure no data is pending in the shift register */
    while((SPI1STAT & _SPI1STAT_SRMT_MASK) == 0U)
    {
        /* Data pending in shift register */
    }
    
    return TRUE;
}


BOOL SPI1_Read(void* const pBuffer, size_t size)
{
    size_t count = 0;
    
    if (pBuffer == NULL) { return FALSE; }
    if (size == 0) { return FALSE; }
    
    /* Clear the receive overflow error if any */
    SPI1STATCLR = _SPI1STAT_SPIROV_MASK;
    
    /* Flush out any unread data in SPI read buffer from the previous transfer */
    while ((SPI1STAT & _SPI1STAT_SPIRBE_MASK) == 0U)
    {
        (void)SPI1BUF;
    }
    
    /* If dataBit size is 32 bits */
    if (_SPI1CON_MODE32_MASK == (SPI1CON & _SPI1CON_MODE32_MASK))
    {
        size >>= 2;
    }
    /* If dataBit size is 16 bits */
    else if (_SPI1CON_MODE16_MASK == (SPI1CON & _SPI1CON_MODE16_MASK))
    {
        size >>= 1;
    }
    else
    {
         /* Nothing to process */
    }
    
    while((SPI1STAT & _SPI1STAT_SPITBE_MASK) == 0U)
    {
        /* Wait for transmit buffer to be empty */
    }
    
    while (count != size)
    {
        if((_SPI1CON_MODE32_MASK) == (SPI1CON & (_SPI1CON_MODE32_MASK)))
        {
            SPI1BUF = (uint32_t)DEF_DUMMY_DATA;
        }
        else if((_SPI1CON_MODE16_MASK) == (SPI1CON & (_SPI1CON_MODE16_MASK)))
        {
            SPI1BUF = (uint16_t)DEF_DUMMY_DATA;
        }
        else
        {
            SPI1BUF = (uint8_t)DEF_DUMMY_DATA;
        }
        
        
        /* If data is read, wait for the Receiver Data to become available */
        while((SPI1STAT & _SPI1STAT_SPIRBE_MASK) == _SPI1STAT_SPIRBE_MASK);

        /* We have data waiting in the SPI buffer */        
        if((_SPI1CON_MODE32_MASK) == (SPI1CON & (_SPI1CON_MODE32_MASK)))
        {
            ((uint32_t*)pBuffer)[count] = (uint32_t)SPI1BUF;
        }
        else if((_SPI1CON_MODE16_MASK) == (SPI1CON & (_SPI1CON_MODE16_MASK)))
        {
            ((uint16_t*)pBuffer)[count] = (uint16_t)SPI1BUF;
        }
        else
        {
            ((uint8_t*)pBuffer)[count] = (uint8_t)SPI1BUF;
        }

        count++;
    }
    
    /* Make sure no data is pending in the shift register */
    while((SPI1STAT & _SPI1STAT_SRMT_MASK) == 0U)
    {
        /* Data pending in shift register */
    }
    
    return TRUE;
}

/*EOF*/
