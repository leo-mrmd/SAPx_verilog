module sap1_top(
    input clk_i,
    input rstn_i, 

    output binary_o);

// Vitals
wire       clk0;
assign     clk0 = clk_i;
wire       clk1;
wire       rstn;

assign rstn = rstn_i;

// PC signals
wire       incr_pc;
wire[3:0]  pc_to_bus;

// MAR signals
wire[3:0] bus_to_mar;
wire      ld_mar;
wire[3:0] mar_to_ram;

// RAM signals
wire      ram_en;
wire[7:0] ram_to_bus;

// Instruction register signals
wire      ld_instr;
wire[7:0] bus_to_instr;
wire[7:0] instr_to_bus;
wire[7:0] instr_to_ctrl;

// Controller signals
wire[3:0]  opcode;
wire       hltn;
wire[11:0] ctrl_word;

assign opcode = instr_to_ctrl[7:4];

// A accumulator signals
wire      ld_a;
wire[7:0] bus_to_a;
wire[7:0] a_to_bus;

// B register signals
wire      ld_b;
wire[7:0] bus_to_b;
wire[7:0] b_to_bus;

// Adder / Substractor signals
wire[7:0] a_to_add;
wire[7:0] b_to_add;
wire      sub_en;
wire      add_to_bus;

// Output register signals
wire      ld_out;
wire[7:0] bus_to_out;
wire[7:0] out_to_bus;
wire[7:0] binary_out_r;

assign binary_o = binary_out_r; 

// Bus controller signals
wire pc_en;
wire instr_en;
wire a_acc_en;
wire add_sub_en;

// Load signals to control word assignments
assign incr_pc  = ctrl_word[0];
assign ld_mar   = ctrl_word[2];
assign ld_instr = ctrl_word[4];
assign ld_a     = ctrl_word[6];
assign sub_en   = ctrl_word[8];
assign ld_b     = ctrl_word[10];
assign ld_out   = ctrl_word[11];


clock clock_inst_0 ( .hltn_i (hltn),
                     .clk_i  (clk0),
                     .clk_o  (clk1));

pc pc_inst_0 ( .clk_i  (clk1),
               .rstn_i (rstn),
               .inc_i  (incr_pc),
               .pc_o   (pc_to_bus));

mar mar_inst_0 ( .clk_i  (clk1),
                 .rstn_i (rstn),
                 .bus_i  (bus_to_mar),
                 .ld_i   (ld_mar),
                 .addr_o (mar_to_ram));

ram ram_inst_0 ( .clk_i  (clk1),
                 .addr_i (mar_to_ram),
                 .data_o (ram_to_bus));
                
register instr_reg_inst_0 ( .clk_i      (clk1),
                            .rstn_i     (rstn),
                            .ld_i       (ld_instr),
                            .bus_i      (bus_to_instr),
                            .bus_o      (instr_to_bus),
                            .parallel_o (instr_to_ctrl));

controller controller_inst_0 ( .clk_i       (clk1),
                               .rstn_i      (rstn),
                               .opcode      (opcode),
                               .hltn_o      (hltn),
                               .ctrl_word_o (ctrl_word));

register acc_inst_0 ( .clk_i      (clk1),
                      .rstn_i     (rstn),
                      .ld_i       (ld_a),
                      .bus_i      (bus_to_a),
                      .bus_o      (a_to_bus),
                      .parallel_o (a_to_add));

add_sub add_sub_inst_0 ( .clk_i    (clk1),
                         .rstn_i   (rstn),
                         .a_i      (a_i),
                         .b_i      (b_i),
                         .sub_en_i (sub_en),
                         .bus_o    (add_to_bus));

register b_reg_inst_0 ( .clk_i      (clk1),
                        .rstn_i     (rstn),
                        .ld_i       (ld_b),
                        .bus_i      (bus_to_b),
                        .bus_o      (b_to_bus),
                        .parallel_o (b_to_add));

register out_reg_inst_0 ( .clk_i      (clk1),
                          .rstn_i     (rstn),
                          .ld_i       (ld_out),
                          .bus_i      (bus_to_out),
                          .parallel_o (binary_out_r));

bus_controller bus_ctrl_inst_0 ( .pc_i(pc_to_bus),
                                 .a_acc_i(a_to_bus),
                                 .add_sub_i(add_to_bus),
                                 .ram_i(ram_to_bus),
                                 .instr_i(instr_to_bus),
                                 .pc_en_i      (ctrl_word[1]),
                                 .ram_en_i     (ctrl_word[3]),
                                 .instr_en_i   (ctrl_word[5]),
                                 .a_acc_en_i   (ctrl_word[7]),
                                 .add_sub_en_i (ctrl_word[9]),
                                 .mar_o        (bus_to_mar),
                                 .instr_o      (bus_to_instr),
                                 .a_acc_o      (bus_to_a),
                                 .b_reg_o      (bus_to_b),
                                 .out_reg_o    (bus_to_out));

endmodule