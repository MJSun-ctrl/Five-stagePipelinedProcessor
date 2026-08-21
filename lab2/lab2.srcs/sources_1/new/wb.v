`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module wb(
    input  wire        clk,
    input  wire        reset,
    
    output wire        wb_ready,
    input  wire        mem_wb_valid,
    output reg         wb_valid,
    
    input  wire [69:0] mem_wb,
    output wire [37:0] wb_id,
    
    output wire [31:0] debug_wb_pc,
    output wire        debug_wb_rf_wen,
    output wire [4:0]  debug_wb_rf_wnum,
    output wire [31:0] debug_wb_rf_wdata
);

    reg [69:0] wb_reg;

    wire [31:0] wb_pc;
    wire [31:0] wb_result;
    wire        wb_reg_we;
    wire [4:0]  wb_reg_waddr;
    
    assign {
        wb_pc,              // [31:0]
        wb_result,          // [63:32]
        wb_reg_we,          // [64]
        wb_reg_waddr        // [69:65]
    } = wb_reg;

    assign wb_id = {
            wb_reg_we, 
            wb_reg_waddr, 
            wb_result};

    wire wb_ready_go;
    wire wb_id_valid;

    assign wb_ready_go = 1'b1;
    assign wb_ready = !wb_valid || wb_ready_go;
    assign wb_id_valid = wb_valid && wb_ready_go;

    always @(posedge clk) begin
        if (reset) begin
            wb_valid <= 1'b0;
        end else if (wb_ready) begin
            wb_valid <= mem_wb_valid;
        end
    end

    always @(posedge clk) begin
        if (wb_ready && mem_wb_valid) begin
            wb_reg <= mem_wb;
        end
    end

    assign debug_wb_pc       = wb_pc;
    assign debug_wb_rf_wen   = wb_id_valid ? wb_reg_we : 1'b0;
    assign debug_wb_rf_wnum  = wb_reg_waddr;
    assign debug_wb_rf_wdata = wb_result;

endmodule