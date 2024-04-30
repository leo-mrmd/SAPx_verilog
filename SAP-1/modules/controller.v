module controller(
    input clk_i, 
    input rstn_i, 

    input[4:0] opcode,

    output hlt_o,
    output[11:0] ctrl_word);


localparam OP_LDA = 4'b0000;
localparam OP_ADD = 4'b0001;
localparam OP_SUB = 4'b0010;
localparam OP_HLT = 4'b1111;

localparam INCR_PC      = 0;
localparam PC_EN        = 1;
localparam MAR_LOAD     = 2;
localparam RAM_EN       = 3;
localparam INSTR_LOAD   = 4;
localparam INSTR_EN     = 5;
localparam A_ACC_LOAD   = 6;
localparam A_ACC_EN     = 7;
localparam ADD_SUB_LOAD = 8;
localparam ADD_SUB_EN   = 9;
localparam B_REG_LOAD   = 10;
localparam OUT_REG_LOAD = 11;


// Two-processes FSM
reg[5:0] state

//One-hot state control. Might (should ?) replace that by a ring oscillator, but maybe it will be synth as one
always @ (negedge clk_i, negedge rstn_i) begin
    if (!rstn_i) 
        state <= 6'h01;//"000001";
    else begin
        if (state = 32) begin
            state <= 1;
        else
            state <= state*2;
        end
    end
end

// This is where the fun begins
always @ (*) begin
    if (!rstn_i)
        //ctrl_word <= 12'b0; // Replace that
        ctrl_word[INCR_PC]      = 1'b0;
        ctrl_word[PC_EN]        = 1'b0;
        ctrl_word[MAR_LOAD]     = 1'b1;
        ctrl_word[RAM_EN]       = 1'b1;
        ctrl_word[INSTR_LOAD]   = 1'b1;
        ctrl_word[INSTR_EN]     = 1'b1;
        ctrl_word[A_ACC_LOAD]   = 1'b1;
        ctrl_word[A_ACC_EN]     = 1'b0;
        ctrl_word[ADD_SUB_LOAD] = 1'b0;
        ctrl_word[ADD_SUB_EN]   = 1'b0;
        ctrl_word[B_REG_LOAD]   = 1'b1;
        ctrl_word[OUT_REG_LOAD] = 1'b1;

        hlt_o                   = 1'b1;
    else begin
        case (state)
            1:begin // Adress state
                ctrl_word[INCR_PC]      = 1'b0;
                ctrl_word[MAR_LOAD]     = 1'b0;
            end
            2:begin // Increment state
                ctrl_word[INCR_PC]      = 1'b1;
                ctrl_word[PC_EN]        = 1'b0;
                ctrl_word[MAR_LOAD]     = 1'b1;
            end
            3:begin // Memory state
                ctrl_word[INCR_PC]      = 1'b0;
                ctrl_word[RAM_EN]       = 1'b0;
                ctrl_word[INSTR_LOAD]   = 1'b0;
            end
            4:begin // 4th state
                case (opcode)
                    OP_LDA:begin
                        // De-activate previous state
                        ctrl_word[RAM_EN]       = 1'b1;
                        ctrl_word[INSTR_LOAD]   = 1'b1;
                        // Now the useful stuff
                        ctrl_word[MAR_LOAD]     = 1'b0;
                        ctrl_word[INSTR_EN]     = 1'b0;
                    end
                    OP_ADD:begin
                        // De-activate previous state
                        ctrl_word[RAM_EN]       = 1'b1;
                        ctrl_word[INSTR_LOAD]   = 1'b1;
                        // Now the useful stuff
                        ctrl_word[MAR_LOAD]     = 1'b0;
                        ctrl_word[INSTR_EN]     = 1'b0;
                    end
                    OP_SUB:begin
                        // De-activate previous state
                        ctrl_word[RAM_EN]       = 1'b1;
                        ctrl_word[INSTR_LOAD]   = 1'b1;
                        // Now the useful stuff
                        ctrl_word[MAR_LOAD]     = 1'b0;
                        ctrl_word[INSTR_EN]     = 1'b0;
                    end
                    OP_OUT:begin
                        // De-activate previous state
                        ctrl_word[RAM_EN]       = 1'b1;
                        ctrl_word[INSTR_LOAD]   = 1'b1;
                        // Now the useful stuff
                        ctrl_word[A_ACC_EN]     = 1'b1;
                        ctrl_word[OUT_REG_LOAD] = 1'b0;
                    end
                    OP_HLT:begin
                        // De-activate previous state
                        ctrl_word[RAM_EN]       = 1'b1;
                        ctrl_word[INSTR_LOAD]   = 1'b1;
                        // Now the useful stuff
                        hlt_o                   = 1'b0;
                    end
                endcase
            end
            5:begin // 5th state
                case (opcode)
                    OP_LDA:begin
                        // De-activate previous state
                        ctrl_word[MAR_LOAD]     = 1'b1;
                        ctrl_word[INSTR_EN]     = 1'b1;
                        // Now the usefull stuff
                        ctrl_word[RAM_EN]       = 1'b0;
                        ctrl_word[A_ACC_LOAD]   = 1'b0;
                    end
                    OP_ADD:begin
                        // De-activate previous state
                        ctrl_word[MAR_LOAD]     = 1'b1;
                        ctrl_word[INSTR_EN]     = 1'b1;
                        // Now the usefull stuff
                        ctrl_word[RAM_EN]       = 1'b0;
                        ctrl_word[B_REG_LOAD]   = 1'b0;
                    end
                    OP_SUB:begin
                        ctrl_word[MAR_LOAD]     = 1'b1;
                        ctrl_word[INSTR_EN]     = 1'b1;
                        // Now the usefull stuff
                        ctrl_word[RAM_EN]       = 1'b0;
                        ctrl_word[B_REG_LOAD]   = 1'b0;
                    end
                    OP_OUT:begin
                        // De-activate previous state
                        ctrl_word[A_ACC_EN]     = 1'b0;
                        ctrl_word[OUT_REG_LOAD] = 1'b1;
                        // Now the usefull stuff
                        // NOP state
                    end
                    OP_HLT:begin
                        // Void
                    end
                endcase
            end
            6:begin // 6th state
                case (opcode)
                    OP_LDA:begin
                        // De-activate previous state
                        ctrl_word[RAM_EN]       = 1'b1;
                        ctrl_word[A_ACC_LOAD]   = 1'b1;
                        // Now the usefull stuff
                        // Nothing, NOP state
                    end
                    OP_ADD:begin
                        // De-activate previous state
                            ctrl_word[RAM_EN]       = 1'b1;
                            ctrl_word[B_REG_LOAD]   = 1'b1;
                        // Now the usefull stuff
                            ctrl_word[ADD_SUB_LOAD] = 1'b1;
                            ctrl_word[A_ACC_LOAD]   = 1'b0;
                    end
                    OP_SUB:begin
                        // De-activate previous state
                            ctrl_word[RAM_EN]       = 1'b1;
                            ctrl_word[B_REG_LOAD]   = 1'b1;
                        // Now the usefull stuff
                            ctrl_word[ADD_SUB_LOAD] = 1'b1;
                            ctrl_word[ADD_SUB_EN]   = 1'b1;
                            ctrl_word[A_ACC_LOAD]   = 1'b0;
                    end
                    OP_OUT:begin
                        // NOP state
                    end
                    OP_HLT:begin
                        // Void
                    end
                endcase
            end
            default:begin
                ctrl_word[INCR_PC]      = 1'b0;
                ctrl_word[PC_EN]        = 1'b0;
                ctrl_word[MAR_LOAD]     = 1'b1;
                ctrl_word[RAM_EN]       = 1'b1;
                ctrl_word[INSTR_LOAD]   = 1'b1;
                ctrl_word[INSTR_EN]     = 1'b1;
                ctrl_word[A_ACC_LOAD]   = 1'b1;
                ctrl_word[A_ACC_EN]     = 1'b0;
                ctrl_word[ADD_SUB_LOAD] = 1'b0;
                ctrl_word[ADD_SUB_EN]   = 1'b0;
                ctrl_word[B_REG_LOAD]   = 1'b1;
                ctrl_word[OUT_REG_LOAD] = 1'b1;
            end
        endcase
    end
end

endmodule