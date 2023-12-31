@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Jul 27 15:17:28 +0530 2022
REM SW Build 2258646 on Thu Jun 14 20:03:12 MDT 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
call xsim sim_nanoprocessor_with_7_segment_display_behav -key {Behavioral:sim_1:Functional:sim_nanoprocessor_with_7_segment_display} -tclbatch sim_nanoprocessor_with_7_segment_display.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
