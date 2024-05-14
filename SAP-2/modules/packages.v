module package_opcodes();

// OPCODES. X stands for A, B or C register, Y to a byte parameter

// ADD X => Add the content of the X register to the Accumulator (A = A + X)
localparam OP_ADD_B      = 8'h80;
localparam OP_ADD_C      = 8'h81;
// ANA X  => Bitwise AND the Accumulator with the selected register
localparam OP_ANA_B      = 8'hA0; 
localparam OP_ANA_C      = 8'hA1;
// ANI Y => Bitwise AND the Accumulator and the Y byte (AND immediate)
localparam OP_ANI        = 8'hE6;
// CALL Y => Jump to the subroutine address Y while storing current Program Count to 0xFFFE and 0xFFFF
localparam OP_CALL       = 8'hCD;
// CMA => First complement the Accumulator (invert each bits)
localparam OP_CMA        = 8'h2F;
// DCR X => Decrement by 1 the X register
localparam OP_DCR_A      = 8'h3D;
localparam OP_DCR_B      = 8'h05;
localparam OP_DCR_C      = 8'h0D;
// HLT => Halt the program and stall the clock
localparam OP_HLT        = 8'h76;
// IN Y => Load the value of the Input Y port to the Accumulator
localparam OP_IN         = 8'hDB;
// INR X => Increment by 1 the X register
localparam OP_INR_A      = 8'h3C;
localparam OP_INR_B      = 8'h04;
localparam OP_INR_C      = 8'h0C;
// Conditional and unconditional jump to designated address
localparam OP_JM         = 8'hFA; // JM  Y => Jump tu Y if the Acc Sign Flag is set
localparam OP_JMP        = 8'hC3; // JMP Y => Jump to address Y
localparam OP_JNZ        = 8'hC2; // JNZ Y => Jumpt to Y if Acc Zero Flag is reset
localparam OP_JZ         = 8'hCA; // JZ  Y => Jump to Y if Acc Zero Flag is set
// LDA Y => Load the content of address Y to the Accumulator
localparam OP_LDA        = 8'h3A;
// MOV X Y => Move the content of Y into X register
localparam OP_MOV_A_B    = 8'h78; 
localparam OP_MOV_A_C    = 8'h79;
localparam OP_MOV_B_A    = 8'h47;
localparam OP_MOV_B_C    = 8'h41;
localparam OP_MOV_C_A    = 8'h4F;
localparam OP_MOV_C_B    = 8'h48;
// MVI X Y => Move Y into the X register (Move immediate)
localparam OP_MVI_A      = 8'h3E;
localparam OP_MVI_B      = 8'h06;
localparam OP_MVI_C      = 8'h0E;
// NOP => No operation
localparam OP_NOP        = 8'h00;
// ORA X => Bitwise OR the Accumalator and the X register
localparam OP_ORA_B      = 8'hB0;
localparam OP_ORA_C      = 8'hB1;
// ORI Y => Bitwise OR between the Accumulator and the Y byte (OR immediate)
localparam OP_ORI        = 8'hF6;
// OUT Y => Load the Accumulator to the Output Y port
localparam OP_OUT        = 8'hD3;
// RAL / RAR => Shift Register Left or Right with conservation
localparam OP_RAL        = 8'h17;
localparam OP_RAR        = 8'h1F;
// RET => Return to the address stored in 0xFFFE / 0xFFFF at the end of the subroutine
localparam OP_RET        = 8'hC9;
// STA Y => Store the value of the Accumulator to the Y address
localparam OP_STA        = 8'h32;
// SUB X => Substract the content of the X register from the Accumulator (i.e. A = A-X)
localparam OP_SUB_B      = 8'h90;
localparam OP_SUB_C      = 8'h91;
// XRA X => Bitwise XOR the Accumulator and the X register
localparam OP_XRA_B      = 8'hA8;
localparam OP_XRA_C      = 8'hA9;
// XRI Y => Bitwise XOR between the Accumulator and the Y byte (XOR immediate)
localparam OP_XRI        = 8'hEE;

endmodule

module package_t_states();

// Number of T States

localparam STATES_ADD_B      = 4;
localparam STATES_ADD_C      = 4;
localparam STATES_ANA_B      = 4; 
localparam STATES_ANA_C      = 4;
localparam STATES_ANI        = 7;
localparam STATES_CALL       = 18;
localparam STATES_CMA        = 4;
localparam STATES_DCR_A      = 4;
localparam STATES_DCR_B      = 4;
localparam STATES_DCR_C      = 4;
localparam STATES_HLT        = 5;
localparam STATES_IN         = 10;
localparam STATES_INR_A      = 4;
localparam STATES_INR_B      = 4;
localparam STATES_INR_C      = 4;
localparam STATES_JM         = 10; 
localparam STATES_JMP        = 10; 
localparam STATES_JNZ        = 10; 
localparam STATES_JZ         = 10; 
localparam STATES_LDA        = 13;
localparam STATES_MOV_A_B    = 4; 
localparam STATES_MOV_A_C    = 4;
localparam STATES_MOV_B_A    = 4;
localparam STATES_MOV_B_C    = 4;
localparam STATES_MOV_C_A    = 4;
localparam STATES_MOV_C_B    = 4;
localparam STATES_MVI_A      = 7;
localparam STATES_MVI_B      = 7;
localparam STATES_MVI_C      = 7;
localparam STATES_NOP        = 4;
localparam STATES_ORA_B      = 4;
localparam STATES_ORA_C      = 4;
localparam STATES_ORI        = 7;
localparam STATES_OUT        = 10;
localparam STATES_RAL        = 4;
localparam STATES_RAR        = 4;
localparam STATES_RET        = 10;
localparam STATES_STA        = 13;
localparam STATES_SUB_B      = 4;
localparam STATES_SUB_C      = 4;
localparam STATES_XRA_B      = 4;
localparam STATES_XRA_C      = 4;
localparam STATES_XRI        = 7;
endmodule

