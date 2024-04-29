module mar(
    input clk_i, 
    input rstn_i, 

    input[3:0] bus_i, 
    input ld_i, 

    output[3:0] addr_o);

always @ (posedge clk_i, negedge rstn_i) begin
    if (!rstn_i)
        addr_o <= 4'b0;
    else if (!ld_i) begin
        addr_o <= bus_i;
    end
end

endmodule