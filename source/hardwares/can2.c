/* CAN2
 * pin.14  C2TX  RB2
 * pin.16  C2RX  RB0
 * Bit rate : 500 Kbps
 * sample at 87.5%
 * Baudrate prescaler : 4
 * propagation segment time (ns) : 800
 * FIFO 0 : Transmit 8 deep level -> 8x 4 words = 32 bytes
 * FIFO 1 : Receive  8 deep level -> 8x 4 words = 32 bytes
 * Interrupt mode
 * 
 * NOTE: In conflict with CORETIMER - CoreTimer don't trigger at time
 */

#include "xc.h"
#include <sys/attribs.h>
#include <sys/kmem.h>  // KVA_TO_PA
//#include <proc/p32mz2048ech064.h>  // IPLxAUTO, IPLxSRS


#include "can2.h"


#define __EXTENDED_ID    1


#define CAN_MESSAGE_RAM_TX_SIZE        8U       /* FIFO0 Max 32 */
#define CAN_MESSAGE_RAM_RX_SIZE        8U       /* FIFO1 max 32 */
#define CAN_MESSAGE_RAM_CONFIG_SIZE    (64U)    /* MAX for 2 channel FIFO */


/* Allocate TX + RX message buffer size. */
static CAN_TX_RX_MSG_BUFFER __attribute__((coherent, aligned(32))) can2_message_buffer[CAN_MESSAGE_RAM_CONFIG_SIZE];



static void SetBaudrate(void)
{
    /* predefine sampling point at 87.5% */
    C2CFG = 0x00008604;  // 500 kbit/s
    //C2CFG = 0x00008609;  // 250 kbit/s
}


static void CAN2_ZeroInitialize(volatile void* pData, size_t dataSize)
{
    uint32_t index;
    volatile uint8_t* data = (volatile uint8_t*)pData;
    for (index = 0; index < dataSize; index++)
    {
        data[index] = 0U;
    }
}

/**
 * @brief Configure CAN FIFOs
 */
static void SetFIFO(void)
{    
    /* Set Start address of MB0 in FIFO0 */
    C2FIFOBA = (uint32_t)KVA_TO_PA(can2_message_buffer);
            
    /* Set Transmit FIFO */
    C2FIFOCON0bits.TXEN = 1;
    C2FIFOCON0bits.FSIZE = CAN_MESSAGE_RAM_TX_SIZE - 1U;
        
    /* Set FIFO1 Full Receive Message */
    C2FIFOCON1bits.TXEN = 0;
    C2FIFOCON1bits.FSIZE = CAN_MESSAGE_RAM_RX_SIZE - 1U;
}

static void SetAcceptanceFilter(void)
{
    /*
     * FLTEN0: Filter 0 Enable
     * MSEL0<1:0>: 00 = Acceptance Mask 0 selected
     * FSEL0<4:0>: 00001 = Message matching filter is stored in FIFO buffer 1 
     */
    
     /* Filter/mask acceptance - accept ANY */
    C2RXF0 = 0;
    C2FLTCON0 = 0x81;
    C2RXM0 = 0;
}

static void RemapPPS(void)
{    
    /* Mandatory - Set IO to digital */
    ANSELBCLR = 1U<<0;  /* RB0 C2RXR pin.16 */
    ANSELBCLR = 1U<<2;  /* RB2 RPB2R pin.14 */
    
    
    /* Unlock Peripheral Pin. Writes to PPS registers are allowed */
    CFGCONbits.IOLOCK = 0U;

    C2RXR = 0b0101;      /* PPS Input Remapping C2RX */    
    RPB2R = 0b1111;     /* PPS Output Remapping C2TX */

    /* Lock back the system after PPS configuration */
    //CFGCONbits.IOLOCK = 1U;
}

static void SetInterrupt(void)
{
    C2INTbits.IVRIE = 1;  // Invalid Message Received Interrupt Enable bit
    //C2INTbits.CERRIE = 1; // CAN Bus Error Interrupt Enable bit
    //C2INTbits.SERRIE = 1; // System Error Interrupt Enable bit
    //C2INTSET = _C2INT_TBIE_MASK; /* Enable Transmit Buffer Interrupt */
    C2INTSET = _C2INT_RBIE_MASK; /* Enable Receive Buffer Interrupt */
    
    
    IPC38bits.CAN2IP = 2;  /* Interrupt priority */
    IPC38bits.CAN2IS = 0;  /* Interrupt sub-priority */
    
    IEC4SET = _IEC4_CAN2IE_MASK; /* Enable CAN2 interrupt vector */
}

void CAN2_Initialize(void)
{
    /* !! The module must be in configuration mode C2CON<23:21> = 100 to configure
     * C2CFG
     * C2FIFOBA
     * C2RXMn
     * C2FIFOCONn<20:16> - FSIZE<4:0>
     * C2FIFOCONn<12> - DONLY
     */
    
    (void)__builtin_disable_interrupts();
    
    RemapPPS();

    /* Switch the CAN module ON */
    C2CONSET = _C2CON_ON_MASK;
    
    
    /* At reset, normally on configuration mode */
    /* Switch the CAN module to Configuration mode. Wait until the switch is complete */
    C2CONbits.REQOP = CAN_MODE_CONFIGURATION;
    while (C2CONbits.OPMOD != CAN_MODE_CONFIGURATION)
    {
    }
    
    
    SetBaudrate();
    
    
    SetFIFO();
    
    
    SetAcceptanceFilter();
    
    
    //SetInterrupt();   


    /* The CAN module can now be placed into normal mode if no further */
    C2CONbits.REQOP = CAN_MODE_OPERATION;
    while(C2CONbits.OPMOD != CAN_MODE_OPERATION)
    {
    }
    
        
           
    

    
    (void)__builtin_enable_interrupts();        
    
}

void CAN2_Enable(void)
{
    C2CONbits.ON = 1;
    /* Auto request priority on C2TX/C2RX pins */
}

void CAN2_Disable(void)
{
    /* Place the CAN module in Configuration mode. */
    C2CONbits.REQOP = CAN_MODE_CONFIGURATION;         /* Request enter configuration mode */
    while(C2CONbits.OPMOD != CAN_MODE_CONFIGURATION); /* Wait mode change */
    
    /* Switch the CAN module off. */
    C2CONCLR = 0x00008000;          /* Clear the ON bit */
    while(C2CONbits.CANBUSY == 1);  /* Wait for CAN off - advisor */
    
    /* - Auto release device control on C2TX/C2RX pins
     * - Place CAN module into reset
     * - All FIFO message is reset
     */
}

/* @brief Reset Tx FIFO - Can also be done enter config mode or put module to off
 */
void CAN2_ResetTxFIFO(void)
{
    /* Reset CAN2 FIFO0 */
    C2FIFOCON0SET = 0x00004000; /* Set the FRESET bit */
    while(C2FIFOCON0bits.FRESET == 1);
}

/* @brief Reset Rx FIFO - Can also be done enter config mode or put module to off
 */
void CAN2_ResetRxFIFO(void)
{
    /* Reset CAN2 FIFO1 */
    C2FIFOCON1SET = 0x00004000; /* Set the FRESET bit */
    while(C2FIFOCON1bits.FRESET == 1);
}


uint8_t CAN2_Read(uint32_t *id, uint8_t *length, uint8_t *data, uint16_t *timestamp, CAN_MSG_RX_ATTRIBUTE *msgAttr)
{
    uint8_t  count = 0;
    CAN_TX_RX_MSG_BUFFER *rxMessage = NULL; /* Points to message buffer to be written */
    
    /* if not empty */
    if (C2FIFOINT1bits.RXNEMPTYIF)
    {
        rxMessage = (CAN_TX_RX_MSG_BUFFER *)PA_TO_KVA1(C2FIFOUA1);
        
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
        
        /* Set the UINC bit to tell the CAN module that
        * a message has been read. */
        //C2FIFOCON1SET = 0x2000;
        C2FIFOCON1SET = _C2FIFOCON1_UINC_MASK;
        
        return 1;
    }
    
    // CiFIFOUAn address register
    // CiFIFOCIn index register
    
    return 0;
}

uint8_t CAN2_Write(uint32_t id, uint8_t length, uint8_t* data, CAN_MSG_TX_ATTRIBUTE msgAttr)
{
    uint8_t i = 0;
    CAN_TX_RX_MSG_BUFFER *txMessage = NULL; /* Points to message buffer to be written */
    
    /* Get the address of the message buffer to write to from the C1FIFOUA0 */
    /* register. Convert this physical address to virtual address. */
    txMessage = (CAN_TX_RX_MSG_BUFFER *)PA_TO_KVA1(C2FIFOUA0);

    if (C2FIFOINT0bits.TXNFULLIF)
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
        //C2FIFOCON0SET = _C2FIFOCON0_UINC_MASK | _C2FIFOCON0_TXREQ_MASK;        
        C2FIFOCON0SET = _C2FIFOCON0_UINC_MASK;
        C2FIFOCON0SET = _C2FIFOCON0_TXREQ_MASK;
        
        return 1;
    }
    
    return 0;
}





// *****************************************************************************
// *****************************************************************************
// Section: System Interrupt Vector definitions
// *****************************************************************************
// *****************************************************************************

void __ISR(_CAN2_VECTOR, IPL2AUTO) CAN2_Handler (void)
{
    
    /* Receive buffer interrupt */
    if (C2INTbits.RBIF)
    {
        // callback event function        
    }
    
    /* Transmit Buffer Interrupt */
    if (C2INTbits.TBIF)
    {
    }
    
    //C2INTCLR = _C2INT_TBIE_MASK;
    IFS4CLR = _IFS4_CAN2IF_MASK;
}

/* *****************************************************************************
 End of File
 */
