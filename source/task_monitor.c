/**
 * @file task_monitor.h
 * @brief freeRTOS debug task
  * 
 * @author Phuc VU
 * @date Jun 18, 2026
 */

/********************************* Includes ***********************************/

#include <stdbool.h>

#include <FreeRTOS.h>
#include <task.h>
#include "task_config.h"
#include "task_monitor.h"
#include "tim3.h"
#include "gpio.h"
#include "uart1.h"


/********************************* Constants definition ***********************/

// ~40 char per task
#define DEF_TASK_SPACE      (50)
#define DEF_BUF_SIZE        (DEF_TASK_SPACE * TASK_ID_MAX)

/********************************* Macros definition **************************/

/********************************* Types definition ***************************/

/********************************* Public variable ****************************/

volatile unsigned long ulHighFrequencyTimerTicks;

/********************************* Local function *****************************/

static void TMR3_EventHandler(uintptr_t context)
{
    // dummy
    (void)context;
    
    // 20 KHz - OK
    
    ulHighFrequencyTimerTicks++;
}

static void Initialize()
{    
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
    
    //char pcWriteBuffer[DEF_BUF_SIZE + 1] = {0};
    
    Initialize();
    
    while(true)
    {
        /* Delay to let the system run tasks */
        vTaskDelay(5000U / portTICK_PERIOD_MS);

        /* Get the statistic of every task during the periode */
        //vTaskGetRunTimeStatistics(pcWriteBuffer, DEF_BUF_SIZE);
        //vTaskGetRunTimeStats( &pcWriteBuffer[0] ); /* old */
        
        // Display result via UART
        //UART1_WriteDma((uint8_t*)&pcWriteBuffer[0], DEF_BUF_SIZE);
    }
}

/* *****************************************************************************
 End of File
 */
