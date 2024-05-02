module ram(
    input clk_i,
    input cen_i, 

    input[3:0] addr_i, 

    output[7:0] data_o);
reg[7:0] mem_read[0:15];
reg[7:0] mem[0:15];
reg[7:0] data_r;

integer i;
integer j;

initial begin // Not great from what i've picked up
    
//	$readmemh("program.bin", mem_read);
	

//    for (i = 0; i < 16; i = i + 1) begin

//        for (j = 0; j < 8; j = j + 1) begin
//            mem[i][j] <= mem_read[i][j];
//        end
//    end

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
	
end


always @ (negedge cen_i) begin
        data_r <= mem[addr_i];
end

assign data_o = data_r;

endmodule