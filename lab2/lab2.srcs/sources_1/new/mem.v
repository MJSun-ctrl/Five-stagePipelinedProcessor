`timescale 1ns / 1ps

module mem(
    input  wire        clk,
    input  wire        reset,
    
    output wire        mem_ready,
    input  wire        ex_mem_valid,
    input  wire        wb_ready,
    output wire        mem_wb_valid,
    
    output reg         mem_valid,
    output wire [37:0] mem_id_bypass_bus,
    
    input  wire [70:0] ex_mem,
    output wire [69:0] mem_wb,
    
    input  wire [31:0] data_sram_rdata
);

    reg [70:0] mem_reg;

    wire [31:0] mem_pc;
    wire [31:0] mem_alu_result;
    wire        mem_res_from_mem;
    wire        mem_reg_we;
    wire [4:0]  mem_reg_waddr;
    
    assign {
        mem_pc,            // [31:0]
        mem_alu_result,    // [63:32]
        mem_res_from_mem,  // [64]
        mem_reg_we,        // [65]
        mem_reg_waddr      // [70:66]
    } = mem_reg;
    
    assign mem_wb = {
        mem_pc,              // [31:0]
        mem_result,          // [63:32]
        mem_reg_we,          // [64]
        mem_reg_waddr        // [69:65]
    };

    wire [31:0] mem_result;
    assign mem_result = mem_res_from_mem ? data_sram_rdata : mem_alu_result;
    

    assign mem_ready_go = 1'b1;
    assign mem_ready = !mem_valid || (mem_ready_go && wb_ready);
    assign mem_wb_valid = mem_valid && mem_ready_go;

    always @(posedge clk) begin
        if (reset) begin
            mem_valid <= 1'b0;
        end else if (mem_ready) begin
            mem_valid <= ex_mem_valid;
        end
    end

    always @(posedge clk) begin
        if (mem_ready && ex_mem_valid) begin
            mem_reg <= ex_mem;
        end
    end

    assign mem_id_bypass_bus = {mem_reg_we, mem_reg_waddr, mem_result};

endmodule
