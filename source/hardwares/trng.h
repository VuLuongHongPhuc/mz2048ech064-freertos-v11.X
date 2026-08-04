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

#ifndef _M_TRNG_H    /* Guard against multiple inclusion */
#define _M_TRNG_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */



/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    void TRNG_Initialize( void );
    void TRNG_WaitForCnt( void );
    uint32_t PRNG_GetNumGen( uint8_t index );


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _M_TRNG_H */

/* *****************************************************************************
 End of File
 */
