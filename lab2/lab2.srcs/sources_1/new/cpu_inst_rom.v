`timescale 1ns / 1ps

module cpu_inst_rom (
    input  [ 1:0] sel,
    input  [ 6:0] addr,
    output [31:0] data
);

  wire [31:0] inst0;
  wire [31:0] inst1;
  wire [31:0] inst2;
  wire [31:0] inst3;

  cpu_inst0_rom i0 (
      .a  (addr[4:0]),
      .spo(inst0)
  );

  cpu_inst1_rom i1 (
      .a  (addr[4:0]),
      .spo(inst1)
  );

  cpu_inst2_rom i2 (
      .a  (addr[4:0]),
      .spo(inst2)
  );

  cpu_inst3_rom i3 (
      .a  (addr[6:0]),
      .spo(inst3)
  );

  assign data =
    {32{sel == 2'b00}} & inst0 |
    {32{sel == 2'b01}} & inst1 |
    {32{sel == 2'b10}} & inst2 |
    {32{sel == 2'b11}} & inst3 ;

endmodule
