

module cpu(
    input           clk,                // 时钟信号
    input           resetn,             // 低有效复位信号

    output          inst_sram_en,       // 指令存储器读使能
    output[31:0]    inst_sram_addr,     // 指令存储器读地址
    input[31:0]     inst_sram_rdata,    // 指令存储器读出的数据

    output          data_sram_en,       // 数据存储器端口读/写使能
    output[3:0]     data_sram_wen,      // 数据存储器写使能
    output[31:0]    data_sram_addr,     // 数据存储器读/写地址
    output[31:0]    data_sram_wdata,    // 写入数据存储器的数据
    input[31:0]     data_sram_rdata,    // 数据存储器读出的数据

    // 供自动测试环境进行CPU正确性检查
    output[31:0]    debug_wb_pc,        // 当前正在执行指令的PC
    output          debug_wb_rf_wen,    // 当前通用寄存器组的写使能信号
    output[4:0]     debug_wb_rf_wnum,   // 当前通用寄存器组写回的寄存器编号
    output[31:0]    debug_wb_rf_wdata   // 当前指令需要写回的数据
);

  reg reset;
  always @(posedge clk) begin
        if (~resetn) begin
            reset <= 1'b1;
        end else begin
            reset <= 1'b0;
        end
    end

  // IF
  wire if_id_valid;
  wire [96:0] if_id_bus;

  // ID
  wire id_ready;
  wire id_ex_valid;
  wire [153:0] id_ex_bus;
  wire [68:0] id_if_bus;

  // EXE
  wire ex_ready;
  wire ex_mem_valid;
  wire ex_valid;
  wire [37:0] ex_id_bypass_bus;
  wire ex_is_load;
  wire [70:0] ex_mem_bus;

  // MEM
  wire mem_ready;
  wire mem_wb_valid;
  wire mem_valid;
  wire [37:0] mem_id_bypass_bus;
  wire [69:0] mem_wb_bus;

  // WB
  wire wb_ready;
  wire [37:0] wb_id_bus;
  wire wb_valid;

  // 连接IF阶段
  IF IF (
      .clk(clk),
      .reset(reset),
      .id_ready(id_ready),
      .if_id_valid(if_id_valid),
      .if_id(if_id_bus),
      .id_if(id_if_bus),
      .inst_sram_en(inst_sram_en),
      .inst_sram_addr(inst_sram_addr),
      .inst_sram_rdata(inst_sram_rdata)
  );

  // 连接ID阶段
  id id (
      .clk(clk),
      .reset(reset),
      .id_ready(id_ready),
      .ex_ready(ex_ready),
      .if_id_valid(if_id_valid),
      .id_ex_valid(id_ex_valid),
      .ex_valid(ex_valid),
      .mem_valid(mem_valid),
      .wb_valid(wb_valid),
      .ex_is_load(ex_is_load),
      .ex_id_bypass_bus(ex_id_bypass_bus),
      .mem_id_bypass_bus(mem_id_bypass_bus),

      .if_id(if_id_bus),
      .id_ex(id_ex_bus),
      .id_if(id_if_bus),
      .wb_id(wb_id_bus)
  );

  // 连接EXE阶段
  exe exe (
      .clk(clk),
      .reset(reset),
      .ex_ready(ex_ready),
      .id_ex_valid(id_ex_valid),
      .mem_ready(mem_ready),
      .ex_mem_valid(ex_mem_valid),
      .ex_valid(ex_valid),
      .ex_id_bypass_bus(ex_id_bypass_bus),
      .ex_is_load(ex_is_load),
      .id_ex(id_ex_bus),
      .ex_mem(ex_mem_bus),
      .data_sram_en(data_sram_en),
      .data_sram_we(data_sram_wen),
      .data_sram_addr(data_sram_addr),
      .data_sram_wdata(data_sram_wdata)
  );

  // 连接MEM阶段
  mem mem (
      .clk(clk),
      .reset(reset),
      .mem_ready(mem_ready),
      .wb_ready(wb_ready),
      .ex_mem_valid(ex_mem_valid),
      .mem_wb_valid(mem_wb_valid),
      .mem_valid(mem_valid),
      .ex_mem(ex_mem_bus),
      .mem_wb(mem_wb_bus),
      .mem_id_bypass_bus(mem_id_bypass_bus),
      .data_sram_rdata(data_sram_rdata)
  );

  // 连接WB阶段
  wb wb (
      .clk(clk),
      .reset(reset),
      .wb_ready(wb_ready),
      .mem_wb_valid(mem_wb_valid),
      .wb_valid(wb_valid),
      .mem_wb(mem_wb_bus),
      .wb_id(wb_id_bus),
      .debug_wb_pc(debug_wb_pc),
      .debug_wb_rf_wen(debug_wb_rf_wen), // 转换为4位
      .debug_wb_rf_wnum(debug_wb_rf_wnum),
      .debug_wb_rf_wdata(debug_wb_rf_wdata)
  );

endmodule