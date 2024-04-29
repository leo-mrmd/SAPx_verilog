module ram(
    input clk_i, 
    input rstn_i, 

    input[3:0] addr_i, 

    output[7:0] data_o);

reg[7:0] mem[0:15]; 


endmodule