module add_sub(
    input clk_i, 
    input rstn_i, 

    input[7:0] a_i, 
    input[7:0] b_i, 
    input sub_en_i, 
    
    output[7:0] bus_o);
    
reg[7:0] a;
reg[7:0] b;

always @ (posedge clk_i, negedge rstn_i) begin
    if (!rstn_i) begin
        a <= 8'b0;
        b <= 8'b0;
    end else begin
        a <= a_i;
        b <= b_i;    
    end
end 

wire[7:0] res_r; // register stage added for metastability 
assign   res_r = sub_en_i ? (a-b) : (a+b); // assign out = condition ? val_if_true : val_if_false

assign bus_o = res_r;

endmodule