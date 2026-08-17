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
SOURCEFILES_QUOTED_IF_SPACED=source/configurations/stdio/xc32_monitor.c source/configurations/freertos_hooks.c source/devices/ILI9341/ili9341.c source/devices/ILI9341/ili9341_test.c source/hardwares/can1.c source/hardwares/can2.c source/hardwares/core_timer.c source/hardwares/dma.c source/hardwares/gpio.c source/hardwares/spi.c source/hardwares/system.c source/hardwares/tim2.c source/hardwares/tim3.c source/hardwares/trng.c source/hardwares/uart1.c source/task_main.c source/task_display.c source/task_test.c source/Utils/convert_to_string.c source/Utils/stream.c source/main.c source/FreeRTOS-Kernel/queue.c source/FreeRTOS-Kernel/stream_buffer.c source/FreeRTOS-Kernel/tasks.c source/FreeRTOS-Kernel/timers.c source/FreeRTOS-Kernel/list.c source/FreeRTOS-Kernel/event_groups.c source/FreeRTOS-Kernel/croutine.c source/FreeRTOS-Kernel/portable/MemMang/heap_4.c source/FreeRTOS-Kernel/portable/PIC32MZ/port.c source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S source/task_monitor.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o ${OBJECTDIR}/source/configurations/freertos_hooks.o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o ${OBJECTDIR}/source/hardwares/can1.o ${OBJECTDIR}/source/hardwares/can2.o ${OBJECTDIR}/source/hardwares/core_timer.o ${OBJECTDIR}/source/hardwares/dma.o ${OBJECTDIR}/source/hardwares/gpio.o ${OBJECTDIR}/source/hardwares/spi.o ${OBJECTDIR}/source/hardwares/system.o ${OBJECTDIR}/source/hardwares/tim2.o ${OBJECTDIR}/source/hardwares/tim3.o ${OBJECTDIR}/source/hardwares/trng.o ${OBJECTDIR}/source/hardwares/uart1.o ${OBJECTDIR}/source/task_main.o ${OBJECTDIR}/source/task_display.o ${OBJECTDIR}/source/task_test.o ${OBJECTDIR}/source/Utils/convert_to_string.o ${OBJECTDIR}/source/Utils/stream.o ${OBJECTDIR}/source/main.o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o ${OBJECTDIR}/source/task_monitor.o
POSSIBLE_DEPFILES=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d ${OBJECTDIR}/source/configurations/freertos_hooks.o.d ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d ${OBJECTDIR}/source/hardwares/can1.o.d ${OBJECTDIR}/source/hardwares/can2.o.d ${OBJECTDIR}/source/hardwares/core_timer.o.d ${OBJECTDIR}/source/hardwares/dma.o.d ${OBJECTDIR}/source/hardwares/gpio.o.d ${OBJECTDIR}/source/hardwares/spi.o.d ${OBJECTDIR}/source/hardwares/system.o.d ${OBJECTDIR}/source/hardwares/tim2.o.d ${OBJECTDIR}/source/hardwares/tim3.o.d ${OBJECTDIR}/source/hardwares/trng.o.d ${OBJECTDIR}/source/hardwares/uart1.o.d ${OBJECTDIR}/source/task_main.o.d ${OBJECTDIR}/source/task_display.o.d ${OBJECTDIR}/source/task_test.o.d ${OBJECTDIR}/source/Utils/convert_to_string.o.d ${OBJECTDIR}/source/Utils/stream.o.d ${OBJECTDIR}/source/main.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d ${OBJECTDIR}/source/task_monitor.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o ${OBJECTDIR}/source/configurations/freertos_hooks.o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o ${OBJECTDIR}/source/hardwares/can1.o ${OBJECTDIR}/source/hardwares/can2.o ${OBJECTDIR}/source/hardwares/core_timer.o ${OBJECTDIR}/source/hardwares/dma.o ${OBJECTDIR}/source/hardwares/gpio.o ${OBJECTDIR}/source/hardwares/spi.o ${OBJECTDIR}/source/hardwares/system.o ${OBJECTDIR}/source/hardwares/tim2.o ${OBJECTDIR}/source/hardwares/tim3.o ${OBJECTDIR}/source/hardwares/trng.o ${OBJECTDIR}/source/hardwares/uart1.o ${OBJECTDIR}/source/task_main.o ${OBJECTDIR}/source/task_display.o ${OBJECTDIR}/source/task_test.o ${OBJECTDIR}/source/Utils/convert_to_string.o ${OBJECTDIR}/source/Utils/stream.o ${OBJECTDIR}/source/main.o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o ${OBJECTDIR}/source/task_monitor.o

# Source Files
SOURCEFILES=source/configurations/stdio/xc32_monitor.c source/configurations/freertos_hooks.c source/devices/ILI9341/ili9341.c source/devices/ILI9341/ili9341_test.c source/hardwares/can1.c source/hardwares/can2.c source/hardwares/core_timer.c source/hardwares/dma.c source/hardwares/gpio.c source/hardwares/spi.c source/hardwares/system.c source/hardwares/tim2.c source/hardwares/tim3.c source/hardwares/trng.c source/hardwares/uart1.c source/task_main.c source/task_display.c source/task_test.c source/Utils/convert_to_string.c source/Utils/stream.c source/main.c source/FreeRTOS-Kernel/queue.c source/FreeRTOS-Kernel/stream_buffer.c source/FreeRTOS-Kernel/tasks.c source/FreeRTOS-Kernel/timers.c source/FreeRTOS-Kernel/list.c source/FreeRTOS-Kernel/event_groups.c source/FreeRTOS-Kernel/croutine.c source/FreeRTOS-Kernel/portable/MemMang/heap_4.c source/FreeRTOS-Kernel/portable/PIC32MZ/port.c source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S source/task_monitor.c



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
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  .generated_files/flags/default/209a3b3f02f5cfc6dea08512d3dcdb7823ed769b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"source/configurations" -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  .generated_files/flags/default/91dfb65d50821eb5be929d3934b8016834b72628 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o: source/configurations/stdio/xc32_monitor.c  .generated_files/flags/default/98bc21fc023483e7e7ccbaa5ba48b7127d6a4996 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations/stdio" 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o source/configurations/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/configurations/freertos_hooks.o: source/configurations/freertos_hooks.c  .generated_files/flags/default/28385a495dff21abaadca5401a8f3b3adcd8cd99 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations" 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/freertos_hooks.o.d" -o ${OBJECTDIR}/source/configurations/freertos_hooks.o source/configurations/freertos_hooks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341.o: source/devices/ILI9341/ili9341.c  .generated_files/flags/default/430984070aa622c622783cb73b623375a557e65d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o source/devices/ILI9341/ili9341.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o: source/devices/ILI9341/ili9341_test.c  .generated_files/flags/default/9fa0c363faf6e44392e1afeb2df51829d0995078 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o source/devices/ILI9341/ili9341_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can1.o: source/hardwares/can1.c  .generated_files/flags/default/319fef53083944dc661fb01904ec8556e5a61dc7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can1.o.d" -o ${OBJECTDIR}/source/hardwares/can1.o source/hardwares/can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can2.o: source/hardwares/can2.c  .generated_files/flags/default/26b1f277db9e04770b715c9678a1d9d0f6c4db5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can2.o.d" -o ${OBJECTDIR}/source/hardwares/can2.o source/hardwares/can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/core_timer.o: source/hardwares/core_timer.c  .generated_files/flags/default/ee2f7076a44cfaa703d1e09c0ff9e1decd5494dc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/core_timer.o.d" -o ${OBJECTDIR}/source/hardwares/core_timer.o source/hardwares/core_timer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/dma.o: source/hardwares/dma.c  .generated_files/flags/default/c0a6136d30b1f70e85eebc70fb23efbaa6ba9f7f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/dma.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/dma.o.d" -o ${OBJECTDIR}/source/hardwares/dma.o source/hardwares/dma.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/gpio.o: source/hardwares/gpio.c  .generated_files/flags/default/63c1c8305a3ce97122439043cbc2cc739b0f261a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/gpio.o.d" -o ${OBJECTDIR}/source/hardwares/gpio.o source/hardwares/gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/spi.o: source/hardwares/spi.c  .generated_files/flags/default/22a3220265b636aeeba50096cd8763e483de436f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/spi.o.d" -o ${OBJECTDIR}/source/hardwares/spi.o source/hardwares/spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/system.o: source/hardwares/system.c  .generated_files/flags/default/9be43186de553c5e7d721c2bb32899f4e5010a25 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/system.o.d" -o ${OBJECTDIR}/source/hardwares/system.o source/hardwares/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim2.o: source/hardwares/tim2.c  .generated_files/flags/default/c3c0fcdb831e9a3364ae79da348f227e7f5fee38 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim2.o.d" -o ${OBJECTDIR}/source/hardwares/tim2.o source/hardwares/tim2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim3.o: source/hardwares/tim3.c  .generated_files/flags/default/cd65a1062025f8f8aa3c8c36a2648f847dd36674 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim3.o.d" -o ${OBJECTDIR}/source/hardwares/tim3.o source/hardwares/tim3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/trng.o: source/hardwares/trng.c  .generated_files/flags/default/f274c52b7413973d344892f430ece3eef875e895 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/trng.o.d" -o ${OBJECTDIR}/source/hardwares/trng.o source/hardwares/trng.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/uart1.o: source/hardwares/uart1.c  .generated_files/flags/default/4334dd078e1c5b8c9abf5bbe4ed57f4ae2070a72 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/uart1.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/uart1.o.d" -o ${OBJECTDIR}/source/hardwares/uart1.o source/hardwares/uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_main.o: source/task_main.c  .generated_files/flags/default/406d4c081b38fcc74e8e42eafd4c4509ef9a7652 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_main.o.d 
	@${RM} ${OBJECTDIR}/source/task_main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_main.o.d" -o ${OBJECTDIR}/source/task_main.o source/task_main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_display.o: source/task_display.c  .generated_files/flags/default/1965340e96600b5a00ba877a488863ee30a2f5a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_display.o.d 
	@${RM} ${OBJECTDIR}/source/task_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_display.o.d" -o ${OBJECTDIR}/source/task_display.o source/task_display.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_test.o: source/task_test.c  .generated_files/flags/default/6741ea51ab7c89df68ee983794d94fa46ac52607 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_test.o.d 
	@${RM} ${OBJECTDIR}/source/task_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_test.o.d" -o ${OBJECTDIR}/source/task_test.o source/task_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/Utils/convert_to_string.o: source/Utils/convert_to_string.c  .generated_files/flags/default/539e50740bcfd4dca8d9043436ecdd59f484a04a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/Utils" 
	@${RM} ${OBJECTDIR}/source/Utils/convert_to_string.o.d 
	@${RM} ${OBJECTDIR}/source/Utils/convert_to_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/Utils/convert_to_string.o.d" -o ${OBJECTDIR}/source/Utils/convert_to_string.o source/Utils/convert_to_string.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/Utils/stream.o: source/Utils/stream.c  .generated_files/flags/default/331ec68b9794c2b0c9ac8aefaeaeb12c3d753741 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/Utils" 
	@${RM} ${OBJECTDIR}/source/Utils/stream.o.d 
	@${RM} ${OBJECTDIR}/source/Utils/stream.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/Utils/stream.o.d" -o ${OBJECTDIR}/source/Utils/stream.o source/Utils/stream.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/main.o: source/main.c  .generated_files/flags/default/52cefb6c2488d6c54e2b69939848456bdd8dc771 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/main.o.d" -o ${OBJECTDIR}/source/main.o source/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o: source/FreeRTOS-Kernel/queue.c  .generated_files/flags/default/23c419be20a74fc38c7a5f09b207eb5c6df7a37d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o source/FreeRTOS-Kernel/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o: source/FreeRTOS-Kernel/stream_buffer.c  .generated_files/flags/default/f7b292c75a0c8e10dc847eaf548d7b51dd660484 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o source/FreeRTOS-Kernel/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o: source/FreeRTOS-Kernel/tasks.c  .generated_files/flags/default/55f5fb609a1ddba818b1161298a9412f43260f1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o source/FreeRTOS-Kernel/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o: source/FreeRTOS-Kernel/timers.c  .generated_files/flags/default/7cc665e0c4c234f52639ee992bf4280c5f47763d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o source/FreeRTOS-Kernel/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/list.o: source/FreeRTOS-Kernel/list.c  .generated_files/flags/default/95301b6872c7b79907a5dbca337ba500738e2957 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o source/FreeRTOS-Kernel/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o: source/FreeRTOS-Kernel/event_groups.c  .generated_files/flags/default/edfeb9e38b6588efa3829a753b4fcc827be39f2b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o source/FreeRTOS-Kernel/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o: source/FreeRTOS-Kernel/croutine.c  .generated_files/flags/default/159dcbdba4bdb35a765384834efed36c7d996413 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o source/FreeRTOS-Kernel/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o: source/FreeRTOS-Kernel/portable/MemMang/heap_4.c  .generated_files/flags/default/cda228ab5c8769af64c019586da1c55608ecf4b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o source/FreeRTOS-Kernel/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port.c  .generated_files/flags/default/7fec849649fabd2cfb516ae10f3ecaf4015d7cab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o source/FreeRTOS-Kernel/portable/PIC32MZ/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_monitor.o: source/task_monitor.c  .generated_files/flags/default/a2683306e7cdd8bf4b20d65b6a12830103a88f86 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_monitor.o.d 
	@${RM} ${OBJECTDIR}/source/task_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_monitor.o.d" -o ${OBJECTDIR}/source/task_monitor.o source/task_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o: source/configurations/stdio/xc32_monitor.c  .generated_files/flags/default/d91695a37a8b86bf3455c345b757c96c418d7045 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations/stdio" 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o source/configurations/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/configurations/freertos_hooks.o: source/configurations/freertos_hooks.c  .generated_files/flags/default/2c4c71e57d4a798d9da0dbf9cc425e2674447378 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations" 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/freertos_hooks.o.d" -o ${OBJECTDIR}/source/configurations/freertos_hooks.o source/configurations/freertos_hooks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341.o: source/devices/ILI9341/ili9341.c  .generated_files/flags/default/de3b2020036a43900620df05e8f7b9fd70127545 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o source/devices/ILI9341/ili9341.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o: source/devices/ILI9341/ili9341_test.c  .generated_files/flags/default/55a6acd4efbc77aa049af9ecee6ec713a0164925 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o source/devices/ILI9341/ili9341_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can1.o: source/hardwares/can1.c  .generated_files/flags/default/dfcce3e721bc01ed15508726fda6b4cc25804078 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can1.o.d" -o ${OBJECTDIR}/source/hardwares/can1.o source/hardwares/can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can2.o: source/hardwares/can2.c  .generated_files/flags/default/7a40d11f678a6bc1c922317cbfdc3ae343b7a584 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can2.o.d" -o ${OBJECTDIR}/source/hardwares/can2.o source/hardwares/can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/core_timer.o: source/hardwares/core_timer.c  .generated_files/flags/default/dd308d1694f1f42bc7f20c19bd1424b8095f3e99 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/core_timer.o.d" -o ${OBJECTDIR}/source/hardwares/core_timer.o source/hardwares/core_timer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/dma.o: source/hardwares/dma.c  .generated_files/flags/default/b872648a837fb9f39c2ae53fb090845433b3bce9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/dma.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/dma.o.d" -o ${OBJECTDIR}/source/hardwares/dma.o source/hardwares/dma.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/gpio.o: source/hardwares/gpio.c  .generated_files/flags/default/b6144a44c456d2d76bba620edf324783b38ce35b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/gpio.o.d" -o ${OBJECTDIR}/source/hardwares/gpio.o source/hardwares/gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/spi.o: source/hardwares/spi.c  .generated_files/flags/default/43bfa7f0ae4b8872cea8350d207e86bd684e0108 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/spi.o.d" -o ${OBJECTDIR}/source/hardwares/spi.o source/hardwares/spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/system.o: source/hardwares/system.c  .generated_files/flags/default/129bdec1795d2cba6aa9d3cf5e77f9a847577ecb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/system.o.d" -o ${OBJECTDIR}/source/hardwares/system.o source/hardwares/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim2.o: source/hardwares/tim2.c  .generated_files/flags/default/8452dc8e218b7ba7460a96b0ccaa9177f6684d55 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim2.o.d" -o ${OBJECTDIR}/source/hardwares/tim2.o source/hardwares/tim2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim3.o: source/hardwares/tim3.c  .generated_files/flags/default/2f7d013d2385285153c921594a08838717e792bf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim3.o.d" -o ${OBJECTDIR}/source/hardwares/tim3.o source/hardwares/tim3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/trng.o: source/hardwares/trng.c  .generated_files/flags/default/b898cb305e4821b4fca63a1047d10068dbaff8c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/trng.o.d" -o ${OBJECTDIR}/source/hardwares/trng.o source/hardwares/trng.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/uart1.o: source/hardwares/uart1.c  .generated_files/flags/default/395710968b32a2f559c6f73182b7da35198f06eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/uart1.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/uart1.o.d" -o ${OBJECTDIR}/source/hardwares/uart1.o source/hardwares/uart1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_main.o: source/task_main.c  .generated_files/flags/default/f58988c714bbb86b6a0647dc75db21aa6115388 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_main.o.d 
	@${RM} ${OBJECTDIR}/source/task_main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_main.o.d" -o ${OBJECTDIR}/source/task_main.o source/task_main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_display.o: source/task_display.c  .generated_files/flags/default/1b374bf13b56591c8cd363ac928d34e7352a19ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_display.o.d 
	@${RM} ${OBJECTDIR}/source/task_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_display.o.d" -o ${OBJECTDIR}/source/task_display.o source/task_display.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_test.o: source/task_test.c  .generated_files/flags/default/a2c626d53b210fc50a9c965e43968ae49f5671d6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_test.o.d 
	@${RM} ${OBJECTDIR}/source/task_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_test.o.d" -o ${OBJECTDIR}/source/task_test.o source/task_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/Utils/convert_to_string.o: source/Utils/convert_to_string.c  .generated_files/flags/default/88eb2e2aa88e964b89e4185147fc791381d8366b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/Utils" 
	@${RM} ${OBJECTDIR}/source/Utils/convert_to_string.o.d 
	@${RM} ${OBJECTDIR}/source/Utils/convert_to_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/Utils/convert_to_string.o.d" -o ${OBJECTDIR}/source/Utils/convert_to_string.o source/Utils/convert_to_string.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/Utils/stream.o: source/Utils/stream.c  .generated_files/flags/default/bedba779e2c99d174dd7ef04f546e51aa020c772 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/Utils" 
	@${RM} ${OBJECTDIR}/source/Utils/stream.o.d 
	@${RM} ${OBJECTDIR}/source/Utils/stream.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/Utils/stream.o.d" -o ${OBJECTDIR}/source/Utils/stream.o source/Utils/stream.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/main.o: source/main.c  .generated_files/flags/default/40542178dcbb353dd552327bf5abbce0028662b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/main.o.d" -o ${OBJECTDIR}/source/main.o source/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o: source/FreeRTOS-Kernel/queue.c  .generated_files/flags/default/30029a2d165be05d98a9092cd27a50c4699c3577 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o source/FreeRTOS-Kernel/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o: source/FreeRTOS-Kernel/stream_buffer.c  .generated_files/flags/default/bfc8b6328439b3e2a33df8bcd5e3ef0aec84a8ce .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o source/FreeRTOS-Kernel/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o: source/FreeRTOS-Kernel/tasks.c  .generated_files/flags/default/eb91d71c9a497787fe21a2e3fe33489ee071a92b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o source/FreeRTOS-Kernel/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o: source/FreeRTOS-Kernel/timers.c  .generated_files/flags/default/7129469c308bf0c16ca77c917aa706ddc7d71940 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o source/FreeRTOS-Kernel/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/list.o: source/FreeRTOS-Kernel/list.c  .generated_files/flags/default/5cf420a258f46a3a6a28c28e50fe35d28f17e7e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o source/FreeRTOS-Kernel/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o: source/FreeRTOS-Kernel/event_groups.c  .generated_files/flags/default/9d5d57d56d4eb4e02752569bd7abac24e4ef9a12 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o source/FreeRTOS-Kernel/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o: source/FreeRTOS-Kernel/croutine.c  .generated_files/flags/default/4e9ccd4a05d2939c782f877f817755b23f794bca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o source/FreeRTOS-Kernel/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o: source/FreeRTOS-Kernel/portable/MemMang/heap_4.c  .generated_files/flags/default/de93d4db8802ca22ac356e6e0186b383bce09e2a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_4.o source/FreeRTOS-Kernel/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port.c  .generated_files/flags/default/1093429a0ea73d3c3acca84a2c00f7e7cb8cebf8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o source/FreeRTOS-Kernel/portable/PIC32MZ/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_monitor.o: source/task_monitor.c  .generated_files/flags/default/c43b7166c87868b2fc17f424b307a845f2bb8ba6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_monitor.o.d 
	@${RM} ${OBJECTDIR}/source/task_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/Utils" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_monitor.o.d" -o ${OBJECTDIR}/source/task_monitor.o source/task_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
