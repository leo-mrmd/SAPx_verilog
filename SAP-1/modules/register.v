// General purpose register, intend to use for both accumulator A and B register
module register(
    input clk_i,
    input rstn_i,

    input ld_i, 
    input bus_i[7:0],

    output bus_o[7:0], 
    output add_sub_o[7:0]);

reg register[7:0]; // Need to find a better name 

always @ (posedge clk_i, negedge rstn_i) begin
    if (!rstn_i)
        register <= 8'b0;
    else if (!ld_i)
        register <= bus_i;
    end
end

assign bus_o     = register;
assign add_sub_o = register;

endmodule