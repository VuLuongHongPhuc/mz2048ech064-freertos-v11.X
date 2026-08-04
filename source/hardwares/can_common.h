/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _M_CAN_COMMON_H    /* Guard against multiple inclusion */
#define _M_CAN_COMMON_H


/*** Includes *****************************************************************/


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

#define CAN_MODE_CONFIGURATION       (0x4U)
#define CAN_MODE_LOOPBACK            (0x2U)
#define CAN_MODE_OPERATION           (0x0U)
    
#define CAN_MSG_IDE_MASK            (0x10000000U)
#define CAN_MSG_SID_MASK            (0x7FFU)
#define CAN_MSG_TIMESTAMP_MASK      (0xFFFF0000U)
#define CAN_MSG_EID_MASK            (0x1FFFFFFFU)
#define CAN_MSG_DLC_MASK            (0xFU)
#define CAN_MSG_RTR_MASK            (0x200U)
#define CAN_MSG_SRR_MASK            (0x20000000U)
    
    
#define CAN_CiFLTCONx_FLTEN0_pos              7U
#define CAN_CiFLTCONx_FLTEN0_mask             (1U<<CAN_FLTEN0_pos)
#define CAN_CiFLTCONx_FSEL0_pos               0
#define CAN_CiFLTCONx_FSEL0_mask             (0x1Fu)

    
    /* @brief CAN Message Object Type RX Attribute for Data Frame and Remote Frame.
     */
    typedef enum
    {
        CAN_MSG_RX_DATA_FRAME = 0,
        CAN_MSG_RX_REMOTE_FRAME
    } CAN_MSG_RX_ATTRIBUTE;

    /* @brief CAN Message Object Type TX Attribute for Data Frame and Remote Frame.
     */
    typedef enum
    {
        CAN_MSG_TX_DATA_FRAME = 0,
        CAN_MSG_TX_REMOTE_FRAME
    } CAN_MSG_TX_ATTRIBUTE;




    /* @brief CAN Message Buffer structure - defines the CAN TX and RX Message Buffer format.
     */
    typedef struct
    {
        /* This is SID portion of the CAN message */
        uint32_t msgSID;

        /* This is EID portion of the CAN message */
        uint32_t msgEID;

        /* This is the data portion of the CAN message */
        uint8_t msgData[8];
    } CAN_TX_RX_MSG_BUFFER;




    /* Create a CMSGSID data type. */
    typedef struct
    {
        unsigned SID:11;
        unsigned :21;
    }txcmsgsid;
    /* Create a CMSGEID data type. */
    typedef struct
    {
        unsigned DLC:4;
        unsigned RB0:1;
        unsigned :3;
        unsigned RB1:1;
        unsigned RTR:1;
        unsigned EID:18;
        unsigned IDE:1;
        unsigned SRR:1;
        unsigned :2;
    }txcmsgeid;
    /* Create a CMSGDATA0 data type. */
    typedef struct
    {
        unsigned Byte0:8;
        unsigned Byte1:8;
        unsigned Byte2:8;
        unsigned Byte3:8;
    }txcmsgdata0;
    /* Create a CMSGDATA1 data type. */
    typedef struct
    {
        unsigned Byte4:8;
        unsigned Byte5:8;
        unsigned Byte6:8;
        unsigned Byte7:8;
    }txcmsgdata1;
    /* This is the main data structure. */
    typedef union uCANTxMessageBuffer {
        struct
        {
            txcmsgsid CMSGSID;
            txcmsgeid CMSGEID;
            txcmsgdata0 CMSGDATA0;
            txcmsgdata0 CMSGDATA1;
        };
        int messageWord[4];
    }CANTxMessageBuffer;

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _M_CAN_COMMON_H */

/* *****************************************************************************
 End of File
 */
