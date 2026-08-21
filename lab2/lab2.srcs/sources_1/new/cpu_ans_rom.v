
`timescale 1ns / 1ps

module cpu_ans_rom (

    // READ latency = 1
    input         clk,
    input  [ 1:0] sel,
    input  [13:0] addr,
    output [63:0] data
);

  wire [63:0] ans0;
  wire [63:0] ans1;
  wire [63:0] ans2;
  wire [63:0] ans3;

  cpu_ans0_rom _a0 (
      .clka (clk),
      .addra(addr[9:0]),
      .douta(ans0)
  );
  cpu_ans1_rom _a1 (
      .clka (clk),
      .addra(addr[9:0]),
      .douta(ans1)
  );
  cpu_ans2_rom _a2 (
      .clka (clk),
      .addra(addr[9:0]),
      .douta(ans2)
  );
  cpu_ans3_rom _a3 (
      .clka (clk),
      .addra(addr[13:0]),
      .douta(ans3)
  );

  assign data =
    {64{sel == 2'b00}} & ans0 |
    {64{sel == 2'b01}} & ans1 |
    {64{sel == 2'b10}} & ans2 |
    {64{sel == 2'b11}} & ans3 ;

endmodule
