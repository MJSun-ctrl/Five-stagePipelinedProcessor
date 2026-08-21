
`timescale 1ns / 1ps

/*
    By ywy_c_asm
    uart by wxz 2025.9.19
    ????LCD????????????????0x0008???????????????????????
    ???????????
    ??????SoC???LCD??????
    ???????????16????32????????
        0x0000: ??????????0??????????????(default)??1??????????????
        0x0004: ??????????????8????0~3??????4~7??????
        0x0008: ??????????????8????????8??????????8????????8????
        0x000c: ????????????????16????????
        0x0010: ??????????16????16??
        0x0014: ????????????16?y??16?x
        0x0018: dma address
        0x001c: dma length, ???????dma
        0x0020: dma ack, ???ack dma??
        0x0024: dma region topleft, ????16?y??16?x
        0x0028: dma region bottomright, ????16?y??16?x
*/

`define UARTADDR_CHAR 16'h0008

module uart_controller (
    input aclk,     //=50MHz
    input aresetn,
    input sim,

    //ar
    input  [ 5:0] arid,
    input  [31:0] araddr,
    input  [ 3:0] arlen,
    input  [ 2:0] arsize,
    input  [ 1:0] arburst,
    input  [ 1:0] arlock,
    input  [ 3:0] arcache,
    input  [ 2:0] arprot,
    input         arvalid,
    output        arready,
    //r
    output [ 5:0] rid,
    output [31:0] rdata,
    output [ 1:0] rresp,
    output        rlast,
    output        rvalid,
    input         rready,
    //aw
    input  [ 5:0] awid,
    input  [31:0] awaddr,
    input  [ 3:0] awlen,
    input  [ 2:0] awsize,
    input  [ 1:0] awburst,
    input  [ 1:0] awlock,
    input  [ 3:0] awcache,
    input  [ 2:0] awprot,
    input         awvalid,
    output        awready,
    //w
    input  [ 5:0] wid,
    input  [31:0] wdata,
    input  [ 3:0] wstrb,
    input         wlast,
    input         wvalid,
    output        wready,
    //b
    output [ 5:0] bid,
    output [ 1:0] bresp,
    output        bvalid,
    input         bready,

    //uart
    output reg       uart_tx_send,
    output reg [7:0] uart_tx_byte,
    input            uart_tx_busy,
    input            uart_tx_done
);
  reg [3:0] state;
  reg [5:0] cached_id;
  reg [31:0] cached_addr;
  reg [31:0] cached_wdata;
  reg [3:0] cached_len;

  wire need_uart;
  assign need_uart = cached_addr[15:0] == `UARTADDR_CHAR;

  assign arready = 0;
  assign rid = cached_id;
  assign rresp = 0;
  assign rlast = 0 & (cached_len == 0);
  assign rvalid = 0;
  assign awready = (state == 4'd6);
  assign wready = (state == 4'd3);
  assign bid = cached_id;
  assign bresp = 0;
  assign bvalid = (state == 4'd5);

  always @(posedge aclk) begin
    if (~aresetn) begin
      state <= 4'd6;
      cached_id <= 0;
      cached_addr <= 0;
      cached_len <= 0;
      cached_wdata <= 0;
      uart_tx_send <= 1'b0;
      uart_tx_byte <= 8'b0;
    end else begin
      case (state)
        4'd3: begin
          if (wvalid) cached_wdata <= wdata;
          if (wlast & wvalid) state <= 4'd4;
        end
        4'd4: begin
          if (sim) begin
            if (cached_addr[15:0] == `UARTADDR_CHAR) begin
              $write("%c", cached_wdata[7:0]);
            end
            state <= 4'd5;
          end else if (cached_addr[15:0] == `UARTADDR_CHAR) begin
            if (uart_tx_done) begin
              uart_tx_send <= 1'b0;
              state <= 4'd5;
            end else if (!uart_tx_busy & !uart_tx_send) begin
              uart_tx_send <= 1'b1;
              uart_tx_byte <= cached_wdata[7:0];
            end else begin
              uart_tx_send <= 1'b0;
            end
          end else begin
            state <= 4'd5;
          end
        end
        4'd5: begin
          if (bready) begin
            state <= 4'd6;
          end
        end
        4'd6: begin
          if (awvalid) begin
            state <= 4'd3;
            cached_addr <= awaddr;
            cached_id <= awid;
            cached_len <= awlen;
          end
        end
        default: ;
      endcase
    end
  end


endmodule
