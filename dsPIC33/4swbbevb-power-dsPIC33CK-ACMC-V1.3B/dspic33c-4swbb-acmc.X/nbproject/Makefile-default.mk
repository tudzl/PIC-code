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
FINAL_IMAGE=${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=sources/app/app_GUI.c sources/app/app_HMI.c sources/device/dev_button.c sources/device/dev_gui_comm.c sources/driver/power_controller/drv_pwrctrl_4SWBB.c sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.c sources/driver/power_controller/Controller_pwrctrl_4SWBB.c sources/driver/power_controller/smps_2p2z_dspic.s sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.c sources/driver/power_controller/smps_3p3z_dspic.s sources/driver/drv_adc.c sources/driver/drv_led.c mcc_generated_files/reset.c mcc_generated_files/system.c mcc_generated_files/pwm.c mcc_generated_files/clock.c mcc_generated_files/adc1.c mcc_generated_files/interrupt_manager.c mcc_generated_files/cmp3.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr1.c mcc_generated_files/traps.c mcc_generated_files/uart1.c mcc_generated_files/cmp1.c mcc_generated_files/cmp2.c mcc_generated_files/clc1.c sources/misc/fault_common.c sources/os/os.c sources/os/os_scheduler_100us.c sources/os/os_scheduler_1ms.c sources/os/os_timer.c main.c main_tasks.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/sources/app/app_GUI.o ${OBJECTDIR}/sources/app/app_HMI.o ${OBJECTDIR}/sources/device/dev_button.o ${OBJECTDIR}/sources/device/dev_gui_comm.o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o ${OBJECTDIR}/sources/driver/drv_adc.o ${OBJECTDIR}/sources/driver/drv_led.o ${OBJECTDIR}/mcc_generated_files/reset.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/pwm.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/cmp3.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/cmp1.o ${OBJECTDIR}/mcc_generated_files/cmp2.o ${OBJECTDIR}/mcc_generated_files/clc1.o ${OBJECTDIR}/sources/misc/fault_common.o ${OBJECTDIR}/sources/os/os.o ${OBJECTDIR}/sources/os/os_scheduler_100us.o ${OBJECTDIR}/sources/os/os_scheduler_1ms.o ${OBJECTDIR}/sources/os/os_timer.o ${OBJECTDIR}/main.o ${OBJECTDIR}/main_tasks.o
POSSIBLE_DEPFILES=${OBJECTDIR}/sources/app/app_GUI.o.d ${OBJECTDIR}/sources/app/app_HMI.o.d ${OBJECTDIR}/sources/device/dev_button.o.d ${OBJECTDIR}/sources/device/dev_gui_comm.o.d ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o.d ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o.d ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o.d ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o.d ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o.d ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o.d ${OBJECTDIR}/sources/driver/drv_adc.o.d ${OBJECTDIR}/sources/driver/drv_led.o.d ${OBJECTDIR}/mcc_generated_files/reset.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/pwm.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/adc1.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/cmp3.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/tmr1.o.d ${OBJECTDIR}/mcc_generated_files/traps.o.d ${OBJECTDIR}/mcc_generated_files/uart1.o.d ${OBJECTDIR}/mcc_generated_files/cmp1.o.d ${OBJECTDIR}/mcc_generated_files/cmp2.o.d ${OBJECTDIR}/mcc_generated_files/clc1.o.d ${OBJECTDIR}/sources/misc/fault_common.o.d ${OBJECTDIR}/sources/os/os.o.d ${OBJECTDIR}/sources/os/os_scheduler_100us.o.d ${OBJECTDIR}/sources/os/os_scheduler_1ms.o.d ${OBJECTDIR}/sources/os/os_timer.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/main_tasks.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/sources/app/app_GUI.o ${OBJECTDIR}/sources/app/app_HMI.o ${OBJECTDIR}/sources/device/dev_button.o ${OBJECTDIR}/sources/device/dev_gui_comm.o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o ${OBJECTDIR}/sources/driver/drv_adc.o ${OBJECTDIR}/sources/driver/drv_led.o ${OBJECTDIR}/mcc_generated_files/reset.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/pwm.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/cmp3.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/cmp1.o ${OBJECTDIR}/mcc_generated_files/cmp2.o ${OBJECTDIR}/mcc_generated_files/clc1.o ${OBJECTDIR}/sources/misc/fault_common.o ${OBJECTDIR}/sources/os/os.o ${OBJECTDIR}/sources/os/os_scheduler_100us.o ${OBJECTDIR}/sources/os/os_scheduler_1ms.o ${OBJECTDIR}/sources/os/os_timer.o ${OBJECTDIR}/main.o ${OBJECTDIR}/main_tasks.o

# Source Files
SOURCEFILES=sources/app/app_GUI.c sources/app/app_HMI.c sources/device/dev_button.c sources/device/dev_gui_comm.c sources/driver/power_controller/drv_pwrctrl_4SWBB.c sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.c sources/driver/power_controller/Controller_pwrctrl_4SWBB.c sources/driver/power_controller/smps_2p2z_dspic.s sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.c sources/driver/power_controller/smps_3p3z_dspic.s sources/driver/drv_adc.c sources/driver/drv_led.c mcc_generated_files/reset.c mcc_generated_files/system.c mcc_generated_files/pwm.c mcc_generated_files/clock.c mcc_generated_files/adc1.c mcc_generated_files/interrupt_manager.c mcc_generated_files/cmp3.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr1.c mcc_generated_files/traps.c mcc_generated_files/uart1.c mcc_generated_files/cmp1.c mcc_generated_files/cmp2.c mcc_generated_files/clc1.c sources/misc/fault_common.c sources/os/os.c sources/os/os_scheduler_100us.c sources/os/os_scheduler_1ms.c sources/os/os_timer.c main.c main_tasks.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33CK256MP506
MP_LINKER_FILE_OPTION=,--script=p33CK256MP506.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/sources/app/app_GUI.o: sources/app/app_GUI.c  .generated_files/flags/default/66a8d687cc0e9a0abb851fc90945beaeca58c8e9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/app" 
	@${RM} ${OBJECTDIR}/sources/app/app_GUI.o.d 
	@${RM} ${OBJECTDIR}/sources/app/app_GUI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/app/app_GUI.c  -o ${OBJECTDIR}/sources/app/app_GUI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/app/app_GUI.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/app/app_HMI.o: sources/app/app_HMI.c  .generated_files/flags/default/b24a2c55d483c644bbc519ba3cf066ba69b614e2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/app" 
	@${RM} ${OBJECTDIR}/sources/app/app_HMI.o.d 
	@${RM} ${OBJECTDIR}/sources/app/app_HMI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/app/app_HMI.c  -o ${OBJECTDIR}/sources/app/app_HMI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/app/app_HMI.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/device/dev_button.o: sources/device/dev_button.c  .generated_files/flags/default/321091a8d61a647e560ebe85411cf319fe4ef1d7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/device" 
	@${RM} ${OBJECTDIR}/sources/device/dev_button.o.d 
	@${RM} ${OBJECTDIR}/sources/device/dev_button.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/device/dev_button.c  -o ${OBJECTDIR}/sources/device/dev_button.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/device/dev_button.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/device/dev_gui_comm.o: sources/device/dev_gui_comm.c  .generated_files/flags/default/8009a8253352b797499f677b6c4826ea033b5dc9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/device" 
	@${RM} ${OBJECTDIR}/sources/device/dev_gui_comm.o.d 
	@${RM} ${OBJECTDIR}/sources/device/dev_gui_comm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/device/dev_gui_comm.c  -o ${OBJECTDIR}/sources/device/dev_gui_comm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/device/dev_gui_comm.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o: sources/driver/power_controller/drv_pwrctrl_4SWBB.c  .generated_files/flags/default/1473560c027fb3a36fe6c870d7e9f85b35cd2f05 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o: sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.c  .generated_files/flags/default/7fde2bf1caa9d8af732220ac795f4a8abaeb1f0f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o: sources/driver/power_controller/Controller_pwrctrl_4SWBB.c  .generated_files/flags/default/f34a48aedfbe0e2526ccbd3f9e2040d35c26a396 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/Controller_pwrctrl_4SWBB.c  -o ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o: sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.c  .generated_files/flags/default/9518e1cebf33f6db851bb481a0d9e11e0f4b066a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/drv_adc.o: sources/driver/drv_adc.c  .generated_files/flags/default/827674a55847fb387aa81c405c9ffb1df228b5a9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver" 
	@${RM} ${OBJECTDIR}/sources/driver/drv_adc.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/drv_adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/drv_adc.c  -o ${OBJECTDIR}/sources/driver/drv_adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/drv_adc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/drv_led.o: sources/driver/drv_led.c  .generated_files/flags/default/c55165588570f290c69744a92d854ad4f5477890 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver" 
	@${RM} ${OBJECTDIR}/sources/driver/drv_led.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/drv_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/drv_led.c  -o ${OBJECTDIR}/sources/driver/drv_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/drv_led.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/reset.o: mcc_generated_files/reset.c  .generated_files/flags/default/1fbcd2a53e262601ac8ed16fc93ef804df31f594 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/reset.c  -o ${OBJECTDIR}/mcc_generated_files/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/reset.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/43b8ae2a68d71c949fbf74d0f0769d3dc5a2dfce .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pwm.o: mcc_generated_files/pwm.c  .generated_files/flags/default/2883bd39734fecd3bbd2398b9e7c24f7db22fe01 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pwm.c  -o ${OBJECTDIR}/mcc_generated_files/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pwm.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/e95d9dcd25c5d7d0861a4680cd38d39756303ec3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/default/7aa7689663de59e7149ad7bcfc479f82a8820e9c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/11da6ef475ef32fedbe2cee032b1166c45c8aef1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp3.o: mcc_generated_files/cmp3.c  .generated_files/flags/default/568870061e1ea6ef95be81e277e66b41331c2376 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp3.c  -o ${OBJECTDIR}/mcc_generated_files/cmp3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp3.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/3c08c5d47c129257076e0cb38af9e66171e7391b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/701f9061c36ec1f1bcd43f07093add7421bed03d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/default/7bc449880333241300891def04c55ccb5d2c5877 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/14fa87fa06236f404d4c901a196ee84a305347b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/f70b6a409371e435e2d485958a66ca72a074394b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp1.o: mcc_generated_files/cmp1.c  .generated_files/flags/default/5c8174f5c2fe2415804861eac04944613b41e307 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp1.c  -o ${OBJECTDIR}/mcc_generated_files/cmp1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp2.o: mcc_generated_files/cmp2.c  .generated_files/flags/default/f2b9e457ea60bec284387358cb7a0e102bef0871 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp2.c  -o ${OBJECTDIR}/mcc_generated_files/cmp2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clc1.o: mcc_generated_files/clc1.c  .generated_files/flags/default/e8c4e96b03554bfa965cb2be5d10237f15676ed7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clc1.c  -o ${OBJECTDIR}/mcc_generated_files/clc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clc1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/misc/fault_common.o: sources/misc/fault_common.c  .generated_files/flags/default/3c54200ca1b11ab136ddaaf16241658a6773b61 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/misc" 
	@${RM} ${OBJECTDIR}/sources/misc/fault_common.o.d 
	@${RM} ${OBJECTDIR}/sources/misc/fault_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/misc/fault_common.c  -o ${OBJECTDIR}/sources/misc/fault_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/misc/fault_common.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os.o: sources/os/os.c  .generated_files/flags/default/b8ba3f6c9f6bc96d8ccbabc769d7e186bc9fe75a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os.c  -o ${OBJECTDIR}/sources/os/os.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_scheduler_100us.o: sources/os/os_scheduler_100us.c  .generated_files/flags/default/c2e98eca2b8588bb433e1059dc85e41b02f00f3e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_100us.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_100us.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_scheduler_100us.c  -o ${OBJECTDIR}/sources/os/os_scheduler_100us.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_scheduler_100us.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_scheduler_1ms.o: sources/os/os_scheduler_1ms.c  .generated_files/flags/default/b97918cce5ca00edb31c9966469ebbe32ba502c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_1ms.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_scheduler_1ms.c  -o ${OBJECTDIR}/sources/os/os_scheduler_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_scheduler_1ms.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_timer.o: sources/os/os_timer.c  .generated_files/flags/default/22c2010407b4630675db2da6e62a998005ae6a96 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_timer.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_timer.c  -o ${OBJECTDIR}/sources/os/os_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_timer.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/bed5504ae6684f17737609f0735acd1cba992821 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main_tasks.o: main_tasks.c  .generated_files/flags/default/e4e713356222434aa031ea9350cf395cec622210 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_tasks.o.d 
	@${RM} ${OBJECTDIR}/main_tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main_tasks.c  -o ${OBJECTDIR}/main_tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main_tasks.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/sources/app/app_GUI.o: sources/app/app_GUI.c  .generated_files/flags/default/2c3fe9f356fff1afd9da05f8e058d516b871a2ba .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/app" 
	@${RM} ${OBJECTDIR}/sources/app/app_GUI.o.d 
	@${RM} ${OBJECTDIR}/sources/app/app_GUI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/app/app_GUI.c  -o ${OBJECTDIR}/sources/app/app_GUI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/app/app_GUI.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/app/app_HMI.o: sources/app/app_HMI.c  .generated_files/flags/default/d5f3d28d9723bca01ea14d945367d434c4af9755 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/app" 
	@${RM} ${OBJECTDIR}/sources/app/app_HMI.o.d 
	@${RM} ${OBJECTDIR}/sources/app/app_HMI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/app/app_HMI.c  -o ${OBJECTDIR}/sources/app/app_HMI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/app/app_HMI.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/device/dev_button.o: sources/device/dev_button.c  .generated_files/flags/default/2c3e2148648e5a15000ef2f7af12c2d01c119edf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/device" 
	@${RM} ${OBJECTDIR}/sources/device/dev_button.o.d 
	@${RM} ${OBJECTDIR}/sources/device/dev_button.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/device/dev_button.c  -o ${OBJECTDIR}/sources/device/dev_button.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/device/dev_button.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/device/dev_gui_comm.o: sources/device/dev_gui_comm.c  .generated_files/flags/default/bc2e6085e714f54a22e9c74744ea8918f45ea0f0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/device" 
	@${RM} ${OBJECTDIR}/sources/device/dev_gui_comm.o.d 
	@${RM} ${OBJECTDIR}/sources/device/dev_gui_comm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/device/dev_gui_comm.c  -o ${OBJECTDIR}/sources/device/dev_gui_comm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/device/dev_gui_comm.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o: sources/driver/power_controller/drv_pwrctrl_4SWBB.c  .generated_files/flags/default/26da210e4b6e56158b6e7209f94e160fc277083f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o: sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.c  .generated_files/flags/default/1d76bf8c07a16e4165bdaba55c2bde446796401a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o: sources/driver/power_controller/Controller_pwrctrl_4SWBB.c  .generated_files/flags/default/4ab6d5ef91f0113afc6352ee123dd4cbc39b85 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/Controller_pwrctrl_4SWBB.c  -o ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o: sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.c  .generated_files/flags/default/7bbe9874589c8a249f930936f6d949b6987deec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/drv_adc.o: sources/driver/drv_adc.c  .generated_files/flags/default/7b8742fcc39437ae4ffb267c990c2f51a1185f54 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver" 
	@${RM} ${OBJECTDIR}/sources/driver/drv_adc.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/drv_adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/drv_adc.c  -o ${OBJECTDIR}/sources/driver/drv_adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/drv_adc.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/drv_led.o: sources/driver/drv_led.c  .generated_files/flags/default/2d7fb0a6c75865fb16dbf26d73ee4bed60aa621f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver" 
	@${RM} ${OBJECTDIR}/sources/driver/drv_led.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/drv_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/drv_led.c  -o ${OBJECTDIR}/sources/driver/drv_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/drv_led.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/reset.o: mcc_generated_files/reset.c  .generated_files/flags/default/7eef7a53afa8349bd33ca1e17eca78da4347acd4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/reset.c  -o ${OBJECTDIR}/mcc_generated_files/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/reset.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/ce1f234f3094560a09d10772188a8321fb9563a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pwm.o: mcc_generated_files/pwm.c  .generated_files/flags/default/fe930f80562941d5363d96436c89338e087a026 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pwm.c  -o ${OBJECTDIR}/mcc_generated_files/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pwm.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/44c705802d5120952f2ab8a94e55a574756d5e8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/default/22c2f7b5c78978a25308245e01732baaf9865183 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/a09cf2738445c31345a0c13f6402999a1e38f65b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp3.o: mcc_generated_files/cmp3.c  .generated_files/flags/default/840f462f7021a1ca090b619d5fa921256631c105 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp3.c  -o ${OBJECTDIR}/mcc_generated_files/cmp3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp3.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/506a4b700bec65ad278c03460a4ec45070ae761e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/3bdc6acfde0fa63c0f1a0fc1d6b9e2c6cfc1fe35 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/default/5dc10e907217dfe2136b941559d542eae55079ab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/cc000de99498fab9dbfffa0a139b8ade99a068aa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/78374e08c0a9aefe6eb31a49aaf76d60d43f135e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp1.o: mcc_generated_files/cmp1.c  .generated_files/flags/default/6400473e09b1cee36127dbe0a78ed0e74bfa7d44 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp1.c  -o ${OBJECTDIR}/mcc_generated_files/cmp1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp1.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp2.o: mcc_generated_files/cmp2.c  .generated_files/flags/default/8846dd453d5c95776b3bbbd03b0aedb703356894 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp2.c  -o ${OBJECTDIR}/mcc_generated_files/cmp2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp2.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clc1.o: mcc_generated_files/clc1.c  .generated_files/flags/default/31fd1c191ccc7c9d79d751164be06a96a3a07fb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clc1.c  -o ${OBJECTDIR}/mcc_generated_files/clc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clc1.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/misc/fault_common.o: sources/misc/fault_common.c  .generated_files/flags/default/68f67d67dd38fa1dc71d03ca9dddd907099d2aa7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/misc" 
	@${RM} ${OBJECTDIR}/sources/misc/fault_common.o.d 
	@${RM} ${OBJECTDIR}/sources/misc/fault_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/misc/fault_common.c  -o ${OBJECTDIR}/sources/misc/fault_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/misc/fault_common.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os.o: sources/os/os.c  .generated_files/flags/default/d7b06c7302d9f76a71cf3d1fea0dd997eaa5d70 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os.c  -o ${OBJECTDIR}/sources/os/os.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_scheduler_100us.o: sources/os/os_scheduler_100us.c  .generated_files/flags/default/9e1a6698d298d60a6893f8e3c0c6c107bd2be543 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_100us.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_100us.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_scheduler_100us.c  -o ${OBJECTDIR}/sources/os/os_scheduler_100us.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_scheduler_100us.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_scheduler_1ms.o: sources/os/os_scheduler_1ms.c  .generated_files/flags/default/6944c0140c635cc0d96d7112a5f80ab273440f75 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_1ms.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_scheduler_1ms.c  -o ${OBJECTDIR}/sources/os/os_scheduler_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_scheduler_1ms.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_timer.o: sources/os/os_timer.c  .generated_files/flags/default/7a92666bdef83005df38aa6e864ad56eba8a1369 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_timer.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_timer.c  -o ${OBJECTDIR}/sources/os/os_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_timer.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/6590d7d3cd84549e6e32f6b9eb9184b7d7688392 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main_tasks.o: main_tasks.c  .generated_files/flags/default/d794a297a38a8e0ee0c3c87220210253c28d1bd7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_tasks.o.d 
	@${RM} ${OBJECTDIR}/main_tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main_tasks.c  -o ${OBJECTDIR}/main_tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main_tasks.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o: sources/driver/power_controller/smps_2p2z_dspic.s  .generated_files/flags/default/7f34167fb4b88f068db74ead503d93b2db4b95a9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  sources/driver/power_controller/smps_2p2z_dspic.s  -o ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o: sources/driver/power_controller/smps_3p3z_dspic.s  .generated_files/flags/default/7fc40664a373f9acc6f3441e26c8e7b4282264f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  sources/driver/power_controller/smps_3p3z_dspic.s  -o ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o: sources/driver/power_controller/smps_2p2z_dspic.s  .generated_files/flags/default/f67eb404a495b50fd5289134157c665f42a4378b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  sources/driver/power_controller/smps_2p2z_dspic.s  -o ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o: sources/driver/power_controller/smps_3p3z_dspic.s  .generated_files/flags/default/f9e33d51bff42d3d14d4c8176b4e5c62ae0d8d2e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  sources/driver/power_controller/smps_3p3z_dspic.s  -o ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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
