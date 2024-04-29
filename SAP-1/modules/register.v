// General purpose register, intend to use for both accumulator A and B register and instruction register
module register(
    input clk_i,
    input rstn_i,

    input ld_i, 
    input[7:0] bus_i,

    output[7:0] bus_o, 
    output[7:0] add_sub_o);

regr[7:0] registe; // Need to find a better name 

always @ (posedge clk_i, negedge rstn_i) begin
    if (!rstn_i)
        register <= 8'b0;
    else if (!ld_i) begin
        register <= bus_i;
    end
end

assign bus_o     = register;
assign add_sub_o = register;

endmodule