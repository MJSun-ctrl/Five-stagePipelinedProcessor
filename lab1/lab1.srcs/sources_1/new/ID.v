module ID(
    input reset,
    input clk,
    input [31:0] inst,
    input [31:0] pc_buf_ID,

    // 回写旁路（WB阶段）
    input [31:0] rf_wdata,
    input [ 4:0] rf_waddr,
    input rf_we,

    // EXE阶段旁路
    input  [31:0] EXE_result,
    input  rf_we_EXE,
    input  [4:0] rf_waddr_EXE,

    // 输出：给EXE/MEM控制与数据
    output [18:0] alu_op,             // 为保持流水线寄存器宽度不改，保留19位，仅驱动所需bit
    output [31:0] br_target,
    output [31:0] alu_src1,
    output [31:0] alu_src2,
    output [ 4:0] rf_waddr_willused,
    output [ 4:0] rf_raddr1,
    output [ 4:0] rf_raddr2,

    output        res_from_mem,       // 仅 ld.w
    output        br_taken,           // b, beq
    output        data_sram_we_buf,   // 仅 st.w
    output [31:0] data_sram_wdata_buf,
    output        rf_we_willused,     // 寄存器写使能（即将使用）
    input         IF_ready_go,        // 取消有效标志用
    output        valid_out,          // 本级有效

    // 访存数据类型（本实验仅用到字）
    output [4:0]  ld_src,             // 仅用到[0]位代表ld.w
    output [3:0]  wdata_src,          // 仅用到[3]位代表st.w
    output        need_data_sram_ID   // 访存需要（ld/st）
);
    // 本级有效寄存器（简单控制：每拍拉高，遇到flush拉低）
    reg valid;
    wire br_taken_cancel;

    always @(posedge clk) begin
        if (reset) begin
            valid <= 1'b0;
        end
        else if (br_taken_cancel) begin
            valid <= 1'b0;
        end
        else begin
            valid <= 1'b1;
        end
    end

    assign valid_out = valid;

    // 取字段
    wire [ 5:0] op_31_26 = inst[31:26];
    wire [ 3:0] op_25_22 = inst[25:22];
    wire [ 1:0] op_21_20 = inst[21:20];
    wire [ 4:0] op_19_15 = inst[19:15];

    wire [ 4:0] rd = inst[ 4: 0];
    wire [ 4:0] rj = inst[ 9: 5];
    wire [ 4:0] rk = inst[14:10];

    wire [11:0] i12 = inst[21:10];                 // addi/ld/st/slti
    wire [15:0] i16 = inst[25:10];                 // beq
    wire [25:0] i26 = {inst[ 9: 0], inst[25:10]};  // b
    // 解码器
    wire [63:0] op_31_26_d;
    wire [15:0] op_25_22_d;
    wire [ 3:0] op_21_20_d;
    wire [31:0] op_19_15_d;

    decoder_6_64 u_dec0(.in(op_31_26 ), .out(op_31_26_d ));
    decoder_4_16 u_dec1(.in(op_25_22 ), .out(op_25_22_d ));
    decoder_2_4  u_dec2(.in(op_21_20 ), .out(op_21_20_d ));
    decoder_5_32 u_dec3(.in(op_19_15 ), .out(op_19_15_d ));

    // 仅保留实验要求的12条指令
    wire inst_add_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h00];
    wire inst_sub_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h02];
    wire inst_and    = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h09];
    wire inst_mul_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h18];

    wire inst_slli_w = op_31_26_d[6'h00] & op_25_22_d[4'h1] & op_21_20_d[2'h0] & op_19_15_d[5'h01];
    wire inst_slti   = op_31_26_d[6'h00] & op_25_22_d[4'h8];      // imm compare (<)
    wire inst_addi_w = op_31_26_d[6'h00] & op_25_22_d[4'ha];      // rj + imm
    wire inst_ori    = op_31_26_d[6'h00] & op_25_22_d[4'he];      // rj | imm

    wire inst_ld_w   = op_31_26_d[6'h0a] & op_25_22_d[4'h2];
    wire inst_st_w   = op_31_26_d[6'h0a] & op_25_22_d[4'h6];

    wire inst_b      = op_31_26_d[6'h14];
    wire inst_beq    = op_31_26_d[6'h16];

    // 立即数需求
    wire need_ui5   = inst_slli_w;
    wire need_ui12  = inst_ori;
    wire need_si12  = inst_addi_w | inst_ld_w | inst_st_w | inst_slti;
    wire need_si16  = inst_beq;
    wire need_si26  = inst_b;

    // 立即数生成
    wire [31:0] imm =
        need_ui5  ? {27'b0, inst[14:10]} :
        need_ui12 ? {{20{1'b0}}, i12[11:0]} :
                    {{20{i12[11]}}, i12[11:0]};

    // 分支偏移（对齐为字地址）
    wire [31:0] br_offs =
        need_si26 ? {{ 4{i26[25]}}, i26[25:0], 2'b0} :
        need_si16 ? {{14{i16[15]}}, i16[15:0], 2'b0} : 32'b0;

    // 源寄存器编码（beq和st用rd作为第二源）
    wire src_reg_is_rd = inst_beq | inst_st_w;

    // 选择寄存器地址
    assign rf_raddr1 = rj;
    assign rf_raddr2 = src_reg_is_rd ? rd : rk;

    // 寄存器堆与简单旁路（EXE / WB）
    wire [31:0] rf_rdata1_regout;
    wire [31:0] rf_rdata2_regout;

    regfile u_regfile(
        .clk    (clk      ),
        .raddr1 (rf_raddr1),
        .rdata1 (rf_rdata1_regout),
        .raddr2 (rf_raddr2),
        .rdata2 (rf_rdata2_regout),
        .we     (rf_we    ),
        .waddr  (rf_waddr ),
        .wdata  (rf_wdata )
    );
    // ID.v 中的寄存器读数据选择：实现 EXE/WB 旁路
    wire [31:0] rf_rdata1 =
        (rf_raddr1 == 5'b00000) ? rf_rdata1_regout :                    // r0 恒为0
        ((rf_raddr1 == rf_waddr_EXE) && rf_we_EXE) ? EXE_result :       // EXE阶段结果优先旁路
        ((rf_raddr1 == rf_waddr)     && rf_we    ) ? rf_wdata   :       // WB阶段写回数据旁路
                                                     rf_rdata1_regout;

    wire [31:0] rf_rdata2 =
        (rf_raddr2 == 5'b00000) ? rf_rdata2_regout :
        ((rf_raddr2 == rf_waddr_EXE) && rf_we_EXE) ? EXE_result :
        ((rf_raddr2 == rf_waddr)     && rf_we    ) ? rf_wdata   :
                                                     rf_rdata2_regout;

    wire [31:0] rj_value  = rf_rdata1;
    wire [31:0] rkd_value = rf_rdata2;

    // ALU源选择（本实验无pc作为src1的指令）
    wire src1_is_pc  = 1'b0;
    wire src2_is_imm = inst_slli_w | inst_addi_w | inst_ori | inst_ld_w | inst_st_w | inst_slti;

    assign alu_src1 = src1_is_pc ? pc_buf_ID : rj_value;
    assign alu_src2 = src2_is_imm ? imm      : rkd_value;

    // ALU操作码（仅驱动所需bit，下标与原设计保持一致）
    assign alu_op[ 0] = inst_add_w | inst_addi_w | inst_ld_w | inst_st_w; // 加法/地址
    assign alu_op[ 1] = inst_sub_w;
    assign alu_op[ 2] = inst_slti;             // 有符号小于（立即数）
    assign alu_op[ 3] = 1'b0;                  // sltu移除
    assign alu_op[ 4] = inst_and;
    assign alu_op[ 5] = 1'b0;                  // nor移除
    assign alu_op[ 6] = inst_ori;              // or | imm
    assign alu_op[ 7] = 1'b0;                  // xor移除
    assign alu_op[ 8] = inst_slli_w;           // sll
    assign alu_op[ 9] = 1'b0;                  // srl移除
    assign alu_op[10] = 1'b0;                  // sra移除
    assign alu_op[11] = 1'b0;                  // lui移除
    assign alu_op[12] = inst_mul_w;            // mul
    assign alu_op[13] = 1'b0;                  // mulh移除
    assign alu_op[14] = 1'b0;                  // mulhu移除
    assign alu_op[15] = 1'b0;                  // div移除
    assign alu_op[16] = 1'b0;                  // mod移除
    assign alu_op[17] = 1'b0;                  // divu移除
    assign alu_op[18] = 1'b0;                  // modu移除

    // 写回控制
    wire dst_is_r1 = 1'b0;                     // 本实验不含bl
    wire gr_we = ~(inst_st_w | inst_beq | inst_b); // 非store/分支写回寄存器
    assign rf_we_willused    = gr_we && valid;
    assign rf_waddr_willused = dst_is_r1 ? 5'd1 : rd;

    // 访存控制
    wire mem_we = inst_st_w;
    assign res_from_mem       = inst_ld_w;
    assign need_data_sram_ID  = (inst_ld_w | inst_st_w) && valid;
    assign data_sram_we_buf   = mem_we && valid;
    assign data_sram_wdata_buf= rkd_value;     // st.w直接写整字

    // ld_src/wdata_src仅做通道选择（本实验只用到字）
    assign ld_src    = 5'b00001;               // [0]=1 => ld.w
    assign wdata_src = 4'b1000;                // [3]为1 => st.w整字

    // 分支判断与目标（不使用预测）
    wire rj_eq_rd = (rj_value == rkd_value);
    wire actual_taken_beq = inst_beq && rj_eq_rd && valid;
    wire actual_taken_b   = inst_b && valid;

    assign br_taken  = actual_taken_beq | actual_taken_b;
    assign br_target = pc_buf_ID + br_offs;

    assign br_taken_cancel = br_taken && IF_ready_go;

endmodule
