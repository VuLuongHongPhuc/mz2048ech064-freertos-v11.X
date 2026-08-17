

#ifndef _DRV_DMA_H    /* Guard against multiple inclusion */
#define _DRV_DMA_H

#include <stdint.h>
#include <stdbool.h>


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

void DMA_Initialize(void);
bool DMA_CH0_UART1_TX_Transfer(uint8_t * buf, uint32_t size);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _DRV_DMA_H */

/* *****************************************************************************
 End of File
 */
