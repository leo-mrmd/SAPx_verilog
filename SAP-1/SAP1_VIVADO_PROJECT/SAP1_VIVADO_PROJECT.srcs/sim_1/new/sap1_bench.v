`timescale 1ns / 1ps

module sap1_bench();

    reg       clk;
    reg       rstn;
    wire[7:0] bin_out;

    sap1_top dut_sap1 ( .clk_i(clk), .rstn_i(rstn), .binary_o(bin_out) );
    
    initial begin
        rstn = 0;
        #50
        rstn = 1;
    end
    
    always begin
        clk = 0;
        #10;
        clk = 1;
        #10;
    end

endmodule
