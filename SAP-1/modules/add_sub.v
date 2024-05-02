module add_sub(
    input clk_i, 
    input rstn_i, 

    input[7:0] a_i, 
    input[7:0] b_i, 
    input sub_en_i, 
    
    output[7:0] bus_o);

wire[7:0] res_r; // register stage added for metastability 
assign   res_r = sub_en_i ? (a_i-b_i) : (a_i+b_i); // assign out = condition ? val_if_true : val_if_false

reg[7:0] bus_r;

always @ (posedge clk_i, negedge rstn_i) begin
    if (!rstn_i)
        bus_r <= 8'b0;
    else begin
        bus_r <= res_r;
    end
end

assign bus_o = bus_r;

endmodule