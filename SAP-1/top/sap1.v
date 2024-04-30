`include "../modules/*.v"

module sap1_top(
    input clk_i,
    input rstn_i, 

    output binary_o);

// Vitals
wire       clk0;
assign     clk0 = clk_i;
wire       clk1;
wire       rstn;

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

// Adder / Substractor signals
wire[7:0] a_to_add;
wire[7:0] b_to_add;
wire      sub_en;
wire      add_to_bus;

// Controller signals
wire[3:0]  opcode;
wire       hltn;
wire[11:0] ctrl_word;

clock clock_inst_0 ( .hltn_i (hltn),
                     .clk_i  (clk0),
                     .clk_o  (clk1));

pc pc_inst_0 ( .clk_i  (clk),
               .rstn_i (rstn),
               .inc_i  (incr_pc),
               .pc_o   (pc_to_bus));

mar mar_inst_0 ( .clk_i  (clk),
                 .rstn_i (rstn),
                 .bus_i  (bus_to_mar),
                 .ld_i   (ld_mar),
                 .addr_o (mar_to_ram));

ram ram_inst_0 ( .clk_i  (clk),
                 .cen_i  (ram_en),
                 .addr_i (mar_to_ram),
                 .data_o (ram_to_bus);

add_sub add_sub_inst_0 ( .clk_i    (clk),
                         .rstn_i   (rstn),
                         .a_i      (a_i),
                         .b_i      (b_i),
                         .sub_en_i (sub_en),
                         .bus_o    (add_to_bus));

controller controller_inst_0 ( .clk_i     (clk),
                               .rstn_i    (rstn),
                               .opcode_i  (opcode),
                               .hltn_o    (hltn),
                               .ctrl_word (ctrl_word));



endmodule