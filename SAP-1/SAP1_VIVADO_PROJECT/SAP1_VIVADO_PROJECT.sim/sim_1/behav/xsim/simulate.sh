#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2022.2 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Thu May 02 17:34:46 CEST 2024
# SW Build 3671981 on Fri Oct 14 04:59:54 MDT 2022
#
# IP Build 3669848 on Fri Oct 14 08:30:02 MDT 2022
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim sap1_bench_behav -key {Behavioral:sim_1:Functional:sap1_bench} -tclbatch sap1_bench.tcl -view /home/leo_mrmd/Documents/SAPx_verilog/SAP-1/SAP1_VIVADO_PROJECT/sap1_bench_behav.wcfg -log simulate.log"
xsim sap1_bench_behav -key {Behavioral:sim_1:Functional:sap1_bench} -tclbatch sap1_bench.tcl -view /home/leo_mrmd/Documents/SAPx_verilog/SAP-1/SAP1_VIVADO_PROJECT/sap1_bench_behav.wcfg -log simulate.log

