/**
 * @file task_monitor.h
 * @brief freeRTOS debug task
  * 
 * @author Phuc VU
 * @date Jun 18, 2026
 */

/********************************* Includes ***********************************/

#include <stdbool.h>

#include "FreeRTOS.h"
#include "task.h"
#include "task_monitor.h"
#include "tim3.h"
#include "gpio.h"


/********************************* Constants definition ***********************/

// ~40 char per task
#define DEF_TASKS_COUNT     (5) // IDLE task (default) + others tasks
#define DEF_TASK_SPACE      (40)
#define DEF_BUF_SIZE        (DEF_TASK_SPACE * DEF_TASKS_COUNT)

/********************************* Macros definition **************************/

/********************************* Types definition ***************************/

/********************************* Public variable ****************************/

volatile unsigned long ulHighFrequencyTimerTicks;

/********************************* Local function *****************************/

static void TMR3_EventHandler(uint32_t status, uintptr_t context)
{
    // dummy
    (void)status;
    (void)context;
    
    // 20 KHz - OK
    
    //LATBbits.LATB10 ^= 1;
    
    ulHighFrequencyTimerTicks++;
}

static void Initialize()
{
    TMR3_Initialize();
    TMR3_CallbackRegister(TMR3_EventHandler, (uintptr_t) NULL);
    TMR3_Start();
}

/********************************* API functions ******************************/


/* @brief Statistic using "vTaskGetRunTimeStats"
 * @param pvParameters - callback data
 */
void Monitor_Task( void *pvParameters )
{
    configASSERT( ( uint32_t ) pvParameters == 1UL );
    
    //static char pcWriteBuffer[DEF_BUF_SIZE] = {0};
    
    Initialize();
    
    while(true)
    {
        
        /* Delay to let the system run tasks */
        vTaskDelay(5000U / portTICK_PERIOD_MS);

        /* Get the statistic of every task during the periode */
        //vTaskGetRunTimeStats( (char*)&pcWriteBuffer[0] );
        
        // TODO: display result via UART
        
    }
}

/* *****************************************************************************
 End of File
 */
