#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=source/configurations/stdio/xc32_monitor.c source/configurations/freertos_hooks.c source/hardwares/can2.c source/hardwares/core_timer.c source/hardwares/gpio.c source/hardwares/spi.c source/hardwares/system.c source/hardwares/tim2.c source/hardwares/tim3.c source/hardwares/can1.c source/hardwares/trng.c source/hardwares/uart1.c source/hardwares/dma.c source/hardwares/led.c source/FreeRTOS-Kernel/portable/MemMang/heap_1.c source/FreeRTOS-Kernel/portable/PIC32MZ/port.c source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S source/FreeRTOS-Kernel/croutine.c source/FreeRTOS-Kernel/event_groups.c source/FreeRTOS-Kernel/list.c source/FreeRTOS-Kernel/queue.c source/FreeRTOS-Kernel/stream_buffer.c source/FreeRTOS-Kernel/tasks.c source/FreeRTOS-Kernel/timers.c source/devices/ILI9341/format_string.c source/devices/ILI9341/ili9341.c source/devices/ILI9341/ili9341_test.c source/task_main.c source/task_statistic.c source/task_display.c source/task_test.c source/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o ${OBJECTDIR}/source/configurations/freertos_hooks.o ${OBJECTDIR}/source/hardwares/can2.o ${OBJECTDIR}/source/hardwares/core_timer.o ${OBJECTDIR}/source/hardwares/gpio.o ${OBJECTDIR}/source/hardwares/spi.o ${OBJECTDIR}/source/hardwares/system.o ${OBJECTDIR}/source/hardwares/tim2.o ${OBJECTDIR}/source/hardwares/tim3.o ${OBJECTDIR}/source/hardwares/can1.o ${OBJECTDIR}/source/hardwares/trng.o ${OBJECTDIR}/source/hardwares/uart1.o ${OBJECTDIR}/source/hardwares/dma.o ${OBJECTDIR}/source/hardwares/led.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o ${OBJECTDIR}/source/devices/ILI9341/format_string.o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o ${OBJECTDIR}/source/task_main.o ${OBJECTDIR}/source/task_statistic.o ${OBJECTDIR}/source/task_display.o ${OBJECTDIR}/source/task_test.o ${OBJECTDIR}/source/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d ${OBJECTDIR}/source/configurations/freertos_hooks.o.d ${OBJECTDIR}/source/hardwares/can2.o.d ${OBJECTDIR}/source/hardwares/core_timer.o.d ${OBJECTDIR}/source/hardwares/gpio.o.d ${OBJECTDIR}/source/hardwares/spi.o.d ${OBJECTDIR}/source/hardwares/system.o.d ${OBJECTDIR}/source/hardwares/tim2.o.d ${OBJECTDIR}/source/hardwares/tim3.o.d ${OBJECTDIR}/source/hardwares/can1.o.d ${OBJECTDIR}/source/hardwares/trng.o.d ${OBJECTDIR}/source/hardwares/uart1.o.d ${OBJECTDIR}/source/hardwares/dma.o.d ${OBJECTDIR}/source/hardwares/led.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d ${OBJECTDIR}/source/devices/ILI9341/format_string.o.d ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d ${OBJECTDIR}/source/task_main.o.d ${OBJECTDIR}/source/task_statistic.o.d ${OBJECTDIR}/source/task_display.o.d ${OBJECTDIR}/source/task_test.o.d ${OBJECTDIR}/source/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o ${OBJECTDIR}/source/configurations/freertos_hooks.o ${OBJECTDIR}/source/hardwares/can2.o ${OBJECTDIR}/source/hardwares/core_timer.o ${OBJECTDIR}/source/hardwares/gpio.o ${OBJECTDIR}/source/hardwares/spi.o ${OBJECTDIR}/source/hardwares/system.o ${OBJECTDIR}/source/hardwares/tim2.o ${OBJECTDIR}/source/hardwares/tim3.o ${OBJECTDIR}/source/hardwares/can1.o ${OBJECTDIR}/source/hardwares/trng.o ${OBJECTDIR}/source/hardwares/uart1.o ${OBJECTDIR}/source/hardwares/dma.o ${OBJECTDIR}/source/hardwares/led.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o ${OBJECTDIR}/source/devices/ILI9341/format_string.o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o ${OBJECTDIR}/source/task_main.o ${OBJECTDIR}/source/task_statistic.o ${OBJECTDIR}/source/task_display.o ${OBJECTDIR}/source/task_test.o ${OBJECTDIR}/source/main.o

# Source Files
SOURCEFILES=source/configurations/stdio/xc32_monitor.c source/configurations/freertos_hooks.c source/hardwares/can2.c source/hardwares/core_timer.c source/hardwares/gpio.c source/hardwares/spi.c source/hardwares/system.c source/hardwares/tim2.c source/hardwares/tim3.c source/hardwares/can1.c source/hardwares/trng.c source/hardwares/uart1.c source/hardwares/dma.c source/hardwares/led.c source/FreeRTOS-Kernel/portable/MemMang/heap_1.c source/FreeRTOS-Kernel/portable/PIC32MZ/port.c source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S source/FreeRTOS-Kernel/croutine.c source/FreeRTOS-Kernel/event_groups.c source/FreeRTOS-Kernel/list.c source/FreeRTOS-Kernel/queue.c source/FreeRTOS-Kernel/stream_buffer.c source/FreeRTOS-Kernel/tasks.c source/FreeRTOS-Kernel/timers.c source/devices/ILI9341/format_string.c source/devices/ILI9341/ili9341.c source/devices/ILI9341/ili9341_test.c source/task_main.c source/task_statistic.c source/task_display.c source/task_test.c source/main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048ECH064
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  .generated_files/flags/default/934fe981358e4c54d76df2149c7a94e3982ae215 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"source/configurations" -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  .generated_files/flags/default/b254fe524c2ca56d17c988db3a0623b736d34b71 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"source/configurations" -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o: source/configurations/stdio/xc32_monitor.c  .generated_files/flags/default/d45f492fbf0d74338d6ffc03f8c705df104ab552 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations/stdio" 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o source/configurations/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/configurations/freertos_hooks.o: source/configurations/freertos_hooks.c  .generated_files/flags/default/385f24bf94ffdbf250bb11e262bc9344e3fab56a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations" 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/freertos_hooks.o.d" -o ${OBJECTDIR}/source/configurations/freertos_hooks.o source/configurations/freertos_hooks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can2.o: source/hardwares/can2.c  .generated_files/flags/default/1613ae7207faf43e9cb1038f4182f740286bf8df .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can2.o.d" -o ${OBJECTDIR}/source/hardwares/can2.o source/hardwares/can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/core_timer.o: source/hardwares/core_timer.c  .generated_files/flags/default/c3dc0c1519820f4a74284241c9241294b01c5fad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/core_timer.o.d" -o ${OBJECTDIR}/source/hardwares/core_timer.o source/hardwares/core_timer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/gpio.o: source/hardwares/gpio.c  .generated_files/flags/default/9dae244f0ffcf03e5db7a5c9feb6d59be712d202 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/gpio.o.d" -o ${OBJECTDIR}/source/hardwares/gpio.o source/hardwares/gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/spi.o: source/hardwares/spi.c  .generated_files/flags/default/92e3edad6f16ea94a7aad6c5971f320e8841cee3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/spi.o.d" -o ${OBJECTDIR}/source/hardwares/spi.o source/hardwares/spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/system.o: source/hardwares/system.c  .generated_files/flags/default/2116bcd0e9a24d1afa3a4be49a0a615cd7c039c3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/system.o.d" -o ${OBJECTDIR}/source/hardwares/system.o source/hardwares/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim2.o: source/hardwares/tim2.c  .generated_files/flags/default/1c1ffbbfcda401f0be9b34f7794d5ef6c5f4ca17 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim2.o.d" -o ${OBJECTDIR}/source/hardwares/tim2.o source/hardwares/tim2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim3.o: source/hardwares/tim3.c  .generated_files/flags/default/d4ad1048ecf5f7365ff50ad21c515fd05edb63bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim3.o.d" -o ${OBJECTDIR}/source/hardwares/tim3.o source/hardwares/tim3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can1.o: source/hardwares/can1.c  .generated_files/flags/default/34be7fa9c0a26f1b140cbb005aa3cb85835acb99 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can1.o.d" -o ${OBJECTDIR}/source/hardwares/can1.o source/hardwares/can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/trng.o: source/hardwares/trng.c  .generated_files/flags/default/196cd19a40e2965dc365a3b46e010a5009b6387d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/trng.o.d" -o ${OBJECTDIR}/source/hardwares/trng.o source/hardwares/trng.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/uart1.o: source/hardwares/uart1.c  .generated_files/flags/default/b17585096cac75bc137023bd1bd454700c4664db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/uart1.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/uart1.o.d" -o ${OBJECTDIR}/source/hardwares/uart1.o source/hardwares/uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/dma.o: source/hardwares/dma.c  .generated_files/flags/default/837e156b12f0b569208a164023337116412fba3f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/dma.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/dma.o.d" -o ${OBJECTDIR}/source/hardwares/dma.o source/hardwares/dma.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/led.o: source/hardwares/led.c  .generated_files/flags/default/1a0a0dab2e79236b9e621d46f162f2af3cc7f9c5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/led.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/led.o.d" -o ${OBJECTDIR}/source/hardwares/led.o source/hardwares/led.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o: source/FreeRTOS-Kernel/portable/MemMang/heap_1.c  .generated_files/flags/default/8e625fff02d5657b840c576b2a8d286fe36ebed9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o source/FreeRTOS-Kernel/portable/MemMang/heap_1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port.c  .generated_files/flags/default/22985757daa468a00d89df2c6adcae7b7d548109 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o source/FreeRTOS-Kernel/portable/PIC32MZ/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o: source/FreeRTOS-Kernel/croutine.c  .generated_files/flags/default/bea8cd44a1f6a28fdabcf92bd6abb9abe8fc42e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o source/FreeRTOS-Kernel/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o: source/FreeRTOS-Kernel/event_groups.c  .generated_files/flags/default/b2d8ae024f5ad29c40b0542cbc82923a30d0224a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o source/FreeRTOS-Kernel/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/list.o: source/FreeRTOS-Kernel/list.c  .generated_files/flags/default/a7ca3259449c5b811878b678dac930c6e438b3ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o source/FreeRTOS-Kernel/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o: source/FreeRTOS-Kernel/queue.c  .generated_files/flags/default/baf548f7a1f7f9f6fdab15810c5aa3355334e84 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o source/FreeRTOS-Kernel/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o: source/FreeRTOS-Kernel/stream_buffer.c  .generated_files/flags/default/71f32429c6b9bd4728aad5a22b73df7fc66246c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o source/FreeRTOS-Kernel/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o: source/FreeRTOS-Kernel/tasks.c  .generated_files/flags/default/5f65933da29e77062e82dd5801dad36cd51ce0e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o source/FreeRTOS-Kernel/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o: source/FreeRTOS-Kernel/timers.c  .generated_files/flags/default/a8914e0d5f74270b0968f2b54fe3ebf80d5ee8b5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o source/FreeRTOS-Kernel/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/format_string.o: source/devices/ILI9341/format_string.c  .generated_files/flags/default/72ad2352224b6fce97155772cc60e2e3d7b80d77 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/format_string.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/format_string.o source/devices/ILI9341/format_string.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341.o: source/devices/ILI9341/ili9341.c  .generated_files/flags/default/ae75eb3c1fc186be2ebb0091ba13a895ba9ed728 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o source/devices/ILI9341/ili9341.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o: source/devices/ILI9341/ili9341_test.c  .generated_files/flags/default/322783468a243dcc0611ce9897638f6bf8f6d12b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o source/devices/ILI9341/ili9341_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_main.o: source/task_main.c  .generated_files/flags/default/9ad150986cf7fdf88abdf8bddcc359421b0dd062 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_main.o.d 
	@${RM} ${OBJECTDIR}/source/task_main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_main.o.d" -o ${OBJECTDIR}/source/task_main.o source/task_main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_statistic.o: source/task_statistic.c  .generated_files/flags/default/18e10548829fc2cf602d99d1c2b556f8bc3084b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_statistic.o.d 
	@${RM} ${OBJECTDIR}/source/task_statistic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_statistic.o.d" -o ${OBJECTDIR}/source/task_statistic.o source/task_statistic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_display.o: source/task_display.c  .generated_files/flags/default/ab87937bd969fccae1f55357b5f8e7b6908e822f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_display.o.d 
	@${RM} ${OBJECTDIR}/source/task_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_display.o.d" -o ${OBJECTDIR}/source/task_display.o source/task_display.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_test.o: source/task_test.c  .generated_files/flags/default/59a5862d7219187d47ef80adcdabdaf6eeed79ab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_test.o.d 
	@${RM} ${OBJECTDIR}/source/task_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_test.o.d" -o ${OBJECTDIR}/source/task_test.o source/task_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/main.o: source/main.c  .generated_files/flags/default/fe0f42d4a80e7269224764d6cf37683746afbeca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/main.o.d" -o ${OBJECTDIR}/source/main.o source/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o: source/configurations/stdio/xc32_monitor.c  .generated_files/flags/default/95bb4f8eee460069daa36b125c77dc24b28d96bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations/stdio" 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o source/configurations/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/configurations/freertos_hooks.o: source/configurations/freertos_hooks.c  .generated_files/flags/default/10d9356fd121ada606f432224ac73c421b1d203e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations" 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/freertos_hooks.o.d" -o ${OBJECTDIR}/source/configurations/freertos_hooks.o source/configurations/freertos_hooks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can2.o: source/hardwares/can2.c  .generated_files/flags/default/ca7aacaf84607daaf98dab04e74f5fb521638723 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can2.o.d" -o ${OBJECTDIR}/source/hardwares/can2.o source/hardwares/can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/core_timer.o: source/hardwares/core_timer.c  .generated_files/flags/default/a67ab534a30b9b0d4983e8e69540cb7cd277f97 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/core_timer.o.d" -o ${OBJECTDIR}/source/hardwares/core_timer.o source/hardwares/core_timer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/gpio.o: source/hardwares/gpio.c  .generated_files/flags/default/82f5e55064d6e54c89bacb0f67fcfe65b629a114 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/gpio.o.d" -o ${OBJECTDIR}/source/hardwares/gpio.o source/hardwares/gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/spi.o: source/hardwares/spi.c  .generated_files/flags/default/71300eeb9d73ddc36b17a9de9bc7bc1cb8da8069 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/spi.o.d" -o ${OBJECTDIR}/source/hardwares/spi.o source/hardwares/spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/system.o: source/hardwares/system.c  .generated_files/flags/default/fcee42a6ab7e8c6181cce8679111ce755048dcfe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/system.o.d" -o ${OBJECTDIR}/source/hardwares/system.o source/hardwares/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim2.o: source/hardwares/tim2.c  .generated_files/flags/default/8b1d8f46b9701a34462e84013d60ae66cd9f7e66 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim2.o.d" -o ${OBJECTDIR}/source/hardwares/tim2.o source/hardwares/tim2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim3.o: source/hardwares/tim3.c  .generated_files/flags/default/ed51d0583c06e7d7cb564fe6abc94e35b412c57a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim3.o.d" -o ${OBJECTDIR}/source/hardwares/tim3.o source/hardwares/tim3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can1.o: source/hardwares/can1.c  .generated_files/flags/default/2d538d6a41dc603369cae875481eee66dd6b5952 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can1.o.d" -o ${OBJECTDIR}/source/hardwares/can1.o source/hardwares/can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/trng.o: source/hardwares/trng.c  .generated_files/flags/default/df72d79b523693bef0776b9b416012452ec844d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/trng.o.d" -o ${OBJECTDIR}/source/hardwares/trng.o source/hardwares/trng.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/uart1.o: source/hardwares/uart1.c  .generated_files/flags/default/ab093de09afaf822a14b31b0a2632c4d6fd698fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/uart1.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/uart1.o.d" -o ${OBJECTDIR}/source/hardwares/uart1.o source/hardwares/uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/dma.o: source/hardwares/dma.c  .generated_files/flags/default/d661848c3cb344455e6f9bfda7ac5f6adbc24930 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/dma.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/dma.o.d" -o ${OBJECTDIR}/source/hardwares/dma.o source/hardwares/dma.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/led.o: source/hardwares/led.c  .generated_files/flags/default/333eccf65edea17a590f81fa69fe35f7c16fb064 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/led.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/led.o.d" -o ${OBJECTDIR}/source/hardwares/led.o source/hardwares/led.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o: source/FreeRTOS-Kernel/portable/MemMang/heap_1.c  .generated_files/flags/default/ee082df99509d14ccbb8a80d3ec65fc793631453 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o source/FreeRTOS-Kernel/portable/MemMang/heap_1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port.c  .generated_files/flags/default/be89aaf9b929187b802764873f2984b8f042d72b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o source/FreeRTOS-Kernel/portable/PIC32MZ/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o: source/FreeRTOS-Kernel/croutine.c  .generated_files/flags/default/c0145b90e462ed2a9596f99b3543488042e2931 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o source/FreeRTOS-Kernel/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o: source/FreeRTOS-Kernel/event_groups.c  .generated_files/flags/default/8bafb2b939242d303b16857d548938817ee84509 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o source/FreeRTOS-Kernel/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/list.o: source/FreeRTOS-Kernel/list.c  .generated_files/flags/default/7c1fcc127b457501f5f4b8c1e33890260a62ede1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o source/FreeRTOS-Kernel/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o: source/FreeRTOS-Kernel/queue.c  .generated_files/flags/default/3d7de8dbc8cd5c06e91c91ecad6e1912bd1853bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o source/FreeRTOS-Kernel/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o: source/FreeRTOS-Kernel/stream_buffer.c  .generated_files/flags/default/42bb8d7c98c0c29bcc1a991fb53f9e0d025d1aec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o source/FreeRTOS-Kernel/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o: source/FreeRTOS-Kernel/tasks.c  .generated_files/flags/default/33c9865b5b830c7e00a807ae2ca8a1466e8a4c04 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o source/FreeRTOS-Kernel/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o: source/FreeRTOS-Kernel/timers.c  .generated_files/flags/default/b1e0580b32bfbaa3c04f2bf7753ec541349115d3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o source/FreeRTOS-Kernel/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/format_string.o: source/devices/ILI9341/format_string.c  .generated_files/flags/default/8b54447970903a1ef0810c46b3a50a2b6a2ceb85 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/format_string.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/format_string.o source/devices/ILI9341/format_string.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341.o: source/devices/ILI9341/ili9341.c  .generated_files/flags/default/aa4622b9b34a7995c368f05ac97fff4ebe420ba1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o source/devices/ILI9341/ili9341.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o: source/devices/ILI9341/ili9341_test.c  .generated_files/flags/default/490322b57ea5d649bdd5a7de712410575f6761f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o source/devices/ILI9341/ili9341_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_main.o: source/task_main.c  .generated_files/flags/default/af35e9d417ac85a0fd45465e0bea0768df46f120 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_main.o.d 
	@${RM} ${OBJECTDIR}/source/task_main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_main.o.d" -o ${OBJECTDIR}/source/task_main.o source/task_main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_statistic.o: source/task_statistic.c  .generated_files/flags/default/a3944076003d26761915a6a1586c379855364e58 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_statistic.o.d 
	@${RM} ${OBJECTDIR}/source/task_statistic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_statistic.o.d" -o ${OBJECTDIR}/source/task_statistic.o source/task_statistic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_display.o: source/task_display.c  .generated_files/flags/default/54a6c59196ec4353f0d14713d7e8c9d646c180f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_display.o.d 
	@${RM} ${OBJECTDIR}/source/task_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_display.o.d" -o ${OBJECTDIR}/source/task_display.o source/task_display.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_test.o: source/task_test.c  .generated_files/flags/default/401200a5a2a84153c133115e95102ce538efa1ed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_test.o.d 
	@${RM} ${OBJECTDIR}/source/task_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_test.o.d" -o ${OBJECTDIR}/source/task_test.o source/task_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/main.o: source/main.c  .generated_files/flags/default/999150ee5bae388fa789eecd80b59a97a9a37be4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/main.o.d" -o ${OBJECTDIR}/source/main.o source/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x27F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
