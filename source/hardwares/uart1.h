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

#ifndef _UART1_HEADER    /* Guard against multiple inclusion */
#define _UART1_HEADER


/********************************* Includes ***********************************/
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

#include "dma.h"

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    
    
extern void UART1_Initialize(void);

extern bool UART1_Write(uint8_t const * const pBuf, size_t length);

extern bool UART1_WriteIT(uint8_t const * const pBuf, size_t length);

static inline bool UART1_WriteDma(uint8_t* pBuf, size_t size)
{
    return DMA_CH0_UART1_TX_Transfer(pBuf, size);
}



/* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _UART1_HEADER */

/* *****************************************************************************
 End of File
 */
