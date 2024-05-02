// General purpose register, intend to use for accumulator A,B register, instruction register and output register
module register(
    input clk_i,
    input rstn_i,

    input ld_i, 
    input[7:0] bus_i,

    output[7:0] bus_o, 
    output[7:0] parallel_o);

reg[7:0] register; // Need to find a better name 

always @ (posedge clk_i, negedge rstn_i) begin
    if (!rstn_i)
        register <= 8'b0;
    else if (!ld_i) begin
        register <= bus_i;
    end
end

assign bus_o     [3:0] = register[4:0]; assign bus_o     [7:4] = 4'b0000;
assign parallel_o[7:4] = register[7:4]; assign parallel_o[7:4] = 4'b0000;

endmodule