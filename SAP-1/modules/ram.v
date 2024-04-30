module ram(
    input clk_i,
    input cen_i, 

    input[3:0] addr_i, 

    output[7:0] data_o);

reg[7:0] mem[0:15]; 

always @ (negedge cen_i) begin
    if (!cen_i) begin
        data_o <= mem[addr_i];
    end
end

endmodule