`timescale 1ns / 1ps 

module id(
    input  wire        clk,
    input  wire        reset,
    
    output wire        id_ready,
    input  wire        if_id_valid,
    input  wire        ex_ready,
    output wire        id_ex_valid,
    
    input  wire        ex_valid,
    input  wire [37:0] ex_id_bypass_bus,
    input  wire        ex_is_load,
    input  wire        mem_valid,
    input  wire [37:0] mem_id_bypass_bus,
    input  wire        wb_valid,
    
    input  wire [ 96:0] if_id,
    output wire [153:0] id_ex,
    output wire [ 68:0] id_if,
    input  wire [ 37:0] wb_id
);
    reg  [96:0] id_reg;
    wire [31:0] id_pc;
    wire [31:0] id_inst;
    wire        id_pred_taken;
    wire [31:0] id_pred_target;

    
    wire wb_rf_we;
    wire [ 4:0] wb_rf_waddr;
    wire [31:0] wb_rf_wdata;

    
    wire [31:0] id_rj_value;
    wire [31:0] id_rkd_value;
    wire [31:0] id_imm;
    wire [11:0] id_alu_op;
    wire        id_src1_is_pc;
    wire        id_src2_is_imm;
    wire        id_res_from_mem;
    wire        id_reg_we;
    wire        id_mem_en;
    wire [3:0]  id_mem_we;
    wire [4:0]  id_reg_waddr;
    
    assign {
        wb_rf_we, 
        wb_rf_waddr, 
        wb_rf_wdata
        } = wb_id ;
    assign {
        id_pc, 
        id_inst, 
        id_pred_taken, 
        id_pred_target
        } = id_reg;
  
    assign id_ex = {
        id_pc,              // [31:0]
        id_rj_value,        // [63:32]
        id_rkd_value,       // [95:64]
        id_imm,             // [127:96]
        id_alu_op,          // [139:128]
        id_src1_is_pc,      // [140]
        id_src2_is_imm,     // [141]
        id_res_from_mem,    // [142]
        id_reg_we,          // [143]
        id_mem_en,          // [144]
        id_mem_we,          // [148:145]
        id_reg_waddr        // [153:149]
    };

    assign id_if = {
        branch_cancel, 
        branch_correct,
        (id_valid && id_ready_go && (id_inst_b || id_inst_beq)),
        id_pc,
        branch_taken,
        id_inst_beq,
        (id_inst_b || id_inst_beq)
    };    

    reg  id_valid;
    wire id_ready_go;
    

    assign id_ready = !id_valid || (id_ready_go && ex_ready);
    assign id_ex_valid = id_valid && id_ready_go;

    always @(posedge clk) begin
        if (reset) begin
            id_valid <= 1'b0;
        end else if (branch_cancel) begin
            id_valid <= 1'b0;
        end else if (id_ready) begin
            id_valid <= if_id_valid;
        end
    end

    always @(posedge clk) begin
        if (id_ready && if_id_valid) begin
            id_reg <= if_id;
        end
    end

    wire [4:0]  id_rd   = id_inst[4:0];
    wire [4:0]  id_rj   = id_inst[9:5];
    wire [4:0]  id_rk   = id_inst[14:10];

    wire id_inst_add_w = (id_inst[31:15] == 17'b0000_0000_0001_0000_0);
    wire id_inst_sub_w = (id_inst[31:15] == 17'b0000_0000_0001_0001_0);
    wire id_inst_and   = (id_inst[31:15] == 17'b0000_0000_0001_0100_1);
    wire id_inst_mul_w = (id_inst[31:15] == 17'b0000_0000_0001_1100_0);
    wire id_inst_slli_w  = (id_inst[31:15] == 17'b0000_0000_0100_0000_1);

    wire id_inst_slti  = (id_inst[31:22] == 10'b0000_0010_00);
    wire id_inst_addi_w  = (id_inst[31:22] == 10'b0000_0010_10);
    wire id_inst_ori   = (id_inst[31:22] == 10'b0000_0011_10);
    wire id_inst_ld_w  = (id_inst[31:22] == 10'b0010_1000_10);
    wire id_inst_st_w  = (id_inst[31:22] == 10'b0010_1001_10);

    wire id_inst_b     = (id_inst[31:26] == 6'b0101_00);
    wire id_inst_beq   = (id_inst[31:26] == 6'b0101_10);

                       
    assign id_mem_en = id_inst_ld_w | id_inst_st_w;
    assign id_mem_we = id_inst_st_w ? 4'b1111 : 4'b0000;
    assign id_res_from_mem = id_inst_ld_w;
    assign id_src1_is_pc = 1'b0;
    assign id_src2_is_imm = id_inst_slli_w | id_inst_slti | id_inst_addi_w | id_inst_ori | id_inst_ld_w | id_inst_st_w;

    assign id_alu_op[0]  = id_inst_add_w;
    assign id_alu_op[1]  = id_inst_sub_w;
    assign id_alu_op[2]  = id_inst_and;
    
    assign id_alu_op[3]  = id_inst_mul_w;
    assign id_alu_op[4]  = id_inst_slli_w;
    assign id_alu_op[5]  = id_inst_slti;
    assign id_alu_op[6]  = id_inst_addi_w;
    assign id_alu_op[7]  = id_inst_ori;
    assign id_alu_op[8]  = id_inst_ld_w;
    assign id_alu_op[9]  = id_inst_st_w;
    assign id_alu_op[10]  = id_inst_b;
    assign id_alu_op[11]  = id_inst_beq;
    
    wire use_imm_signext =
        id_inst_slti |
        id_inst_addi_w |
        id_inst_ld_w |
        id_inst_st_w;

    assign id_imm =
        id_inst_slli_w ? {27'b0, id_inst[14:10]} :
        id_inst_ori    ? {20'b0, id_inst[21:10]} :
        use_imm_signext ? {{20{id_inst[21]}}, id_inst[21:10]} :
        32'b0;

    wire ex_rf_we;
    wire [4:0] ex_rf_waddr;
    wire [31:0] ex_rf_wdata;
    assign {ex_rf_we, ex_rf_waddr, ex_rf_wdata} = ex_id_bypass_bus;
    
    wire mem_rf_we;
    wire [4:0] mem_rf_waddr;
    wire [31:0] mem_rf_wdata;
    assign {mem_rf_we, mem_rf_waddr, mem_rf_wdata} = mem_id_bypass_bus;
    
    wire  [4:0] raddr1 = (id_inst_add_w | id_inst_sub_w | id_inst_and | id_inst_mul_w | id_inst_slli_w | 
                          id_inst_addi_w | id_inst_slti | id_inst_ori | id_inst_ld_w | id_inst_st_w | id_inst_beq) ? id_rj : 5'b0;
    wire  [4:0] raddr2 = (id_inst_st_w | id_inst_beq) ? id_rd : 
                         (id_inst_add_w | id_inst_sub_w | id_inst_and | id_inst_mul_w) ? id_rk : 5'b0;
    
    assign id_reg_we = (id_inst_add_w | id_inst_sub_w | id_inst_and | id_inst_mul_w |
                       id_inst_slli_w  | id_inst_slti  | id_inst_addi_w | id_inst_ori |
                       id_inst_ld_w) && id_valid && (id_rd != 5'b0);
    
    assign id_reg_waddr = (id_inst_add_w | id_inst_sub_w | id_inst_and | id_inst_mul_w |
                            id_inst_slli_w | id_inst_addi_w | id_inst_slti | id_inst_ori | id_inst_ld_w) ? id_rd : 5'b0;
                         
    wire [31:0] rdata1, rdata2;
    
    
    regfile regfile(
        .clk(clk),
        .resetn(~reset),
        .we(wb_rf_we),
        .waddr(wb_rf_waddr),
        .wdata(wb_rf_wdata),
        .raddr1(raddr1),
        .rdata1(rdata1),
        .raddr2(raddr2),
        .rdata2(rdata2)
        
    );


    assign id_rj_value = 
        (ex_valid && ex_rf_we && (raddr1 == ex_rf_waddr)) ? ex_rf_wdata :
        (mem_valid && mem_rf_we && (raddr1 == mem_rf_waddr)) ? mem_rf_wdata :
        (wb_valid && wb_rf_we && (raddr1 == wb_rf_waddr)) ? wb_rf_wdata : rdata1;

    assign id_rkd_value = 
        (ex_valid && ex_rf_we && (raddr2 == ex_rf_waddr)) ? ex_rf_wdata :
        (mem_valid && mem_rf_we && (raddr2 == mem_rf_waddr)) ? mem_rf_wdata :
        (wb_valid && wb_rf_we && (raddr2 == wb_rf_waddr)) ? wb_rf_wdata : rdata2;

    
    wire [31:0] b_offset = {{4{id_inst[9]}}, id_inst[9:0], id_inst[25:10], 2'b00};
    wire [31:0] beq_offset = {{14{id_inst[25]}}, id_inst[25:10], 2'b00};
    
    wire        branch_taken;
    wire [31:0] branch_target;
    wire        branch_error;
    wire        branch_cancel;
    wire [31:0] branch_correct;

    assign branch_taken = id_valid && ((id_inst_b) || (id_inst_beq && (id_rj_value == id_rkd_value)));
    assign branch_target = id_inst_b ? id_pc + b_offset : id_pc + beq_offset;
    assign branch_error = id_valid && id_ready_go && (
        (branch_taken && !id_pred_taken) ||
        (!branch_taken && id_pred_taken) ||
        (branch_taken && id_pred_taken && (branch_target != id_pred_target))
    );
    
    assign branch_cancel = branch_error && ex_ready;
    assign branch_correct = branch_taken ? branch_target : (id_pc + 4);



    wire id_use_rdata1 = id_valid && (id_inst_add_w | id_inst_sub_w | id_inst_and | 
                         id_inst_mul_w | id_inst_slli_w | id_inst_addi_w | id_inst_ld_w | 
                         id_inst_st_w | id_inst_slti | id_inst_ori | id_inst_beq);
                         
    wire id_use_rdata2 = id_valid && (id_inst_add_w | id_inst_sub_w | id_inst_and | 
                         id_inst_mul_w | id_inst_st_w | id_inst_beq);

    wire id_rdata1_hazard = id_use_rdata1 && (ex_valid && ex_is_load && 
                              ex_rf_we && (raddr1 == ex_rf_waddr));
                              
    wire id_rdata2_hazard = id_use_rdata2 && (ex_valid && ex_is_load && 
                              ex_rf_we && (raddr2 == ex_rf_waddr));
                              
    assign id_ready_go = !id_rdata1_hazard && !id_rdata2_hazard;
    
    // 成功率计算
    reg [31:0] total_branch;
    reg [31:0] correct_pred;

    always @(posedge clk) begin
        if (reset) begin
            total_branch <= 32'h0;
            correct_pred <= 32'h0;
        end else if (id_valid && id_ready_go && (id_inst_b || id_inst_beq)) begin
          total_branch <= total_branch + 1;
          if (!branch_error) begin
              correct_pred <= correct_pred + 1;
          end
    end
  end
  
  /*
  final begin
    $display("\n--------------------------------------------------");
    $display("Branch Prediction Statistics:");
    $display("Total Branches: %d", cnt_total_branch);
    $display("Correct Predictions: %d", cnt_correct_pred);
    if (cnt_total_branch > 0)
        $display("Accuracy: %.2f%%", (cnt_correct_pred * 100.0) / cnt_total_branch);
    else
        $display("Accuracy: N/A");
    $display("--------------------------------------------------\n");
  end
  */

endmodule
