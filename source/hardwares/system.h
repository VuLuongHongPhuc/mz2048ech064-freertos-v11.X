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

#ifndef _SYSTEM_INIT_H    /* Guard against multiple inclusion */
#define _SYSTEM_INIT_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */




/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    /**** SYSTEM *******************************************/
    // PIC32MZ EC FAMILY OSCILLATOR DIAGRAM p.150
    // SYSTEM CLOCK       : 100 MHz
    // OSCILLATOR EXTERN  : EC 24 MHz
    
    void SYS_Initialize(void);


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _SYSTEM_INIT_H */

/* *****************************************************************************
 End of File
 */
