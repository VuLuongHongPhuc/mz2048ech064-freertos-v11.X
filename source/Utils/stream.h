/*
 * stream.h
 *
 *  Created on: Dec 10, 2024
 *      Author: Phuc VU
 *
 * NOTE:
 *  - don't work if buffer size is under 3
 *  - data corrupted if overflow
 */

#ifndef __STREAM_BUFFER_H_
#define __STREAM_BUFFER_H_

/********************************* Includes ***************************************/

#include <stdint.h>
#include <stdbool.h>
//#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

/********************************* Constants definition ***************************/

#define STREAM_NO_ERROR            0x00000000U
#define STREAM_ERROR_OVERFLOW      0x00000001U
#define STREAM_ERROR_NULL_POINTER  0x00000002U

/********************************* Macros *****************************************/

/********************************* Data structure *********************************/

/**
 * @struct Stream
 * @brief buffer object to store data stream
 */
typedef struct Stream
{
    uint32_t size;           /*!< Stream buffer size */
    uint8_t* buffer;         /*!< Stream buffer */
    uint8_t* end_of_stream;  /*!< Stream buffer end (first invalid address) */
    uint8_t* volatile read;  /*!< Read pointer */
    uint8_t* volatile write; /*!< Write pointer */
} Stream_t;

/********************************* Public variables *******************************/

/********************************* API functions prototypes ***********************/

void STREAM_Initialize(Stream_t * pStream, uint8_t * pBuffer, uint32_t size);

void STREAM_Flush(Stream_t * pStream);

bool STREAM_IsEmpty(Stream_t const * const pStream);

bool STREAM_Write(Stream_t * const pStream, const uint8_t* pBuf, uint32_t length);

uint32_t STREAM_Read(Stream_t * const pStream, uint8_t * pBuf, uint32_t length);

uint32_t STREAM_Look(Stream_t const * const pStream, uint32_t offset, uint8_t * const pBuf, uint32_t length);

uint32_t STREAM_Length(Stream_t const * const pStream);

uint32_t STREAM_GetError(void);
void STREAM_ResetError(void);


#ifdef __cplusplus
}
#endif

#endif /* __STREAM_BUFFER_H_ */
