/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#include "xc.h"
#include "trng.h"

#define TRNG_VALIDE_BITS     42U   /* Rang [1..64] */

void TRNG_Initialize( void )
{
    /* RNGNUMGENx seed/result for PRNG 
     * RNGCONbits.LOAD = 1;    Transfer RNGSEEDx to RNGNUMGENx
     * no interrupt dedicated for TRNG or PRNG
     */
    
    
    RNGPOLY1 = 0x00C00003;
    RNGPOLY2 = 0x00000000;
    RNGNUMGEN1 = 0x090a0b0c;
    RNGNUMGEN2 = 0x0d0e0f10;
    RNGCONbits.PLEN = 42;       /* Rang [1..64] */
    RNGCONbits.CONT = 1;        /* PRNG Number Shift Enable - new number each cycle */
    
    /* TRNG Operation Enable/Disable - don't work */
    RNGCONbits.TRNGEN = 0;

    /* PRNG Operation Enable */
    RNGCONbits.PRNGEN = 1;
    
    
    /* Transfer RNGSEEDx to RNGNUMGENx */
    //RNGCONbits.LOAD = 1;
}

uint32_t PRNG_GetNumGen( uint8_t index )
{
    switch(index)
    {
        case 0: return (RNGNUMGEN1);
        case 1: return (RNGNUMGEN2);
        default:
            break;
    }
    
    return 0;
}


void TRNG_WaitForCnt( void )
{
    // !! don't work - bug
    while (RNGCNT < TRNG_VALIDE_BITS)
    {
        /* Wait for read to complete */
    }
    
    // RNGSEEDx ready to read or move to RNGNUMGENx with LOAD
}

void TRNG_Enable( void )
{
    RNGCONbits.TRNGEN = 1;
}

void TRNG_Disable( void )
{
    RNGCONbits.TRNGEN = 0;
}



/* *****************************************************************************
 End of File
 */
