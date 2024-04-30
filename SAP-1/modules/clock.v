// Took that from the other tuto on this other website (https://austinmorlan.com/posts/fpga_computer_sap1/). Not particulrlaly useful in that case but you never know
module clock(
	input hltn_i,
	input clk_i,
	output clk_o);

assign clk_o = (!hltn_i) ? 1'b0 : clk_i;

endmodule
