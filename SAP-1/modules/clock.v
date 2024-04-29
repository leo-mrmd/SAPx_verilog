module clock(
	input hlt_i,
	input clk_i,
	output clk_o);

assign clk_o = (hlt_i) ? 1'b0 : clk_i;

endmodule
