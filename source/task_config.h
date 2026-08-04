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

#ifndef _TASK_CONFIG_H    /* Guard against multiple inclusion */
#define _TASK_CONFIG_H




/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif


    /* Tasks priorities */
    #define DEF_TASK_PRIORITY_MAIN                  (configMAX_PRIORITIES - 1)
    #define DEF_TASK_PRIORITY_STATISTIC             (configMAX_PRIORITIES - 4)
    #define DEF_TASK_PRIORITY_TEST                  (configMAX_PRIORITIES - 2)

    /* Tasks StackSize : 32bits -> (n * 4) */
    #define DEF_TASK_STACKSIZE_MAIN                 (512)      /* 512*4 octets */
    #define DEF_TASK_STACKSIZE_STATISTIC            (256)      /* 256*4 octets */
    #define DEF_TASK_STACKSIZE_TEST                 (512)      /* 512*4 octets */

    /* Tasks debug name */
    #define DEF_TASK_DEBUG_NAME_MAIN        "Task_Main"
    #define DEF_TASK_DEBUG_NAME_STATISTIC   "Task_Statistic"
    #define DEF_TASK_DEBUG_NAME_TEST        "Task_Test"

    

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _TASK_CONFIG_H */

/* *****************************************************************************
 End of File
 */
