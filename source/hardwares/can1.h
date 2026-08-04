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

#ifndef _M_CAN1_H    /* Guard against multiple inclusion */
#define _M_CAN1_H



/*** Includes *****************************************************************/
#include <stdint.h>
#include "can_common.h"

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

void CAN1_Initialize(void);
void CAN1_RemapPPS(void);
void CAN1_Enable(void);
void CAN1_Disable(void);
void CAN1_ResetTxFIFO(void);
void CAN1_ResetRxFIFO(void);
uint8_t CAN1_Read(uint32_t *id, uint8_t *length, uint8_t *data, uint16_t *timestamp, CAN_MSG_RX_ATTRIBUTE *msgAttr);
uint8_t CAN1_Write(uint32_t id, uint8_t length, uint8_t* data, CAN_MSG_TX_ATTRIBUTE msgAttr);


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _M_CAN1_H */

/* *****************************************************************************
 End of File
 */
