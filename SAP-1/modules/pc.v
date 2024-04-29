module pc(
    input clk_in, 
    input rstn_i, 

    input inc_i,

    output[4:0] pc_o);


always @ (negedge clk_i, negedge rstn_i) begin
    if(!rstn_i!)
        pc_o <= 4'b0;
    else if(inc_i)
        pc_o <= pc_o + 1;
end

endmodule
