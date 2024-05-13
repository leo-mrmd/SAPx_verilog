module package();

// OPCODES. X stands for A, B or C register, Y to a byte parameter

// ADD X => Add the content of the X register to the Accumulator (A = A + X)
localparam ADD_B      = 8'h80;
localparam ADD_C      = 8'h81;
// ANA X  => Bitwise AND the Accumulator with the selected register
localparam ANA_B      = 8'hA0; 
localparam ANA_C      = 8'hA1;
// ANI Y => Bitwise AND the Accumulator and the Y byte (AND immediate)
localparam ANI        = 8'hE6;
// CALL Y => Jump to the subroutine address Y while storing current Program Count to 0xFFFE and 0xFFFF
localparam CALL       = 8'hCD;
// CMA => First complement the Accumulator (invert each bits)
localparam CMA        = 8'h2F;
// DCR X => Decrement by 1 the X register
localparam DCR_A      = 8'h3D;
localparam DCR_B      = 8'h05;
localparam DCR_C      = 8'h0D;
// HLT => Halt the program and stall the clock
localparam HLT        = 8'h76;
// IN Y => Load the value of the Input Y port to the Accumulator
localparam IN         = 8'hDB;
// INR X => Increment by 1 the X register
localparam INR_A      = 8'h3C;
localparam INR_B      = 8'h04;
localparam INR_C      = 8'h0C;
// Conditional and unconditional jump to designated address
localparam JM         = 8'hFA; // JM  Y => Jump tu Y if the Acc Sign Flag is set
localparam JMP        = 8'hC3; // JMP Y => Jump to address Y
localparam JNZ        = 8'hC2; // JNZ Y => Jumpt to Y if Acc Zero Flag is reset
localparam JZ         = 8'hCA; // JZ  Y => Jump to Y if Acc Zero Flag is set
localparam LDA        = 8'h3A;
// MOV X Y => Move the content of Y into X register
localparam MOV_A_B    = 8'h78; 
localparam MOV_A_C    = 8'h79;
localparam MOV_B_A    = 8'h47;
localparam MOV_B_C    = 8'h41;
localparam MOV_C_A    = 8'h4F;
localparam MOV_C_B    = 8'h48;
localparam MVI_A      = 8'h3E;
localparam MVI_B      = 8'h06;
localparam MVI_C      = 8'h0E;
// NOP => No operation
localparam NOP        = 8'h00;
// ORA X => Bitwise OR the Accumalator and the X register
localparam ORA_B      = 8'hB0;
localparam ORA_C      = 8'hB1;
// ORI Y => Bitwise OR between the Accumulator and the Y byte (OR immediate)
localparam ORI        = 8'hF6;
// OUT Y => Load the Accumulator to the Output Y port
localparam OUT        = 8'hD3;
// RAL / RAR => Shift Register Left or Right with conservation
localparam RAL        = 8'h17;
localparam RAR        = 8'h1F;
// RET => Return to the address stored in 0xFFFE / 0xFFFF at the end of the subroutine
localparam RET        = 8'hC9;
localparam STA        = 8'h32;
// SUB X => Substract the content of the X register from the Accumulator (i.e. A = A-X)
localparam SUB_B      = 8'h90;
localparam SUB_C      = 8'h91;
// XRA X => Bitwise XOR the Accumulator and the X register
localparam XRA_B      = 8'hA8;
localparam XRA_C      = 8'hA9;
// XRI Y => Bitwise XOR between the Accumulator and the Y byte (XOR immediate)
localparam XRI        = 8'hEE;


endmodule
