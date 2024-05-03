#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/leo_mrmd/Vitis/2022.2/bin:/home/leo_mrmd/Vivado/2022.2/ids_lite/ISE/bin/lin64:/home/leo_mrmd/Vivado/2022.2/bin
else
  PATH=/home/leo_mrmd/Vitis/2022.2/bin:/home/leo_mrmd/Vivado/2022.2/ids_lite/ISE/bin/lin64:/home/leo_mrmd/Vivado/2022.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/leo_mrmd/Documents/SAPx_verilog/SAP-1/SAP1_VIVADO_PROJECT/SAP1_VIVADO_PROJECT.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log sap1_top.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source sap1_top.tcl
