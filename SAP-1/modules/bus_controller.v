module bus_controller(
    // Bus inputs
    input[3:0] pc_i,
    input[7:0] a_acc_i, 
    input[7:0] add_sub_i,
    input[7:0] ram_i,
    input[3:0] instr_i, 
    
    // Enable inputs
    input pc_en_i,
    input ram_en_i,
    input instr_en_i, 
    input a_acc_en_i,
    input add_sub_en_i,

    // Bus outputs
    output[4:0] mar_o,
    output[7:0] instr_o,
    output[7:0] a_acc_o,
    output[7:0] b_reg_o,
    output[7:0] out_reg_o);

reg[7:0] bus;

always @ (*) begin
    if (pc_en_i) begin
        bus[3:0] = pc_i;
    else if (ram_en_i)
        bus = ram_i;
    else if (instr_en_i)
        bus[3:0] = instr_i;
    else if (a_acc_en_i)
        bus = a_acc_i;
    else if (add_sub_en_i)
        bus = add_sub_i;
    else
        bus = 8'b0;
    end
end

assign mar_o     = bus[3:0];
assign instr_o   = bus;
assign a_acc_o   = bus;
assign b_reg_o   = bus;
assign out_reg_o = bus;

endmodule