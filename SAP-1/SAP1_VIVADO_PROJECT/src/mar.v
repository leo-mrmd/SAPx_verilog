module mar(
    input clk_i, 
    input rstn_i, 

    input[3:0] bus_i, 
    input ld_i, 

    output[3:0] addr_o);
    
 reg[3:0] addr_r;

always @ (posedge clk_i, negedge rstn_i) begin
    if (!rstn_i)
        addr_r <= 4'b0;
    else if (!ld_i) begin
        addr_r <= bus_i;
    end
end

assign addr_o = addr_r;

endmodule