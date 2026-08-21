module alu_1(
  input  clk,
  input  wire [18:0] alu_op,
  input  wire [31:0] alu_src1,
  input  wire [31:0] alu_src2,
  output wire [31:0] alu_result,
  output div_wating
);

  // 仅保留本实验需要的操作
  wire op_add;   // add / addi / 地址计算
  wire op_sub;   // sub
  wire op_slt;   // slti（有符号小于）
  wire op_and;   // and
  wire op_or;    // ori
  wire op_sll;   // slli
  wire op_mul;   // mul.w

  // 映射到ID给出的bit（沿用原位号以减少管线变更）
  assign op_add  = alu_op[ 0];
  assign op_sub  = alu_op[ 1];
  assign op_slt  = alu_op[ 2];
  assign op_and  = alu_op[ 4];
  assign op_or   = alu_op[ 6];
  assign op_sll  = alu_op[ 8];
  assign op_mul  = alu_op[12];

  // 32-bit 加/减与比较
  wire [31:0] adder_a   = alu_src1;
  wire [31:0] adder_b   = (op_sub | op_slt) ? ~alu_src2 : alu_src2;
  wire        adder_cin = (op_sub | op_slt) ? 1'b1      : 1'b0;
  wire [32:0] add_chain = {1'b0, adder_a} + {1'b0, adder_b} + adder_cin;
  wire [31:0] add_sub_result = add_chain[31:0];
  wire        adder_cout      = add_chain[32];

  // slt（有符号比较：src1<src2 => 1）
  wire [31:0] slt_result;
  assign slt_result[31:1] = 31'b0;
  assign slt_result[0]    = (alu_src1[31] & ~alu_src2[31])
                          | ((alu_src1[31] ~^ alu_src2[31]) & add_sub_result[31]);

  // 位操作
  wire [31:0] and_result = alu_src1 & alu_src2;
  wire [31:0] or_result  = alu_src1 | alu_src2;

  // 左移（逻辑）
  wire [31:0] sll_result = alu_src1 << alu_src2[4:0];

  // 乘法（32x32 -> 32：低32位），mul.w为有符号乘法
  wire [63:0] mul_total = $signed(alu_src1) * $signed(alu_src2);
  wire [31:0] mul_result = mul_total[31:0];

  // 本实验不实现除法，始终不等待
  assign div_wating = 1'b0;

  // 结果选择
  assign alu_result =
      ({32{op_add}} & add_sub_result)
    | ({32{op_sub}} & add_sub_result)
    | ({32{op_slt}} & slt_result)
    | ({32{op_and}} & and_result)
    | ({32{op_or }} & or_result)
    | ({32{op_sll}} & sll_result)
    | ({32{op_mul}} & mul_result);

endmodule
