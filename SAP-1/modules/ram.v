module ram(
    input clk_i,
    input cen_i, 

    input[3:0] addr_i, 

    output[7:0] data_o);
    
reg[7:0] mem[0:15];
reg[7:0] data_r;

initial begin // Not great from what i've picked up

    mem[0]  = 8'b00001001;
    mem[1]  = 8'b00011010;
    mem[2]  = 8'b00011011;
    mem[3]  = 8'b00101100;
    mem[4]  = 8'b11100000;
    mem[5]  = 8'b11110000;
    mem[6]  = 8'b00000000;
    mem[7]  = 8'b00000000;
    mem[8]  = 8'b00000000;
    mem[9]  = 8'b00010000;
    mem[10] = 8'b00010100;
    mem[11] = 8'b00011000;
    mem[12] = 8'b00100000;

//mem[0]  = 8'b10010000;
//mem[1]  = 8'b01011000;
//mem[2]  = 8'b11011000;
//mem[3]  = 8'b00110100;
//mem[4]  = 8'b00000111;
//mem[5]  = 8'b00001111;
//mem[6]  = 8'b00000000;
//mem[7]  = 8'b00000000;
//mem[8]  = 8'b00000000;
//mem[9]  = 8'b00001000;
//mem[10] = 8'b00101000;
//mem[11] = 8'b00011000;
//mem[12] = 8'b00000100;

	
end


always @ (*) begin
        data_r <= mem[$unsigned(addr_i)];
end

assign data_o = data_r;

endmodule