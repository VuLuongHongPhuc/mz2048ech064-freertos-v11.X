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

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include <stdbool.h>

#include "FreeRTOS.h"
#include "task.h"

#include "task_statistic.h"
#include "tim3.h"
#include "gpio.h"



// ~40 char per task
#define DEF_TASKS_COUNT     (5) // IDLE (default), tmr (default if use), Main_Tasks, Statistic_Tasks, Test_task, ...
#define DEF_BUF_SIZE        (40*DEF_TASKS_COUNT)

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */

volatile unsigned long ulHighFrequencyTimerTicks;

/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */

static void TMR3_EventHandler(uint32_t status, uintptr_t context)
{
    // dummy
    (void)status;
    (void)context;
    
    // 20 KHz - OK
    
    //LATBbits.LATB10 ^= 1;
    
    ulHighFrequencyTimerTicks++;
}


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

static void Initialize()
{
    TMR3_Initialize();
    TMR3_CallbackRegister(TMR3_EventHandler, (uintptr_t) NULL);
    TMR3_Start();
}



/* @brief Statistic using "vTaskGetRunTimeStats"
 * @param pvParameters - callback data
 */
void STATISTIC_Task( void *pvParameters )
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
