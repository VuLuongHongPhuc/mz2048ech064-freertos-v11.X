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

#ifndef _DRV_SPI1_H    /* Guard against multiple inclusion */
#define _DRV_SPI1_H


#include "typedefs.h" // BOOL


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    void SPI1_Initialize();
    
    BOOL SPI1_Write(const void* const pBuffer, size_t size);
    BOOL SPI1_Read(void* const pBuffer, size_t size);
    
    static inline BOOL SPI1_IsBusy(void)
    {
        return ((SPI1STAT & _SPI1STAT_SRMT_MASK) == 0U) ? TRUE : FALSE;
    }

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _DRV_SPI1_H */

/* *****************************************************************************
 End of File
 */
