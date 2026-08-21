`timescale 1ns / 1ps

/*
    By ywy_c_asm
    Alter by zyj
    Pipeline CPU lab checker

    address space:
        0xXXXX0000: test end register (write only)
        0xXXXX0004: simulation register (read only)
        0xXXXX0008: status register ([0]: if end, [1]: if wa, [2]: if tle) (read only)
        0xXXXX000c: last accepted PC (read only)
        0xXXXX0010: error instruction (read only)
        0xXXXX0014: error pc (read only)
        0xXXXX0018: error waddr (read only)
        0xXXXX001c: error wdata (read only)
        0xXXXX0020: ans instruction (read only)
        0xXXXX0024: ans pc (read only)
        0xXXXX0028: ans waddr (read only)
        0xXXXX002c: ans wdata (read only)
        0xXXXX0030: counter (read only)
        0xXXXX0034: sel (read only)
        0xXXXX0038: cons counter (read only)
        0xXXXX003c: limit counter (read only)
*/

`define ANS0_LENGTH 32'd356
`define ANS1_LENGTH 32'd653
`define ANS2_LENGTH 32'd852
`define ANS3_LENGTH 32'd7608

`define LIMIT0 32'd550
`define LIMIT1 32'd1600
`define LIMIT2 32'd1900
`define LIMIT3 32'd15475

`define ADDR_TESTEND 16'h0000
`define ADDR_SIM 16'h0004
`define ADDR_STATUS 16'h0008
`define ADDR_LASTPC 16'h000c
`define ADDR_ERRINST 16'h0010
`define ADDR_ERRPC 16'h0014
`define ADDR_ERRWADDR 16'h0018
`define ADDR_ERRWDATA 16'h001c
`define ADDR_ANSINST 16'h0020
`define ADDR_ANSPC 16'h0024
`define ADDR_ANSWADDR 16'h0028
`define ADDR_ANSWDATA 16'h002c
`define ADDR_COUNTER 16'h0030
`define ADDR_SEL 16'h0034
`define ADDR_C_COUNTER 16'h0038
`define ADDR_L_COUNTER 16'h003c

`define NULL_PC 32'hfffffffc

module cpu_checker #(
    parameter integer SIMULATION = 0
) (
    input clk,
    input resetn,

    input [1:0] sel,

    input         checker_rvalid,
    output        checker_rready,
    input  [31:0] checker_raddr,
    output [31:0] checker_rdata,
    input         checker_wen,
    input  [31:0] checker_waddr,
    input  [31:0] checker_wdata,

    // debug signals
    input [31:0] debug_wb_pc,  // 当前正在执行指令的PC
    input           debug_wb_rf_wen ,  // 当前通用寄存器组的写使能信号
    input [4 :0]    debug_wb_rf_addr,  // 当前通用寄存器组写回的寄存器编号
    input [31:0]    debug_wb_rf_wdata  // 当前指令�??要写回的数据
);

  wire [31:0] ans_length =
    {32{sel == 2'd0}} & `ANS0_LENGTH |
    {32{sel == 2'd1}} & `ANS1_LENGTH |
    {32{sel == 2'd2}} & `ANS2_LENGTH |
    {32{sel == 2'd3}} & `ANS3_LENGTH ;

  reg [31:0] dbg_pc;
  reg dbg_wen;
  reg [4:0] dbg_addr;
  reg [31:0] dbg_wdata;
  always @(posedge clk) begin
    if (~resetn) begin
      dbg_pc <= 0;
      dbg_wen <= 0;
      dbg_addr <= 0;
      dbg_wdata <= 0;
    end else begin
      dbg_pc <= debug_wb_pc;
      dbg_wen <= debug_wb_rf_wen;
      dbg_addr <= debug_wb_rf_addr;
      dbg_wdata <= debug_wb_rf_wdata;
    end
  end

  reg  [31:0] testend;
  reg  [31:0] sim;
  reg  [31:0] status;
  reg  [31:0] lastpc;
  reg  [31:0] errinst;
  reg  [31:0] errpc;
  reg  [31:0] errwaddr;
  reg  [31:0] errwdata;
  reg  [31:0] ansinst;
  reg  [31:0] anspc;
  reg  [31:0] answaddr;
  reg  [31:0] answdata;
  reg  [31:0] counter;
  reg  [31:0] cons_counter;
  wire [31:0] limit =
    {32{sel == 2'd0}} & `LIMIT0 |
    {32{sel == 2'd1}} & `LIMIT1 |
    {32{sel == 2'd2}} & `LIMIT2 |
    {32{sel == 2'd3}} & `LIMIT3 ;

  always @(posedge clk) begin
    if (~resetn) counter <= 0;
    else counter <= counter + 1;
  end

  wire fin = status[2] | status[1] | status[0];

  initial begin
    sim = SIMULATION;
  end

  always @(posedge clk) begin
    if (SIMULATION) begin
      if (testend) begin
        $finish;
      end
    end
  end

  assign checker_rready = checker_rvalid;

  reg [31:0] rdata;
  assign checker_rdata = rdata;
  always_comb begin
    case (checker_raddr[15:0])
      `ADDR_TESTEND:   rdata = testend;
      `ADDR_SIM:       rdata = sim;
      `ADDR_STATUS:    rdata = status;
      `ADDR_LASTPC:    rdata = lastpc;
      `ADDR_ERRINST:   rdata = errinst;
      `ADDR_ERRPC:     rdata = errpc;
      `ADDR_ERRWADDR:  rdata = errwaddr;
      `ADDR_ERRWDATA:  rdata = errwdata;
      `ADDR_ANSINST:   rdata = ansinst;
      `ADDR_ANSPC:     rdata = anspc;
      `ADDR_ANSWADDR:  rdata = answaddr;
      `ADDR_ANSWDATA:  rdata = answdata;
      `ADDR_COUNTER:   rdata = counter;
      `ADDR_SEL:       rdata = {30'b0, sel};
      `ADDR_C_COUNTER: rdata = cons_counter;
      `ADDR_L_COUNTER: rdata = limit;
      default:         rdata = 0;
    endcase
  end

  always @(posedge clk) begin
    if (~resetn) testend <= 0;
    else begin
      if (checker_wen & (checker_waddr[15:0] == `ADDR_TESTEND)) testend <= checker_wdata;
    end
  end

  wire [31:0] a_pc;
  wire [ 4:0] a_waddr;
  wire [31:0] a_wdata;
  wire [31:0] a_inst;
  cpu_inst_rom ir_ans (
      .addr(a_pc[8:2]),
      .data(a_inst),
      .sel (sel)
  );

  wire [31:0] debug_inst;
  cpu_inst_rom ir_debug (
      .addr(dbg_pc[8:2]),
      .data(debug_inst),
      .sel (sel)
  );

  reg  [ 13:0] prev_ptr;
  reg  [ 13:0] ptr;
  wire [63:0] ans_out;

  // wire [63:0] a0, a1, a2;
  wire [13:0] ad = ptr;
  // cpu_ans0_rom _a0 (
  //     .clka (clk),
  //     .addra(ad),
  //     .douta(a0)
  // );
  // cpu_ans1_rom _a1 (
  //     .clka (clk),
  //     .addra(ad),
  //     .douta(a1)
  // );
  // cpu_ans2_rom _a2 (
  //     .clka (clk),
  //     .addra(ad),
  //     .douta(a2)
  // );
  // assign ans_out = (sel == 0) ? a0 : ((sel == 1) ? a1 : a2);
  cpu_ans_rom _a (
      .clk (clk),
      .addr(ad),
      .data(ans_out),
      .sel (sel)
  );

  assign a_wdata = ans_out[31:0];
  assign a_waddr = ans_out[36:32];
  assign a_pc = {16'b0, ans_out[52:37]};

  wire eof = prev_ptr == (ans_length - 1);
  wire err = (a_pc != dbg_pc) | (a_waddr != dbg_addr) | (a_wdata != dbg_wdata);
  wire tle = counter > 32'd100000;

  always @(posedge clk) begin
    if (~resetn) cons_counter <= 0;
    else if ((err | eof) & ~fin) cons_counter <= counter;
  end

  always @(posedge clk) begin
    if (~resetn) begin
      ptr <= 0;
      prev_ptr <= 0;
      status <= 0;
      lastpc <= `NULL_PC;
      errinst <= 0;
      errpc <= `NULL_PC;
      errwaddr <= 0;
      errwdata <= 0;
      ansinst <= 0;
      anspc <= `NULL_PC;
      answaddr <= 0;
      answdata <= 0;
    end else begin
      if (~fin) begin
        if (SIMULATION) begin
          if ($isunknown(debug_wb_rf_wen)) begin
            $display("---------------------------");
            $display("Simulator: Detect unknown debug_wb_rf_wen=%b at %d ns", debug_wb_rf_wen,
                     $time);
            $display("Simulator: Simulation stopped. Check your CPU :-(");
            $display("---------------------------");
            $finish;
          end else if (debug_wb_rf_wen && ($isunknown(
                  debug_wb_pc
              ) || $isunknown(
                  debug_wb_rf_addr
              ) || $isunknown(
                  debug_wb_rf_wdata
              ))) begin
            $display("---------------------------");
            $display("Simulator: Detect unknown signals at %d ns", $time);
            $display("Simulator: debug_wb_pc=0x%h, debug_wb_rf_addr=0x%h, debug_wb_rf_wdata=0x%h",
                     debug_wb_pc, debug_wb_rf_addr, debug_wb_rf_wdata);
            $display("Simulator: Simulation stopped. Check your CPU :-(");
            $display("---------------------------");
            $finish;
          end
        end

        if (tle) begin
          status <= 32'b101;
          if (SIMULATION) begin
            $display("Simulator: Time limit exceeded at %d ns", $time);
          end
        end else begin
          if (debug_wb_rf_wen) begin
            ptr <= ptr + 1;
            prev_ptr <= ptr;
          end
          if (dbg_wen) begin
            status <= {30'b0, err, err | eof};
            lastpc <= anspc;
            errinst <= debug_inst;
            errpc <= dbg_pc;
            errwaddr <= dbg_addr;
            errwdata <= dbg_wdata;
            ansinst <= a_inst;
            anspc <= a_pc;
            answaddr <= a_waddr;
            answdata <= a_wdata;

            if (SIMULATION & err) begin
              $display("---------------------------");
              $display("Simulator: Wrong answer at %d ns", $time);
            end
          end
        end
      end
    end
  end


endmodule
