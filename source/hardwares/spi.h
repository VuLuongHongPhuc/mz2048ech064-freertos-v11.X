/**
 * @file spi.h
 * @brief SPI interface implementation.
 * 
 * @author Phuc VU
 * @date 2026-08-07
 * @note This file is part of the project "mz2048ech064_rtos_cmake"
 */

#ifndef _DRV_SPI1_H    /* Guard against multiple inclusion */
#define _DRV_SPI1_H

/********************************* Includes ***************************************/

#include <stddef.h>  // size_t
#include <stdint.h>  // uint32_t, uint16_t, uint8_t
#include <stdbool.h> // bool, true, false
#include "xc.h"

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    void SPI1_Initialize();
    
    bool SPI1_Write(void const * const pBuffer, size_t size);
    bool SPI1_Read(void* const pBuffer, size_t size);
    
    static inline bool SPI1_IsBusy(void)
    {
        return ((SPI1STAT & _SPI1STAT_SRMT_MASK) == 0U) ? true : false;
    }

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _DRV_SPI1_H */

/* *****************************************************************************
 End of File
 */
