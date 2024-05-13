module pc(
    input clk_i, 
    input rstn_i, 

    input inc_i,

    output[3:0] pc_o);

reg[3:0] pc;

always @ (negedge clk_i, negedge rstn_i) begin
    if(!rstn_i) begin
        pc <= 4'b0;
    end else if(inc_i) begin
        pc <= pc_o + 1;
    end
end

assign pc_o = pc;

endmodule
