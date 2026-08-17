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

    /* Tasks StackSize : 32bits -> (n * 4) */
    #define TASK_STACKSIZE_MAIN                 (512)      /* 512*4 octets */
    #define TASK_STACKSIZE_DISPLAY              (512)      /* 512*4 octets */
    #define TASK_STACKSIZE_TEST                 (512)      /* 512*4 octets */
    #define TASK_STACKSIZE_MONITOR              (512)      /* 512*4 octets */

    /* Tasks ID */
    #define TASK_ID_MAIN         0
    #define TASK_ID_DISPLAY      (TASK_ID_MAIN + 1)
    #define TASK_ID_TEST         (TASK_ID_DISPLAY + 1)
    #define TASK_ID_MONITOR      (TASK_ID_TEST + 1)
    #define TASK_ID_MAX          (TASK_ID_MONITOR + 1)
    
    /* Define priority configMAX_PRIORITIES = 5 */
    #define PRIORITY_HIGHEST        (configMAX_PRIORITIES - 1)
    #define PRIORITY_NORMAL         (configMAX_PRIORITIES - 2)
    #define PRIORITY_LOWEST         (configMAX_PRIORITIES - 3)
    #define PRIORITY_ABOVE_IDLE     (configMAX_PRIORITIES - 4)
    #define PRIORITY_IDLE           (0)    

    /* Tasks priorities */
    #define TASK_PRIORITY_MAIN                  PRIORITY_NORMAL
    #define TASK_PRIORITY_DISPLAY               PRIORITY_LOWEST
    #define TASK_PRIORITY_TEST                  PRIORITY_LOWEST
    #define TASK_PRIORITY_MONITOR               PRIORITY_ABOVE_IDLE
    
    /* Tasks name for debug */
    #define TASK_NAME_MAIN        "Task_Main"
    #define TASK_NAME_DISPLAY     "Task_Display"
    #define TASK_NAME_MONITOR     "Task_Monitor"
    #define TASK_NAME_TEST        "Task_Test"

    

/* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _TASK_CONFIG_H */

/* *****************************************************************************
 End of File
 */
