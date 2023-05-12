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
ifeq "$(wildcard nbproject/Makefile-local-MA330048_dsPIC33CK_DPPIM.mk)" "nbproject/Makefile-local-MA330048_dsPIC33CK_DPPIM.mk"
include nbproject/Makefile-local-MA330048_dsPIC33CK_DPPIM.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=MA330048_dsPIC33CK_DPPIM
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/dspic33ck-power-pwm-complementary.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/dspic33ck-power-pwm-complementary.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=sources/drivers/p33c_pwm.c mcc_generated_files/reset.c mcc_generated_files/tmr1.c mcc_generated_files/system.c mcc_generated_files/clock.c mcc_generated_files/traps.c mcc_generated_files/interrupt_manager.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/adc1.c mcc_generated_files/uart1.c main.c sources/pwm_init.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/sources/drivers/p33c_pwm.o ${OBJECTDIR}/mcc_generated_files/reset.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/main.o ${OBJECTDIR}/sources/pwm_init.o
POSSIBLE_DEPFILES=${OBJECTDIR}/sources/drivers/p33c_pwm.o.d ${OBJECTDIR}/mcc_generated_files/reset.o.d ${OBJECTDIR}/mcc_generated_files/tmr1.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/traps.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/adc1.o.d ${OBJECTDIR}/mcc_generated_files/uart1.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/sources/pwm_init.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/sources/drivers/p33c_pwm.o ${OBJECTDIR}/mcc_generated_files/reset.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/main.o ${OBJECTDIR}/sources/pwm_init.o

# Source Files
SOURCEFILES=sources/drivers/p33c_pwm.c mcc_generated_files/reset.c mcc_generated_files/tmr1.c mcc_generated_files/system.c mcc_generated_files/clock.c mcc_generated_files/traps.c mcc_generated_files/interrupt_manager.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/adc1.c mcc_generated_files/uart1.c main.c sources/pwm_init.c



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
	${MAKE}  -f nbproject/Makefile-MA330048_dsPIC33CK_DPPIM.mk ${DISTDIR}/dspic33ck-power-pwm-complementary.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33CK256MP506
MP_LINKER_FILE_OPTION=,--script=p33CK256MP506.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/sources/drivers/p33c_pwm.o: sources/drivers/p33c_pwm.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/6cf6f0a1620ad063992e3556ee891cd816ee961c .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/drivers" 
	@${RM} ${OBJECTDIR}/sources/drivers/p33c_pwm.o.d 
	@${RM} ${OBJECTDIR}/sources/drivers/p33c_pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/drivers/p33c_pwm.c  -o ${OBJECTDIR}/sources/drivers/p33c_pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/drivers/p33c_pwm.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/reset.o: mcc_generated_files/reset.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/66ef63282a2197dd8d0a18609bafe39c87121380 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/reset.c  -o ${OBJECTDIR}/mcc_generated_files/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/reset.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/6835973913956618bb5b86a3efc93d4d2fce8569 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/4e2925ba88b9d786a66ddf3344978a89e90b97dd .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/d937103f82e651a022bdb881c0560712a2a2ee41 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/dc2b7204540f4a8a7cfda62ac9ad18f711004f89 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/28ab4bfb69d6754130ad626cea2976d39d737c57 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/f772a1f5ddcc79c7c39a7c9e5f512606040c8ec7 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/ecc9d385e14c61988df7e90bdb10a81df6c827f5 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/4d7e77f77827c5ee61fa2851b341f9d237f70c56 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/5f8e76a444ecb853feea14434c9db243f36ddeff .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/be262835534a00ca65dac1baf4d2a753a98ed045 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/pwm_init.o: sources/pwm_init.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/32db5666e7c4f67bc80b7148ee960bc33563a19e .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources" 
	@${RM} ${OBJECTDIR}/sources/pwm_init.o.d 
	@${RM} ${OBJECTDIR}/sources/pwm_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/pwm_init.c  -o ${OBJECTDIR}/sources/pwm_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/pwm_init.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/sources/drivers/p33c_pwm.o: sources/drivers/p33c_pwm.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/fddfc542b5e6c8462a3a78aa54cf1e9afd5ef71b .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources/drivers" 
	@${RM} ${OBJECTDIR}/sources/drivers/p33c_pwm.o.d 
	@${RM} ${OBJECTDIR}/sources/drivers/p33c_pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/drivers/p33c_pwm.c  -o ${OBJECTDIR}/sources/drivers/p33c_pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/drivers/p33c_pwm.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/reset.o: mcc_generated_files/reset.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/5d173b88e9e34432c3f7a8342996742741592b13 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/reset.c  -o ${OBJECTDIR}/mcc_generated_files/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/reset.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/bbb30b03177b75219e9fe01512c3a549580d70a0 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/be45cc7530b10b4886b2d253053837f732512787 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/1458c7c851f496f89634efee862ffae819fa9032 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/b4335c27e901bcd4f5254d55f268df4d4ba631af .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/5084efdf3ab3a9a7c0ca4147919ef9f5509fd986 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/9def566365964587f80dcd8fd526df0e5ff43e3f .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/86a9121401a055f2f32f3f8af4182d71054dd44c .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/50ca132f0a4e11c5668ddad1140fa772c2d8bea3 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/f60a92fb4b7bdf2e55a9918170c8da0d93f07119 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/60640a71193ec6c3ee9a6476135cbe65fe0f5755 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/sources/pwm_init.o: sources/pwm_init.c  .generated_files/flags/MA330048_dsPIC33CK_DPPIM/25aa4d76cdf775c61446e3802943e924a51b4df4 .generated_files/flags/MA330048_dsPIC33CK_DPPIM/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/sources" 
	@${RM} ${OBJECTDIR}/sources/pwm_init.o.d 
	@${RM} ${OBJECTDIR}/sources/pwm_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sources/pwm_init.c  -o ${OBJECTDIR}/sources/pwm_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/sources/pwm_init.o.d"      -mno-eds-warn  -g -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -O0 -I"C:/Program Files/Microchip/xc16/v1.50/support/dsPIC33C/h" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/dspic33ck-power-pwm-complementary.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/dspic33ck-power-pwm-complementary.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files"  -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/dspic33ck-power-pwm-complementary.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/dspic33ck-power-pwm-complementary.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -D__DM330029_R20__ -D__MA330048_dsPIC33CK_DPPIM__ -DXPRJ_MA330048_dsPIC33CK_DPPIM=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"sources" -I"mcc_generated_files" -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/dspic33ck-power-pwm-complementary.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
