`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/18 08:36:15
// Design Name: 
// Module Name: cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cpu(
    input  wire        clk,             //时钟信号
    input  wire        resetn,          //低有效复位信号
    // inst sram interface 
    output wire        inst_sram_en,    //指令存储器读使能
    output wire [31:0] inst_sram_addr,  //指令存储器读地址
    input  wire [31:0] inst_sram_rdata, //指令存储器读出的数据
    // data sram interface
    output wire        data_sram_en,    //数据存储器端口读/写使能
    output wire [ 3:0] data_sram_wen,   //数据存储器写使能
    output wire [31:0] data_sram_addr,  //数据存储器读/写地址
    output wire [31:0] data_sram_wdata, //写入数据存储器的数据
    input  wire [31:0] data_sram_rdata, //数据存储器读出的数据
    // trace debug interface
    output wire [31:0] debug_wb_pc,     //当前正在执行指令的PC
    output wire        debug_wb_rf_wen, //当前通用寄存器组的写使能信号
    output wire [ 4:0] debug_wb_rf_wnum,//当前通用寄存器组写回的寄存器编号
    output wire [31:0] debug_wb_rf_wdata//当前指令需要写回的数据
);

  // 同步复位
  reg reset;
  always @(posedge clk) begin
      reset <= ~resetn;
  end

  // 指令端使能（复位后拉高）
  reg inst_en;
  always @(posedge clk) begin
      if (reset) inst_en <= 1'b0;
      else       inst_en <= 1'b1;
  end

  // 信号与流水寄存器
  wire        br_taken;
  wire [31:0] br_target;
  wire [31:0] inst;
  reg  [31:0] inst_reg;

  wire [18:0] alu_op;
  wire        res_from_mem;
  wire        rf_we;
  wire        rf_we_willused;
  wire [ 4:0] rf_raddr1;
  wire [ 4:0] rf_raddr2;

  wire [31:0] rf_wdata;
  wire [31:0] pc;

  wire [31:0] alu_src1;
  wire [31:0] alu_src2;
  wire [31:0] alu_result;
  wire [31:0] final_result;
  wire [4:0]  rf_waddr;
  wire [4:0]  rf_waddr_willused;
  wire [31:0] mem_result;
  wire        data_sram_we_buf;
  wire [31:0] data_sram_wdata_buf;
  wire [4:0]  ld_src;
  wire [1:0]  mem_src1;
  wire [1:0]  mem_src2;
  wire [7:0]  mem_u1;
  wire [15:0] mem_u2;
  wire [3:0]  wdata_src;
  wire [3:0]  data_sram_we_bhw;
  wire [3:0]  data_sram_we_b;
  wire [3:0]  data_sram_we_h;

  // EXE缓冲
  reg [18:0] alu_op_buf_EXE;
  reg [31:0] alu_src1_buf_EXE;
  reg [31:0] alu_src2_buf_EXE;
  reg        res_from_mem_buf_EXE;
  reg        data_sram_we_buf_EXE;
  reg [31:0] data_sram_wdata_buf_EXE;
  reg [4:0]  rf_waddr_willused_buf_EXE;
  reg        rf_we_buf_EXE;

  // MEM缓冲
  reg [31:0] alu_result_buf_MEM;
  reg        res_from_mem_buf_MEM;
  reg [4:0]  rf_waddr_willused_buf_MEM;
  reg        rf_we_buf_MEM;
  reg [31:0] pc_buf_MEM;
  reg [4:0]  ld_src_buf_EXE;
  reg [4:0]  ld_src_buf_MEM;
  reg [3:0]  wdata_src_buf_EXE;
  wire       need_data_sram_ID;
  reg        need_data_sram_EXE;

  // 级联控制
  wire IF_ready_go;
  wire ID_ready_go;
  wire EXE_ready_go;
  wire MEM_ready_go;
  wire WB_ready_go;

  reg IF_ready_go_reg;
  reg EXE_invaild;
  wire valid_out;
  wire div_wating;

  always @(posedge clk) begin
      IF_ready_go_reg <= IF_ready_go;
  end

  // 简单数据相关阻塞：load-use hazard
  //若 ID 需要读取的寄存器等于 EXE 将要写回且 EXE 是 load（res_from_mem_buf_EXE==1），则阻塞 ID（返回0）
  assign ID_ready_go =
      !valid_out ? 1 :
      ((rf_waddr_willused_buf_EXE == 5'b00000) && (rf_waddr_willused_buf_MEM == 5'b00000)) ? 1 :
      ((rf_raddr1 == rf_waddr_willused_buf_EXE) && res_from_mem_buf_EXE) ? 0 :
      ((rf_raddr2 == rf_waddr_willused_buf_EXE) && res_from_mem_buf_EXE) ? 0 :
      !EXE_ready_go ? 0 : 1;

  assign IF_ready_go  = ID_ready_go;
  assign EXE_ready_go = 1'b1;
  assign MEM_ready_go = 1'b1;
  assign WB_ready_go  = 1'b1;

  // IF阶段：无分支预测
  IF u_IF(
      .reset     (reset   ),
      .clk       (clk     ),
      .br_taken  (br_taken),
      .br_target (br_target),
      .IF_ready_go(IF_ready_go),
      .pc        (pc      )
  );

  // 指令端口连接
  assign inst_sram_en   = reset ? 1'b0 : inst_en;
  assign inst_sram_addr = pc;

  // ID前寄存器（IF->ID)
  reg [31:0] pc_buf_ID;
  always @(posedge clk) begin
      if (IF_ready_go) begin
          pc_buf_ID <= pc;//寄存器-PC值
          inst_reg  <= inst_sram_rdata;//寄存器-指令内容
      end
      else begin
          pc_buf_ID <= pc_buf_ID;
          inst_reg  <= inst;
      end
  end

  assign inst = IF_ready_go_reg ? inst_sram_rdata : inst_reg;

  // ID模块（仅保留12条指令）
  ID u_ID(
      .reset        (reset       ),
      .clk          (clk         ),
      .inst         (inst        ),
      .pc_buf_ID    (pc_buf_ID   ),
      .rf_wdata     (rf_wdata    ),
      .rf_waddr     (rf_waddr    ),
      .rf_we        (rf_we       ),
      .alu_op       (alu_op      ),
      .br_target    (br_target   ),
      .alu_src1     (alu_src1    ),
      .alu_src2     (alu_src2    ),
      .rf_waddr_willused (rf_waddr_willused),
      .rf_raddr1    (rf_raddr1   ),
      .rf_raddr2    (rf_raddr2   ),
      .res_from_mem (res_from_mem),
      .br_taken     (br_taken    ),
      .data_sram_we_buf (data_sram_we_buf),
      .data_sram_wdata_buf (data_sram_wdata_buf),
      .rf_we_willused  (rf_we_willused),
      .IF_ready_go  (IF_ready_go ),
      .valid_out    (valid_out   ),
      .ld_src       (ld_src      ),
      .wdata_src    (wdata_src   ),
      .EXE_result   (alu_result  ),             // alu_result 来自 EXE 的 alu_1 模块
      .rf_we_EXE    (rf_we_buf_EXE),
      .rf_waddr_EXE (rf_waddr_willused_buf_EXE),
      .need_data_sram_ID(need_data_sram_ID)
  );

  // EXE阶段寄存（ID->EXE）
  reg [31:0] pc_buf_EXE;
  always @(posedge clk) begin
      if (reset) begin
          alu_op_buf_EXE            <= 19'b0;
          alu_src1_buf_EXE          <= 32'b0;
          alu_src2_buf_EXE          <= 32'b0;
          rf_waddr_willused_buf_EXE <= 5'b00000;
          res_from_mem_buf_EXE      <= 1'b0;
          rf_we_buf_EXE             <= 1'b0;
          data_sram_we_buf_EXE      <= 1'b0;
          data_sram_wdata_buf_EXE   <= 32'b0;

          pc_buf_EXE                <= 32'b0;
          EXE_invaild               <= 1'b0;
          ld_src_buf_EXE            <= 5'b00001;
          wdata_src_buf_EXE         <= 4'b0001;
          need_data_sram_EXE        <= 1'b0;
      end
      else if (!EXE_ready_go) begin
          EXE_invaild               <= 1'b0;
      end
      else if (!ID_ready_go) begin
        // ID 阻塞时，把 EXE 注入空指令（插入气泡）
          alu_op_buf_EXE            <= 19'b0;
          alu_src1_buf_EXE          <= 32'b0;
          alu_src2_buf_EXE          <= 32'b0;
          rf_waddr_willused_buf_EXE <= 5'b00000;
          res_from_mem_buf_EXE      <= 1'b0;
          rf_we_buf_EXE             <= 1'b0;
          data_sram_we_buf_EXE      <= 1'b0;
          data_sram_wdata_buf_EXE   <= 32'b0;

          pc_buf_EXE                <= 32'b0;
          EXE_invaild               <= 1'b1;
          ld_src_buf_EXE            <= 5'b00001;
          wdata_src_buf_EXE         <= 4'b0001;
          need_data_sram_EXE        <= 1'b0;
      end
      else begin
           // 正常从 ID 传入指令
          alu_op_buf_EXE            <= alu_op;//ALU 操作码
          alu_src1_buf_EXE          <= alu_src1;//
          alu_src2_buf_EXE          <= alu_src2;//ALU 两个操作数
          rf_waddr_willused_buf_EXE <= rf_waddr_willused;//目的寄存器号
          res_from_mem_buf_EXE      <= res_from_mem;//是否是 load 指令
          rf_we_buf_EXE             <= rf_we_willused;//是否写回寄存器
          data_sram_we_buf_EXE      <= data_sram_we_buf;//是否写数据存储器
          data_sram_wdata_buf_EXE   <= data_sram_wdata_buf;//写入数据存储器的数据

          pc_buf_EXE                <= pc_buf_ID;//指令的 PC
          EXE_invaild               <= 1'b0;//load 类型选择（本实验只用字）
          ld_src_buf_EXE            <= ld_src;//store 类型选择（本实验只用字）
          wdata_src_buf_EXE         <= wdata_src;//是否需要访问数据存储器
          need_data_sram_EXE        <= need_data_sram_ID;//标记是否插入空拍
      end
  end

  // ALU
  alu_1 u_alu(
      .clk        (clk               ),
      .alu_op     (alu_op_buf_EXE    ),
      .alu_src1   (alu_src1_buf_EXE  ),
      .alu_src2   (alu_src2_buf_EXE  ),
      .alu_result (alu_result        ),
      .div_wating (div_wating        )
  );

  // MEM阶段寄存（EXE->MEM）
  always @(posedge clk) begin
      if (EXE_invaild | reset | !EXE_ready_go) begin
          alu_result_buf_MEM        <= 32'b0;
          res_from_mem_buf_MEM      <= 1'b0;
          rf_waddr_willused_buf_MEM <= 5'b00000;
          rf_we_buf_MEM             <= 1'b0;

          pc_buf_MEM                <= 32'b0;
          ld_src_buf_MEM            <= 5'b00000;
      end
      else begin
          alu_result_buf_MEM        <= alu_result;//ALU 计算结果
          res_from_mem_buf_MEM      <= res_from_mem_buf_EXE;//是否是 load 指令
          rf_waddr_willused_buf_MEM <= rf_waddr_willused_buf_EXE;//目的寄存器号
          rf_we_buf_MEM             <= rf_we_buf_EXE;//是否写回寄存器

          pc_buf_MEM                <= pc_buf_EXE;//指令的 PC
          ld_src_buf_MEM            <= ld_src_buf_EXE;//load 类型选择
      end
  end

  // 字节选择（仅保留字访问，逻辑保留避免结构变更）
  assign mem_src1        = alu_result[1:0];
  assign mem_src2        = alu_result_buf_MEM[1:0];

  assign data_sram_we_b = (mem_src1 == 2'b00) ? 4'b0001 :
                          (mem_src1 == 2'b01) ? 4'b0010 :
                          (mem_src1 == 2'b10) ? 4'b0100 :
                          (mem_src1 == 2'b11) ? 4'b1000 : 4'b0000;
  assign data_sram_we_h = (mem_src1 == 2'b00) ? 4'b0011 :
                          (mem_src1 == 2'b10) ? 4'b1100 : 4'b0000;

  assign data_sram_we_bhw = wdata_src_buf_EXE[3] ? 4'b1111 : 4'b0000;

  assign data_sram_en    = reset ? 1'b0 : need_data_sram_EXE;
  assign data_sram_wen   = data_sram_we_buf_EXE ? data_sram_we_bhw : 4'b0000;
  assign data_sram_addr  = {alu_result[31:2], 2'b00};
  assign data_sram_wdata = data_sram_wdata_buf_EXE;

  assign mem_u1 = (mem_src2 == 2'b00) ? data_sram_rdata[7:0]  :
                  (mem_src2 == 2'b01) ? data_sram_rdata[15:8] :
                  (mem_src2 == 2'b10) ? data_sram_rdata[23:16]:
                  (mem_src2 == 2'b11) ? data_sram_rdata[31:24]: 8'b0;

  assign mem_u2 = (mem_src2 == 2'b00) ? data_sram_rdata[15:0] :
                  (mem_src2 == 2'b10) ? data_sram_rdata[31:16]: 16'b0;

  // 本实验仅ld.w，直接取整字
  assign mem_result = data_sram_rdata;

  assign final_result = res_from_mem_buf_MEM ? mem_result : alu_result_buf_MEM;
  assign rf_wdata     = final_result;

  // WB阶段寄存（MEM->WB）
  reg        WB_rf_we;//写回寄存器使能
  reg [4:0]  WB_rf_waddr;//写回寄存器号
  reg [31:0] WB_rf_wdata;//写回数据
  reg [31:0] WB_pc;//指令的 PC

  always @(posedge clk) begin
      if (reset | !MEM_ready_go) begin
          WB_rf_we    <= 1'b0;
          WB_rf_waddr <= 5'b00000;
          WB_rf_wdata <= 32'b0;
          WB_pc       <= 32'b0;
      end
      else begin
          WB_rf_we    <= rf_we_buf_MEM;
          WB_rf_waddr <= rf_waddr_willused_buf_MEM;
          WB_rf_wdata <= rf_wdata;
          WB_pc       <= pc_buf_MEM;
      end
  end

  // 写回端口
  assign rf_waddr = rf_waddr_willused_buf_MEM;
  assign rf_we    = rf_we_buf_MEM;

  // debug接口
  assign debug_wb_pc       = WB_pc;
  assign debug_wb_rf_wen   = (WB_rf_waddr == 5'b00000) ? 1'b0 : WB_rf_we;
  assign debug_wb_rf_wnum  = WB_rf_waddr;
  assign debug_wb_rf_wdata = WB_rf_wdata;

endmodule
