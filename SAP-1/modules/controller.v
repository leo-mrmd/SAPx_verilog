module controller(
    input clk_i, 
    input rstn_i, 

    input[4:0] opcode,

    output[11:0] ctrl_word);


localparam OP_LDA = 4'b0000;
localparam OP_ADD = 4'b0001;
localparam OP_SUB = 4'b0010;
localparam OP_HLT = 4'b1111;


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
always @ (posedge clk_i, negedge rstn_i) begin
    if (!rstn_i)
        ctrl_word <= 12'b0;
    else begin
        
    end
end

endmodule