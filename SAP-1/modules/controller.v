module controller(
    input clk_i, 
    input rstn_i, 

    input[4:0] opcode,

    output[11:0] ctrl_word);

// Two-processes FSM

reg[5:0] state

//One-hot state control
always @ (posedge clk_i, negedge rstn_i) begin
    if (!rstn_i) 
        state <= 6'h01;//"000001";
    else begin
        state <= state*2;
    end
end

// This is where the fun begins


endmodule