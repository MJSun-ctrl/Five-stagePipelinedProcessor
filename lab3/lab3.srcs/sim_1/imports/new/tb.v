`timescale 1ns / 1ps

module tb ();

  reg clk;
  reg reset;
  reg [31:0] rstcnt;
  initial begin
    clk = 0;
    reset = 1;
    rstcnt = 0;
  end

  always #5 clk = ~clk;

  wire [31:0] test_id = 0;

  always @(posedge clk) begin
    if (rstcnt == 10) reset <= 0;
    rstcnt <= rstcnt + 1;
  end

  soc_top #(
      .SIMULATION(1)
  ) soc (
      .clk_50M(clk),
      .reset_btn(reset),
      .dip_sw(test_id)
  );

endmodule
