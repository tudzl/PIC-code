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
MKDIR=mkdir -p
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
${OBJECTDIR}/sources/app/app_GUI.o: sources/app/app_GUI.c  .generated_files/flags/default/8f94aaed536ba7503222af6db57ac67dc79f61ee .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/app" 
	@${RM} ${OBJECTDIR}/sources/app/app_GUI.o.d 
	@${RM} ${OBJECTDIR}/sources/app/app_GUI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/app/app_GUI.c  -o ${OBJECTDIR}/sources/app/app_GUI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/app/app_GUI.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/app/app_HMI.o: sources/app/app_HMI.c  .generated_files/flags/default/89d8a28666e2d59aab2b46b8bd21fcd9ddab6a63 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/app" 
	@${RM} ${OBJECTDIR}/sources/app/app_HMI.o.d 
	@${RM} ${OBJECTDIR}/sources/app/app_HMI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/app/app_HMI.c  -o ${OBJECTDIR}/sources/app/app_HMI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/app/app_HMI.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/device/dev_button.o: sources/device/dev_button.c  .generated_files/flags/default/b8db3a7e406549ce8a2b566f5357a88d0bf32af4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/device" 
	@${RM} ${OBJECTDIR}/sources/device/dev_button.o.d 
	@${RM} ${OBJECTDIR}/sources/device/dev_button.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/device/dev_button.c  -o ${OBJECTDIR}/sources/device/dev_button.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/device/dev_button.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/device/dev_gui_comm.o: sources/device/dev_gui_comm.c  .generated_files/flags/default/665504767244958d3b16007a223a587cc1e21417 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/device" 
	@${RM} ${OBJECTDIR}/sources/device/dev_gui_comm.o.d 
	@${RM} ${OBJECTDIR}/sources/device/dev_gui_comm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/device/dev_gui_comm.c  -o ${OBJECTDIR}/sources/device/dev_gui_comm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/device/dev_gui_comm.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o: sources/driver/power_controller/drv_pwrctrl_4SWBB.c  .generated_files/flags/default/c28aa7ab6551dc055e6abc0e6c388f9325f29864 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o: sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.c  .generated_files/flags/default/42263fae33bcaf4915463368b36ec206448a8781 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o: sources/driver/power_controller/Controller_pwrctrl_4SWBB.c  .generated_files/flags/default/b9d26b7560e716e29a7caf959e3e7becddd30ad1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/Controller_pwrctrl_4SWBB.c  -o ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o: sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.c  .generated_files/flags/default/a5bfa1ab0151221882c13f6fe67cbaca82b2fad2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/drv_adc.o: sources/driver/drv_adc.c  .generated_files/flags/default/c279b2209e12cac29decd411578dcb7b268c4393 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver" 
	@${RM} ${OBJECTDIR}/sources/driver/drv_adc.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/drv_adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/drv_adc.c  -o ${OBJECTDIR}/sources/driver/drv_adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/drv_adc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/drv_led.o: sources/driver/drv_led.c  .generated_files/flags/default/bdb3b99e7f90d4cfc4e174dabf493cd34b307248 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver" 
	@${RM} ${OBJECTDIR}/sources/driver/drv_led.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/drv_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/drv_led.c  -o ${OBJECTDIR}/sources/driver/drv_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/drv_led.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/reset.o: mcc_generated_files/reset.c  .generated_files/flags/default/430fd109d0bf89c08dbff1d07a45c2c7d8c7e12e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/reset.c  -o ${OBJECTDIR}/mcc_generated_files/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/reset.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/f5a0fd46ea380f516ea4eb761cff8b4c01350e6f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pwm.o: mcc_generated_files/pwm.c  .generated_files/flags/default/96254424eb06c0690408d77a1d0a486aa74d8da8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pwm.c  -o ${OBJECTDIR}/mcc_generated_files/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pwm.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/4be1e719e2f01757a9c291eb214fb6aa17f5dbb9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/default/d290108d751a5ffaa9e60bcc127185c0683a986c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/964b3ff864403f38d0b2c37267e16020ca0ad3b1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp3.o: mcc_generated_files/cmp3.c  .generated_files/flags/default/7567a982a05a7142e4088fa8529e9e1c9a3364af .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp3.c  -o ${OBJECTDIR}/mcc_generated_files/cmp3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp3.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/20bd658d884d4c3d58d3a268d7ea82a21f9196b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/a399e2b25506292f517a50b438956df65f986120 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/default/a944a326acb01dfa93fbc83fc2d765c4ee44607f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/22f7d2fc0ef9e1f07ac386a606af73f73ccf2959 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/73cb737701413fb603499910f79ec72f3d65d0e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp1.o: mcc_generated_files/cmp1.c  .generated_files/flags/default/d143fdfbdebbc311032e559801bf27b03f64d171 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp1.c  -o ${OBJECTDIR}/mcc_generated_files/cmp1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp2.o: mcc_generated_files/cmp2.c  .generated_files/flags/default/e16d6943b2c1cf836a98fec007883c273061047e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp2.c  -o ${OBJECTDIR}/mcc_generated_files/cmp2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clc1.o: mcc_generated_files/clc1.c  .generated_files/flags/default/975c2afbfbc9b6bfd1e29a2d1f38a52c398be8e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clc1.c  -o ${OBJECTDIR}/mcc_generated_files/clc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clc1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/misc/fault_common.o: sources/misc/fault_common.c  .generated_files/flags/default/bdfdb7ffda039d82a134fbe50794b82e6f12fb0c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/misc" 
	@${RM} ${OBJECTDIR}/sources/misc/fault_common.o.d 
	@${RM} ${OBJECTDIR}/sources/misc/fault_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/misc/fault_common.c  -o ${OBJECTDIR}/sources/misc/fault_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/misc/fault_common.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os.o: sources/os/os.c  .generated_files/flags/default/c3411e0b35c6c6fa1c4fddd1dcff65630d4218f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os.c  -o ${OBJECTDIR}/sources/os/os.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_scheduler_100us.o: sources/os/os_scheduler_100us.c  .generated_files/flags/default/5cdf798ce4f2ca98739166ab03db54d429086ee1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_100us.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_100us.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_scheduler_100us.c  -o ${OBJECTDIR}/sources/os/os_scheduler_100us.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_scheduler_100us.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_scheduler_1ms.o: sources/os/os_scheduler_1ms.c  .generated_files/flags/default/b83d64271bf745773a4ad68e889df8d3e1b5c2ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_1ms.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_scheduler_1ms.c  -o ${OBJECTDIR}/sources/os/os_scheduler_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_scheduler_1ms.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_timer.o: sources/os/os_timer.c  .generated_files/flags/default/fd9eda7f935027f00e5707ddbcc75e695b2fca01 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_timer.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_timer.c  -o ${OBJECTDIR}/sources/os/os_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_timer.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/f7810d1736fe8e096736ec722382629e5d4d87f1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main_tasks.o: main_tasks.c  .generated_files/flags/default/fb46f2ac57e49356322bb5a21bc22523863df9f4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_tasks.o.d 
	@${RM} ${OBJECTDIR}/main_tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main_tasks.c  -o ${OBJECTDIR}/main_tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main_tasks.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/sources/app/app_GUI.o: sources/app/app_GUI.c  .generated_files/flags/default/12d22d734253888db2a3b769fa5065d45243a3b4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/app" 
	@${RM} ${OBJECTDIR}/sources/app/app_GUI.o.d 
	@${RM} ${OBJECTDIR}/sources/app/app_GUI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/app/app_GUI.c  -o ${OBJECTDIR}/sources/app/app_GUI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/app/app_GUI.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/app/app_HMI.o: sources/app/app_HMI.c  .generated_files/flags/default/db378c4c21a51480bc49224c6ac81e9d87660940 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/app" 
	@${RM} ${OBJECTDIR}/sources/app/app_HMI.o.d 
	@${RM} ${OBJECTDIR}/sources/app/app_HMI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/app/app_HMI.c  -o ${OBJECTDIR}/sources/app/app_HMI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/app/app_HMI.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/device/dev_button.o: sources/device/dev_button.c  .generated_files/flags/default/84d19cab6473b682a26f8f2cb1ce2ecf733c6678 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/device" 
	@${RM} ${OBJECTDIR}/sources/device/dev_button.o.d 
	@${RM} ${OBJECTDIR}/sources/device/dev_button.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/device/dev_button.c  -o ${OBJECTDIR}/sources/device/dev_button.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/device/dev_button.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/device/dev_gui_comm.o: sources/device/dev_gui_comm.c  .generated_files/flags/default/c245da58040aa6ad89b32f647da952534a375958 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/device" 
	@${RM} ${OBJECTDIR}/sources/device/dev_gui_comm.o.d 
	@${RM} ${OBJECTDIR}/sources/device/dev_gui_comm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/device/dev_gui_comm.c  -o ${OBJECTDIR}/sources/device/dev_gui_comm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/device/dev_gui_comm.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o: sources/driver/power_controller/drv_pwrctrl_4SWBB.c  .generated_files/flags/default/47d73677f6efcef713fa043272f1fdbb3fd1bd0d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o: sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.c  .generated_files/flags/default/59f02eadd7d3e341cc70d063c46f01c87e149acd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_fault.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o: sources/driver/power_controller/Controller_pwrctrl_4SWBB.c  .generated_files/flags/default/9312c941ec6480dba9fbc812053d0bfa18cd74ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/Controller_pwrctrl_4SWBB.c  -o ${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/Controller_pwrctrl_4SWBB.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o: sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.c  .generated_files/flags/default/122c67041228d69070e3ac264d92fc5c2f7c853e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.c  -o ${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/power_controller/drv_pwrctrl_4SWBB_misc.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/drv_adc.o: sources/driver/drv_adc.c  .generated_files/flags/default/c5f5fae68d57e5dcb7caffb7e70583af05889ae0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver" 
	@${RM} ${OBJECTDIR}/sources/driver/drv_adc.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/drv_adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/drv_adc.c  -o ${OBJECTDIR}/sources/driver/drv_adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/drv_adc.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/drv_led.o: sources/driver/drv_led.c  .generated_files/flags/default/3ee58e1b462b3547e90ec55c1e561e1b080871bc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver" 
	@${RM} ${OBJECTDIR}/sources/driver/drv_led.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/drv_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/driver/drv_led.c  -o ${OBJECTDIR}/sources/driver/drv_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/driver/drv_led.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/reset.o: mcc_generated_files/reset.c  .generated_files/flags/default/71828266c7383074f9c828e67a754098dc01aa5e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/reset.c  -o ${OBJECTDIR}/mcc_generated_files/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/reset.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/ffba10964e8a48bbb71cecdc7b461c63d82af220 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pwm.o: mcc_generated_files/pwm.c  .generated_files/flags/default/8d4777a600b311ffb302e45390c8092c329bcb39 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pwm.c  -o ${OBJECTDIR}/mcc_generated_files/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pwm.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/61d6d0137815960d1e342d9d724d40063abf7fd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/default/b40a2a36ab7d1ffbea34bb3e9988e19fbad7234 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/8229e7c5c2f2f7b3cd65743593bdc5d45c02ba80 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp3.o: mcc_generated_files/cmp3.c  .generated_files/flags/default/c191de5462a5b073d7d4fedf83d804fc00a63556 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp3.c  -o ${OBJECTDIR}/mcc_generated_files/cmp3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp3.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/2f7f83467e8a10f268bd27880411d1f10b82ef17 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/69c965d58e40df64c97b9d20f658298680d32b66 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/default/fd20ccad54397da88fa6e31131d67f1d7c934a1c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/5d036f88ee16d0f895a3291028c39850fbfaa79 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/16ebe18be07ddfca8c454e4374d21215434955c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp1.o: mcc_generated_files/cmp1.c  .generated_files/flags/default/24b5feeca4141642cd6909c2cf39fa074aa4875a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp1.c  -o ${OBJECTDIR}/mcc_generated_files/cmp1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp1.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp2.o: mcc_generated_files/cmp2.c  .generated_files/flags/default/1ac7812ab85010ab0e7fcdf09402b7ef51592cde .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp2.c  -o ${OBJECTDIR}/mcc_generated_files/cmp2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp2.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clc1.o: mcc_generated_files/clc1.c  .generated_files/flags/default/c07bb4a2d2cc9528059e3c84ec14a184dabd04c2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clc1.c  -o ${OBJECTDIR}/mcc_generated_files/clc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clc1.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/misc/fault_common.o: sources/misc/fault_common.c  .generated_files/flags/default/a40593615326188b396cc6cf61235f560040c0ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/misc" 
	@${RM} ${OBJECTDIR}/sources/misc/fault_common.o.d 
	@${RM} ${OBJECTDIR}/sources/misc/fault_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/misc/fault_common.c  -o ${OBJECTDIR}/sources/misc/fault_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/misc/fault_common.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os.o: sources/os/os.c  .generated_files/flags/default/b9ca46fbc4a109b8f14476bd31d9c0c7f1346511 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os.c  -o ${OBJECTDIR}/sources/os/os.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_scheduler_100us.o: sources/os/os_scheduler_100us.c  .generated_files/flags/default/cf4043b37a8c04e1bc64601ebdc187ce22f21553 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_100us.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_100us.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_scheduler_100us.c  -o ${OBJECTDIR}/sources/os/os_scheduler_100us.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_scheduler_100us.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_scheduler_1ms.o: sources/os/os_scheduler_1ms.c  .generated_files/flags/default/2a2b0683769c509d9a8801f0387dfb3be1482eff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_1ms.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_scheduler_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_scheduler_1ms.c  -o ${OBJECTDIR}/sources/os/os_scheduler_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_scheduler_1ms.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/os/os_timer.o: sources/os/os_timer.c  .generated_files/flags/default/37c25506ca52d6b97effc66a6f0da3c7433c9d05 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/os" 
	@${RM} ${OBJECTDIR}/sources/os/os_timer.o.d 
	@${RM} ${OBJECTDIR}/sources/os/os_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/os/os_timer.c  -o ${OBJECTDIR}/sources/os/os_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/os/os_timer.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/3966b8ff91f70695f2485de60f469e269e7447b5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main_tasks.o: main_tasks.c  .generated_files/flags/default/251033452701efefdd2af66ceb58c0ba48dc50b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_tasks.o.d 
	@${RM} ${OBJECTDIR}/main_tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main_tasks.c  -o ${OBJECTDIR}/main_tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main_tasks.o.d"      -mno-eds-warn  -g -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -I"." -I"sources" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o: sources/driver/power_controller/smps_2p2z_dspic.s  .generated_files/flags/default/7f1bb8dd2e38edc7fac6778b96a8cb1697352cc5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  sources/driver/power_controller/smps_2p2z_dspic.s  -o ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o: sources/driver/power_controller/smps_3p3z_dspic.s  .generated_files/flags/default/249bf17bb196527842ceeee872ad18fde8f4bf9d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  sources/driver/power_controller/smps_3p3z_dspic.s  -o ${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o: sources/driver/power_controller/smps_2p2z_dspic.s  .generated_files/flags/default/2ba50db4149e003bcb58d195088a1a6b84189688 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/driver/power_controller" 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o.d 
	@${RM} ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  sources/driver/power_controller/smps_2p2z_dspic.s  -o ${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/sources/driver/power_controller/smps_2p2z_dspic.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/driver/power_controller/smps_3p3z_dspic.o: sources/driver/power_controller/smps_3p3z_dspic.s  .generated_files/flags/default/cc0e1a2ac277e8a41bedb028722a91301f05ea3f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DCURRENTMODE -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc16-bin2hex ${DISTDIR}/dspic33c-4swbb-acmc.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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
