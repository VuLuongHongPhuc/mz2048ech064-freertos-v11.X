/* CAN1
 * pin.6  C1TX  RG8
 * pin.5  C1RX  RG7
 * Bit rate : 500 Kbps
 * sample at 87.5%
 *
 * FIFO 0 : Transmit
 * FIFO 1 : Receive
 * Interrupt on
 * 
 * NOTE: 
 * 
 */

#include "xc.h"
#include <sys/attribs.h>
#include <sys/kmem.h>  // KVA_TO_PA
//#include <proc/p32mz2048ech064.h>  // IPLxAUTO, IPLxSRS

#include "can1.h"
#include "gpio.h"


#define __EXTENDED_ID    1



#define CAN_MESSAGE_RAM_TX_SIZE        32U   /* FIFO0 Max 32 */
#define CAN_MESSAGE_RAM_RX_SIZE        32U   /* FIFO1 max 32 */
#define CAN_MESSAGE_RAM_CONFIG_SIZE    (64U) /* MAX for 2 channel FIFO */


/* Allocate TX + RX message buffer size. */
static CAN_TX_RX_MSG_BUFFER __attribute__((coherent, aligned(32))) can_message_buffer[CAN_MESSAGE_RAM_CONFIG_SIZE];



static void SetBaudrate(void)
{
#if 0
    C1CFGbits.BRP = 4;   // (BRP + 1)
    C1CFGbits.SJW = 1;   // SJW <= SEG2PH

    C1CFGbits.PRSEG = 0;  // PropSeg = PRSEG + 1 = n TQ
    C1CFGbits.SEG1PH = ; // PhaseSeg1 = SEG1PH + 1 = n TQ
    C1CFGbits.SEG2PH = ; // PhaseSeg2 = SEG2PH + 1 = n TQ
    C1CFGbits.SAM = 0;    // 1 sample per bit
    
    C2CFGbits.SEG2PHTS = 1;
    // WAKFIL = 0
#endif
    
    /* predefine sampling point at 87.5% */
    C1CFG = 0x00008604;  // 500 kbit/s
    //C1CFG = 0x00008609;  // 250 kbit/s
}

/**
 * @brief Configure CAN FIFOs
 */
static void SetFIFO(void)
{    
    /* Set Start address of MB0 in FIFO0 */
    C1FIFOBA = (uint32_t)KVA_TO_PA(can_message_buffer);
    
    
    /* Set FIFO0 -> Transmit message */
    C1FIFOCON0bits.TXPRI = 0;
    C1FIFOCON0bits.TXEN = 1;
    C1FIFOCON0bits.FSIZE = CAN_MESSAGE_RAM_TX_SIZE - 1U;
        
    /* Set FIFO1 -> Receive Message */
    C1FIFOCON1bits.TXPRI = 0;
    C1FIFOCON1bits.TXEN = 0;
    C1FIFOCON1bits.FSIZE = CAN_MESSAGE_RAM_RX_SIZE - 1U;
}

static void SetAcceptanceFilter(void)
{
    /*
     * FLTEN0: Filter 0 Enable
     * MSEL0<1:0>: 00 = Acceptance Mask 0 selected
     * FSEL0<4:0>: 00001 = Message matching filter is stored in FIFO buffer 1 
     */
    
    /* Filter/mask acceptance - accept ANY */
    C1RXF0 = 0;
    C1FLTCON0 = 0x81; 
    C1RXM0 = 0;
}

static void RemapPPS(void)
{    
    /* Mandatory - set IO to digital */
    ANSELGCLR = 1U<<7;  /* C1RX */
    ANSELGCLR = 1U<<8;  /* C1TX */
    
    /* Unlock Peripheral Pin. Writes to PPS registers are allowed */
    CFGCONbits.IOLOCK = 0U;

    /* PPS Remapping */
    C1RXR = 0b0001;   /* pin.5  input  RPG7  RG7 */
    RPG8R = 0b1111;   /* pin.6  output C1TX  RG8 */

    /* Lock Peripheral Pin. Writes to PPS registers are not allowed */
    //CFGCONbits.IOLOCK = 1U;
}


static void SetInterrupt(void)
{
    /*
     * CiVEC  : CAN INTERRUPT CODE REGISTER
     * CiINT  : CAN INTERRUPT REGISTER
     * CiTREC : CAN TRANSMIT/RECEIVE ERROR COUNT REGISTER
     * CiFSTAT: CAN FIFO STATUS REGISTER
     * CiFIFOINTn : CAN FIFO INTERRUPT REGISTER (n = 0 THROUGH 31)
     * 
     * NOTE : CiINT bind with CiFIFOINTn 
     */
    
    //C1INTbits.IVRIE = 1;  // Invalid Message Received Interrupt Enable bit
    //C1INTbits.CERRIE = 1; // CAN Bus Error Interrupt Enable bit
    //C1INTbits.SERRIE = 1; // System Error Interrupt Enable bit
    //C1INTSET = _C1INT_TBIE_MASK; /* Enable Transmit Buffer Interrupt */
    C1INTSET = _C1INT_RBIE_MASK;    /* Enable Receive Buffer Interrupt */
    //C1INTSET = _C1INT_RBOVIE_MASK;  /* Enable Receive Buffer Overflow Interrupt */
    
    C1FIFOINT1bits.RXNEMPTYIE = 1;      /* Interrupt enabled for FIFO not empty */
    //C1FIFOINT1bits.RXHALFIE = 1;        /* Enable FIFO Half Full Interrupt */
    //C1FIFOINT1bits.RXOVFLIE = 1;
    
    IPC37bits.CAN1IP = 2;  /* Interrupt priority */
    IPC37bits.CAN1IS = 0;  /* Interrupt sub-priority */
    
    IEC4SET = _IEC4_CAN1IE_MASK; /* Enable CAN interrupt vector */
}


void CAN1_Initialize(void)
{
    /* !! The module must be in configuration mode C2CON<23:21> = 100 to configure
     * !! Configuration order is mandatory
     * CiCFG: CAN BAUD RATE CONFIGURATION REGISTER
     * CiCON: CAN MODULE CONTROL REGISTER 
     * 
     * CiRXMN: CAN ACCEPTANCE FILTER MASK N REGISTER (N = 0, 1, 2 OR 3)
     * CiFLTCON0: CAN FILTER CONTROL REGISTER 0
     * CiFLTCON1: CAN FILTER CONTROL REGISTER 1
     * CiRXFn: CAN ACCEPTANCE FILTER N REGISTER 7 (n = 0 THROUGH 31)
     * CiFIFOCONn: CAN FIFO CONTROL REGISTER (n = 0 THROUGH 31)
     * CiFIFOINTn: CAN FIFO INTERRUPT REGISTER (n = 0 THROUGH 31)
     * 
     * CiFIFOBA: CAN MESSAGE BUFFER BASE ADDRESS REGISTER
     * CiFIFOUAn: CAN FIFO USER ADDRESS REGISTER (n = 0 THROUGH 31)
     * CiFIFOCIn: CAN MODULE MESSAGE INDEX REGISTER (n = 0 THROUGH 31)
     */

#if __IN_SYSTEM_INIT__    
    volatile uint32_t int_status;

    // Disable global interrupt
    int_status = __builtin_get_isr_state();
    __builtin_disable_interrupts();
    
    volatile uint32_t dma_suspend;
    // Suspend DMA
    dma_suspend = DMACONbits.SUSPEND;
    if (dma_suspend == 0)
    {
        DMACONSET = _DMACON_SUSPEND_MASK;
        while (DMACONbits.DMABUSY == 1);
    }
#endif
    
    volatile uint32_t status;
    status = __builtin_disable_interrupts();
    

    /* Switch the CAN module ON */
    C1CONSET = _C1CON_ON_MASK;
    
    
    /* At reset, normally on configuration mode */
    /* Switch the CAN module to Configuration mode. Wait until the switch is complete */
    C1CONbits.REQOP = CAN_MODE_CONFIGURATION;
    while (C1CONbits.OPMOD != CAN_MODE_CONFIGURATION)
    {        
    }
    
    
    SetBaudrate();
    
    
    SetFIFO();
    
    
    SetAcceptanceFilter();
    
    
    SetInterrupt();

    
    /* The CAN module can now be placed into normal mode if no further */
    C1CONbits.REQOP = CAN_MODE_OPERATION;
    while(C1CONbits.OPMOD != CAN_MODE_OPERATION)
    {        
    }
    
    RemapPPS();
    
    
    if (status)
    {
        __builtin_enable_interrupts();        
    }
    

#if __IN_SYSTEM_INIT__
    if(dma_suspend == 0)
    {
        DMACONCLR = _DMACON_SUSPEND_MASK;
    }
    __builtin_set_isr_state(int_status);
#endif
    
}

void CAN1_Enable(void)
{
    /* Switch the CAN module ON */
    C1CONSET = _C1CON_ON_MASK;
    /* Auto request priority on C2TX/C2RX pins */
}

void CAN1_Disable(void)
{
    /* Place the CAN module in Configuration mode. */
    C1CONbits.REQOP = CAN_MODE_CONFIGURATION;         /* Request enter configuration mode */
    while(C1CONbits.OPMOD != CAN_MODE_CONFIGURATION); /* Wait mode change */
    
    /* Switch the CAN module off. */
    C1CONCLR = _C1CON_ON_MASK;          /* Clear the ON bit */
    while(C1CONbits.CANBUSY == 1);  /* Wait for CAN off - advisor */
    
    /* - Auto release device control on C1TX/C1RX pins
     * - Place CAN module into reset
     * - All FIFO message is reset
     */
}

/* @brief Reset Tx FIFO - Can also be done enter config mode or put module to off
 */
void CAN1_ResetTxFIFO(void)
{
    /* Reset CAN1 FIFO0 */
    C1FIFOCON0SET = 0x00004000; /* Set the FRESET bit */
    while(C1FIFOCON0bits.FRESET == 1);
}

/* @brief Reset Rx FIFO - Can also be done enter config mode or put module to off
 */
void CAN1_ResetRxFIFO(void)
{
    /* Reset CAN2 FIFO1 */
    C1FIFOCON1SET = 0x00004000; /* Set the FRESET bit */
    while(C1FIFOCON1bits.FRESET == 1);
}

uint8_t CAN1_Read(uint32_t *id, uint8_t *length, uint8_t *data, uint16_t *timestamp, CAN_MSG_RX_ATTRIBUTE *msgAttr)
{
    uint8_t  count = 0;
    CAN_TX_RX_MSG_BUFFER *rxMessage = NULL; /* Points to message buffer to be written */
    
    /* if not empty */
    if (C1FIFOINT1bits.RXNEMPTYIF)
    {
        rxMessage = (CAN_TX_RX_MSG_BUFFER *)PA_TO_KVA1(C1FIFOUA1);
        
        /* Check if it's a extended message type */
        if ((rxMessage->msgEID & CAN_MSG_IDE_MASK) != 0U)
        {
            *id = ((rxMessage->msgSID & CAN_MSG_SID_MASK) << 18) | ((rxMessage->msgEID >> 10) & _C2RXM0_EID_MASK);
            
            /* Check if remote frame */
            if ((rxMessage->msgEID & CAN_MSG_RTR_MASK) != 0U)
            {
                *msgAttr = CAN_MSG_RX_REMOTE_FRAME;
            }
            else
            {
                *msgAttr = CAN_MSG_RX_DATA_FRAME;
            }
        }
        else
        {
            *id = rxMessage->msgSID & CAN_MSG_SID_MASK;
            
            /* Check if remote frame */
            if ((rxMessage->msgEID & CAN_MSG_SRR_MASK) != 0U)
            {
                *msgAttr = CAN_MSG_RX_REMOTE_FRAME;
            }
            else
            {
                *msgAttr = CAN_MSG_RX_DATA_FRAME;
            }
        }

        *length = (uint8_t)(rxMessage->msgEID & CAN_MSG_DLC_MASK);

        /* Copy the data into the payload */
        while (count < *length)
        {
            data[count] = rxMessage->msgData[count];
            count++;
        }

        if (timestamp != NULL)
        {
            *timestamp = (uint16_t)((rxMessage->msgSID & CAN_MSG_TIMESTAMP_MASK) >> 16);
        }
        
        /* Set the UINC bit to tell the CAN module that a message has been read. */        
        C1FIFOCON1SET = _C1FIFOCON1_UINC_MASK;
        
        return 1;
    }
    
    // CiFIFOUAn address register
    // CiFIFOCIn index register
    
    return 0;
}

uint8_t CAN1_Write(uint32_t id, uint8_t length, uint8_t* data, CAN_MSG_TX_ATTRIBUTE msgAttr)
{
    uint8_t i;
    CAN_TX_RX_MSG_BUFFER *txMessage = NULL; /* Points to message buffer to be written */
    
    /* Get the address of the message buffer to write to from the C1FIFOUA0 */
    /* register. Convert this physical address to virtual address. */
    txMessage = (CAN_TX_RX_MSG_BUFFER *)PA_TO_KVA1(C1FIFOUA0);

    if (C1FIFOINT0bits.TXNFULLIF)
    {
#if (__EXTENDED_ID == 1)
        txMessage->msgSID = (id & CAN_MSG_EID_MASK) >> 18;
        txMessage->msgEID = ((id & 0x3FFFFUL) << 10) | CAN_MSG_IDE_MASK | CAN_MSG_SRR_MASK;
#else
        txMessage->msgSID = id;
        txMessage->msgEID = 0U;
#endif
        
        if (CAN_MSG_TX_REMOTE_FRAME == msgAttr)
        {
            txMessage->msgEID |= CAN_MSG_RTR_MASK;
        }
        else
        {
            txMessage->msgEID |= (length & CAN_MSG_DLC_MASK);

            /* Fixe n copy */
            for (i=0; i<8; i++)
            {
                txMessage->msgData[i] = data[i];
            }
        }

        /* Set the UINC and TXREQ bit */
        C1FIFOCON0SET = _C1FIFOCON0_UINC_MASK;
        C1FIFOCON0SET = _C1FIFOCON0_TXREQ_MASK;
        
        return 1;
    }
    
    return 0;
}



/*******************************************************************************
* Section: System Interrupt Vector definitions
*******************************************************************************/

__attribute__((weak)) void CAN1_ReceiveCallback(void)
{
    uint32_t id = 0;
    uint8_t length = 0;
    uint8_t data[8] = {0};
    CAN_MSG_RX_ATTRIBUTE msgAttr;
    
    if (CAN1_Read(&id, &length, data, NULL, &msgAttr))
    {
        
    }
}

void __ISR(_CAN1_VECTOR, IPL2AUTO) _InterruptCan1Handler (void)
{
    /*
     * CiVEC : CAN INTERRUPT CODE REGISTER
     * CiINT: CAN INTERRUPT REGISTER
     * CiTREC: CAN TRANSMIT/RECEIVE ERROR COUNT REGISTER
     * CiFSTAT: CAN FIFO STATUS REGISTER
     * CiFIFOINTn : CAN FIFO INTERRUPT REGISTER (n = 0 THROUGH 31) 
     */
    
    
    /* Receive buffer interrupt */
    if (C1INTbits.RBIF)
    {
        /* FIFO1 interrupt */
        if (C1VEC & 0b0000001)
        {
            if (C1FSTAT & 0x0002)
            {
                // callback event function
                CAN1_ReceiveCallback();
            }
        }
    }
    
  
    /* Transmit Buffer Interrupt */
    if (C1INTbits.TBIF)
    {
    }

    
    IFS4CLR = _IFS4_CAN1IF_MASK;
}


/* *****************************************************************************
 End of File
 */
