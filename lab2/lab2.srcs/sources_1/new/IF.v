

module IF (
    input clk,
    input reset,

    // 流水线控制
    input  id_ready,
    output if_id_valid,

    output [96:0] if_id,

    input [68:0] id_if,

    // CPU接口
    output        inst_sram_en,
    output [31:0] inst_sram_addr,
    input  [31:0] inst_sram_rdata
);

  //
  wire        branch_cancel;
  wire [31:0] branch_target;
  wire        update_en;
  wire [31:0] update_pc;
  wire        update_branch_taken;
  wire        update_is_cond;
  wire        update_is_branch;
  
  assign {
      branch_cancel,
      branch_target,
      update_en,
      update_pc,
      update_branch_taken,
      update_is_cond,
      update_is_branch
  } = id_if;

  wire [31:0] next_pc;
  reg  [31:0] if_pc;
  wire [31:0] if_inst;

  wire [31:0] pred_pc;
  wire        pred_taken;
  

  assign if_id = {
        if_pc, 
        if_inst, 
        pred_taken, 
        pred_pc};

  // pipeline control
  reg if_valid;
  wire if_ready;
  wire if_ready_go;

  always @(posedge clk) begin
    if (reset) begin
      if_valid <= 1'b0;
    end else if (if_ready) begin
      if_valid <= 1'b1;
    end else if (branch_cancel) begin
       if_valid <= 1'b0; 
    end
  end

  //PC更新逻辑
  assign next_pc = reset ? 32'h0 : 
                  branch_cancel ? branch_target : 
                  pred_taken ? pred_pc : if_pc + 32'h4;

  // IF stage
  assign if_ready_go = 1'b1;
  assign if_id_valid = if_valid && if_ready_go;
  assign if_ready = !if_valid || (if_ready_go && id_ready);

  always @(posedge clk) begin
    if (reset) begin
      if_pc <= 32'hfffffffc;
    end else if (if_ready) begin
      if_pc <= next_pc;
    end
  end
  
  assign inst_sram_en    = if_ready && !reset;
  assign inst_sram_addr  = next_pc;
  assign if_inst         = inst_sram_rdata;

  
  predictor predictor (
      .clk(clk),
      .resetn(~reset), 
      .pc(if_pc),          // 输入: 当前取指阶段
      .pred_pc(pred_pc),   // 输出: 预测的跳转目标
      .pred_taken(pred_taken),  // 输出: 预测是否跳转
      .update_en(update_en),         // 更新使能
      .update_pc(update_pc),         // 分支指令地址
      .update_is_branch(update_is_branch),  // 是否为分支
      .update_is_cond (update_is_cond),    // 是否为条件
      .update_branch_taken(update_branch_taken),   // 实际跳转结果
      .update_branch_target(branch_target)       // 实际跳转目标
  );
  

endmodule