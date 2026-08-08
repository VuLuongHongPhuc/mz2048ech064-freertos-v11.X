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

#ifndef _UART1_H    /* Guard against multiple inclusion */
#define _UART1_H


/********************************* Includes ***********************************/
#include <stdint.h>
#include <stdbool.h>

/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    
    
extern void UART1_Initialize(void);
extern bool UART1_Write(uint8_t const * const pBuf, uint16_t length);


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _UART1_H */

/* *****************************************************************************
 End of File
 */
