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

/*** Include ******************************************************************/

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#include "FreeRTOS.h"
#include "task.h"

#include "task_main.h"
#include "gpio.h"
#include "led.h"


/*** Constant *****************************************************************/
const uint32_t DEF_DELAY_MAIN_TASK = 1000U / portTICK_PERIOD_MS;

/*** Variables ****************************************************************/
TaskHandle_t xTask_Main;


/*** Prototypes ************************************************************* */


void MAIN_Task( void *pvParameters  )
{   
    //configASSERT( ( uint32_t ) pvParameters == 1UL );
    (void)pvParameters;
    
    while(true)
    {
        LED_3_Toggle();
        //RB10_Toggle();

        vTaskDelay(DEF_DELAY_MAIN_TASK);
    }
}


// #define STACK_SIZE configMINIMAL_STACK_SIZE
// StaticTask_t xTaskBuffer;
// static StackType_t xStack[ STACK_SIZE ];
// void vTaskCode( void * pvParameters )
// {
//     /* The parameter value is expected to be 1 as 1 is passed in the
//     pvParameters value in the call to xTaskCreateStatic(). */
//     configASSERT( ( uint32_t ) pvParameters == 1UL );

//     for( ;; )
//     {
//         /* Task code goes here. */
        
//         LED_3_Toggle();

//         vTaskDelay(500U / portTICK_PERIOD_MS);
//     }
// }
// TaskHandle_t xHandle = NULL;
    
    // /* Create the task without using any dynamic memory allocation. */
    // xHandle = xTaskCreateStatic(
    //               vTaskCode,       /* Function that implements the task. */
    //               "NAME",          /* Text name for the task. */
    //               STACK_SIZE,      /* Number of indexes in the xStack array. */
    //               ( void * ) 1,    /* Parameter passed into the task. */
    //               configMAX_PRIORITIES -1,               /* Priority at which the task is created. */
    //               xStack,          /* Array to use as the task's stack. */
    //               &xTaskBuffer );  /* Variable to hold the task's data structure. */
    /* puxStackBuffer and pxTaskBuffer were not NULL, so the task will have
    been created, and xHandle will be the task's handle.  Use the handle
    to suspend the task. */
    //vTaskSuspend( xHandle );

/* *****************************************************************************
 End of File
 */
