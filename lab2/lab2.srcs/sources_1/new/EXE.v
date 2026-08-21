`timescale 1ns / 1ps

module exe(
    input  wire        clk,
    input  wire        reset,

    output wire        ex_ready,
    input  wire        id_ex_valid,
    input  wire        mem_ready,
    output wire        ex_mem_valid,

    output reg         ex_valid,
    output wire [37:0] ex_id_bypass_bus,
    output wire        ex_is_load,

    input  wire [153:0] id_ex,
    output wire [70:0]  ex_mem,

    output wire        data_sram_en,
    output wire [3:0]  data_sram_we,
    output wire [31:0] data_sram_addr,
    output wire [31:0] data_sram_wdata
);

    reg [153:0] ex_reg;

    wire [31:0] ex_pc;
    wire [31:0] ex_rj_value;
    wire [31:0] ex_rkd_value;
    wire [31:0] ex_imm;
    wire [11:0] ex_alu_op;
    wire        ex_src1_is_pc;
    wire        ex_src2_is_imm;
    wire        ex_res_from_mem;
    wire        ex_reg_we;
    wire        ex_mem_en;
    wire [3:0]  ex_mem_we;
    wire [4:0]  ex_reg_waddr;

    assign {
        ex_pc,            // [31:0]
        ex_rj_value,      // [63:32]
        ex_rkd_value,     // [95:64]
        ex_imm,           // [127:96]
        ex_alu_op,        // [139:128]
        ex_src1_is_pc,    // [140]
        ex_src2_is_imm,   // [141]
        ex_res_from_mem,  // [142]
        ex_reg_we,        // [143]
        ex_mem_en,        // [144]
        ex_mem_we,        // [148:145]
        ex_reg_waddr      // [153:149]
    } = ex_reg;


    wire [31:0] alu_src1 = ex_src1_is_pc ? ex_pc : ex_rj_value;
    wire [31:0] alu_src2 = ex_src2_is_imm ? ex_imm : ex_rkd_value;

    wire [31:0] ex_alu_result;


    assign ex_mem = {
        ex_pc,               // [31:0]
        ex_alu_result,       // [63:32]
        ex_res_from_mem,     // [64]
        ex_reg_we,           // [65]
        ex_reg_waddr         // [70:66]
    };

    wire ex_ready_go = 1'b1;

    assign ex_ready     = ~ex_valid || (ex_ready_go && mem_ready);
    assign ex_mem_valid = ex_valid && ex_ready_go;

    always @(posedge clk) begin
        if (reset)
            ex_valid <= 1'b0;
        else if (ex_ready)
            ex_valid <= id_ex_valid;
    end

    always @(posedge clk) begin
        if (ex_ready && id_ex_valid)
            ex_reg <= id_ex;
    end

    my_alu u_alu (
        .alu_op     (ex_alu_op),
        .src_1      (alu_src1),
        .src_2      (alu_src2),
        .alu_result (ex_alu_result)
    );


    assign data_sram_en    = ex_mem_en && ex_valid && ~reset;
    assign data_sram_we    = ex_mem_we;
    assign data_sram_addr = data_sram_en ? ex_alu_result : 32'b0;
    assign data_sram_wdata = ex_rkd_value;

    assign ex_id_bypass_bus = {ex_reg_we, ex_reg_waddr, ex_alu_result};
    assign ex_is_load = ex_alu_op[8];

endmodule
