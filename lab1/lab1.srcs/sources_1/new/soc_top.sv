`timescale 1ns / 1ps

/*
    By ywy_c_asm
    Alter by zyj
    Top SoC of programmable checker
        0: 1fc00000-1fcfffff: ram
        1: 1fd00000-1fdfffff: uart
        2: 1fe00000-1fefffff: checker
*/

module soc_top #(
    parameter integer SIMULATION = 0
) (
    input wire clk_50M,     //50MHz 时钟输入
    input wire clk_11M0592, //11.0592MHz 时钟输入（备用，可不用）

    input wire clock_btn,  //BTN5手动时钟按钮�????关，带消抖电路，按下时为1
    input wire reset_btn,  //BTN6手动复位按钮�????关，带消抖电路，按下时为1

    input  wire [ 3:0] touch_btn,  //BTN1~BTN4，按钮开关，按下时为1
    input  wire [31:0] dip_sw,     //32位拨码开关，拨到“ON”时�????1
    output wire [15:0] leds,       //16位LED，输出时1点亮
    output wire [ 7:0] dpy0,       //数码管低位信号，包括小数点，输出1点亮
    output wire [ 7:0] dpy1,       //数码管高位信号，包括小数点，输出1点亮

    //BaseRAM信号
    inout wire [31:0] base_ram_data,  //BaseRAM数据，低8位与CPLD串口控制器共�????
    output wire [19:0] base_ram_addr,  //BaseRAM地址
    output wire[3:0] base_ram_be_n,  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持�????0
    output wire base_ram_ce_n,  //BaseRAM片�?�，低有�????
    output wire base_ram_oe_n,  //BaseRAM读使能，低有�????
    output wire base_ram_we_n,  //BaseRAM写使能，低有�????

    //ExtRAM信号
    inout wire [31:0] ext_ram_data,  //ExtRAM数据
    output wire [19:0] ext_ram_addr,  //ExtRAM地址
    output wire[3:0] ext_ram_be_n,  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持�????0
    output wire ext_ram_ce_n,  //ExtRAM片�?�，低有�????
    output wire ext_ram_oe_n,  //ExtRAM读使能，低有�????
    output wire ext_ram_we_n,  //ExtRAM写使能，低有�????

    //直连串口信号
    output wire txd,  //直连串口发�?�端
    input  wire rxd,  //直连串口接收�????

    //Flash存储器信号，参�?? JS28F640 芯片手册
    output wire [22:0]flash_a,      //Flash地址，a0仅在8bit模式有效�????16bit模式无意�????
    inout wire [15:0] flash_d,  //Flash数据
    output wire flash_rp_n,  //Flash复位信号，低有效
    output wire flash_vpen,  //Flash写保护信号，低电平时不能擦除、烧�????
    output wire flash_ce_n,  //Flash片�?�信号，低有�????
    output wire flash_oe_n,  //Flash读使能信号，低有�????
    output wire flash_we_n,  //Flash写使能信号，低有�????
    output wire flash_byte_n,       //Flash 8bit模式选择，低有效。在使用flash�????16位模式时请设�????1

    //图像输出信号
    output wire [2:0] video_red,    //红色像素�????3�????
    output wire [2:0] video_green,  //绿色像素�????3�????
    output wire [1:0] video_blue,   //蓝色像素�????2�????
    output wire       video_hsync,  //行同步（水平同步）信�????
    output wire       video_vsync,  //场同步（垂直同步）信�????
    output wire       video_clk,    //像素时钟输出
    output wire       video_de      //行数据有效信号，用于区分消隐�????
);

  assign base_ram_ce_n = 1'b1;
  assign base_ram_oe_n = 1'b1;
  assign base_ram_we_n = 1'b1;

  assign ext_ram_ce_n  = 1'b1;
  assign ext_ram_oe_n  = 1'b1;
  assign ext_ram_we_n  = 1'b1;

  reg resetn;
  reg [31:0] rstcnt;
  reg [1:0] sel;

  initial begin
    resetn = 0;
    rstcnt = 0;
  end

  wire sys_clk = clk_50M;
  wire sys_rst = reset_btn;

  always @(posedge sys_clk) begin
    if (sys_rst) begin
      resetn <= 0;
      rstcnt <= 0;
    end else begin
      if (rstcnt == (SIMULATION ? 2 : 1000)) resetn <= 1;
      rstcnt <= rstcnt + 1;
    end
  end

  // wire clk20;
  // clk_pll pll(
  //     .clk_in(sys_clk),
  //     .clk_out(clk20)
  // );
  // wire clk = SIMULATION ? sys_clk : clk20; // when simulation, no underclock
  wire clk = sys_clk;

  always @(posedge clk) begin
    sel <= dip_sw[1:0];
  end

  wire [ 3:0] ram_arid;
  wire [31:0] ram_araddr;
  wire [ 3:0] ram_arlen;
  wire [ 2:0] ram_arsize;
  wire [ 1:0] ram_arburst;
  wire [ 1:0] ram_arlock;
  wire [ 3:0] ram_arcache;
  wire [ 2:0] ram_arprot;
  wire        ram_arvalid;
  wire        ram_arready;
  wire [ 3:0] ram_rid;
  wire [31:0] ram_rdata;
  wire [ 1:0] ram_rresp;
  wire        ram_rlast;
  wire        ram_rvalid;
  wire        ram_rready;

  //aw
  wire [ 3:0] ram_awid;
  wire [31:0] ram_awaddr;
  wire [ 3:0] ram_awlen;
  wire [ 2:0] ram_awsize;
  wire [ 1:0] ram_awburst;
  wire [ 1:0] ram_awlock;
  wire [ 3:0] ram_awcache;
  wire [ 2:0] ram_awprot;
  wire        ram_awvalid;
  wire        ram_awready;
  //w
  wire [ 3:0] ram_wid;
  wire [31:0] ram_wdata;
  wire [ 3:0] ram_wstrb;
  wire        ram_wlast;
  wire        ram_wvalid;
  wire        ram_wready;
  //b
  wire [ 3:0] ram_bid;
  wire [ 1:0] ram_bresp;
  wire        ram_bvalid;
  wire        ram_bready;

  mr_bram ram (
      .s_aclk(clk),
      .s_aresetn(resetn),

      .s_axi_arid(ram_arid),
      .s_axi_araddr(ram_araddr),
      .s_axi_arlen({4'b0, ram_arlen}),
      .s_axi_arsize(ram_arsize),
      .s_axi_arburst(ram_arburst),
      .s_axi_arvalid(ram_arvalid),
      .s_axi_arready(ram_arready),
      .s_axi_rid(ram_rid),
      .s_axi_rdata(ram_rdata),
      .s_axi_rresp(ram_rresp),
      .s_axi_rlast(ram_rlast),
      .s_axi_rvalid(ram_rvalid),
      .s_axi_rready(ram_rready),

      .s_axi_awid(ram_awid),
      .s_axi_awaddr(ram_awaddr),
      .s_axi_awlen({4'b0, ram_awlen}),
      .s_axi_awsize(ram_awsize),
      .s_axi_awburst(ram_awburst),
      .s_axi_awvalid(ram_awvalid),
      .s_axi_awready(ram_awready),
      .s_axi_wdata(ram_wdata),
      .s_axi_wstrb(ram_wstrb),
      .s_axi_wlast(ram_wlast),
      .s_axi_wvalid(ram_wvalid),
      .s_axi_wready(ram_wready),
      .s_axi_bid(ram_bid),
      .s_axi_bresp(ram_bresp),
      .s_axi_bvalid(ram_bvalid),
      .s_axi_bready(ram_bready)
  );

  wire [ 3:0] uart_arid;
  wire [31:0] uart_araddr;
  wire [ 3:0] uart_arlen;
  wire [ 2:0] uart_arsize;
  wire [ 1:0] uart_arburst;
  wire [ 1:0] uart_arlock;
  wire [ 3:0] uart_arcache;
  wire [ 2:0] uart_arprot;
  wire        uart_arvalid;
  wire        uart_arready;
  wire [ 3:0] uart_rid;
  wire [31:0] uart_rdata;
  wire [ 1:0] uart_rresp;
  wire        uart_rlast;
  wire        uart_rvalid;
  wire        uart_rready;

  //aw
  wire [ 3:0] uart_awid;
  wire [31:0] uart_awaddr;
  wire [ 3:0] uart_awlen;
  wire [ 2:0] uart_awsize;
  wire [ 1:0] uart_awburst;
  wire [ 1:0] uart_awlock;
  wire [ 3:0] uart_awcache;
  wire [ 2:0] uart_awprot;
  wire        uart_awvalid;
  wire        uart_awready;
  //w
  wire [ 3:0] uart_wid;
  wire [31:0] uart_wdata;
  wire [ 3:0] uart_wstrb;
  wire        uart_wlast;
  wire        uart_wvalid;
  wire        uart_wready;
  //b
  wire [ 3:0] uart_bid;
  wire [ 1:0] uart_bresp;
  wire        uart_bvalid;
  wire        uart_bready;

  //uart
  wire        uart_tx_send;
  wire [ 7:0] uart_tx_byte;
  wire        uart_tx_busy;
  wire        uart_tx_done;

  uart_controller uart_controller (
      .aclk(clk),
      .aresetn(resetn),
      .sim(SIMULATION),

      // axi
      .arid({2'b0, uart_arid}),
      .araddr(uart_araddr),
      .arlen(uart_arlen),
      .arsize(uart_arsize),
      .arburst(uart_arburst),
      .arlock(uart_arlock),
      .arcache(uart_arcache),
      .arprot(uart_arprot),
      .arvalid(uart_arvalid),
      .arready(uart_arready),
      .rid(uart_rid),
      .rdata(uart_rdata),
      .rresp(uart_rresp),
      .rlast(uart_rlast),
      .rvalid(uart_rvalid),
      .rready(uart_rready),

      .awid({2'b0, uart_awid}),
      .awaddr(uart_awaddr),
      .awlen(uart_awlen),
      .awsize(uart_awsize),
      .awburst(uart_awburst),
      .awlock(uart_awlock),
      .awcache(uart_awcache),
      .awprot(uart_awprot),
      .awvalid(uart_awvalid),
      .awready(uart_awready),
      .wid({2'b0, uart_wid}),
      .wdata(uart_wdata),
      .wstrb(uart_wstrb),
      .wlast(uart_wlast),
      .wvalid(uart_wvalid),
      .wready(uart_wready),
      .bid(uart_bid),
      .bresp(uart_bresp),
      .bvalid(uart_bvalid),
      .bready(uart_bready),

      //uart
      .uart_tx_send(uart_tx_send),
      .uart_tx_byte(uart_tx_byte),
      .uart_tx_busy(uart_tx_busy),
      .uart_tx_done(uart_tx_done)
  );

  uart_tx uart (
      .clock(clk),

      .i_data_avail(uart_tx_send),
      .i_data_byte (uart_tx_byte),

      .o_active(uart_tx_busy),
      .o_tx(txd),
      .o_done(uart_tx_done)
  );


  wire [ 3:0] cpu_arid;
  wire [31:0] cpu_araddr;
  wire [ 3:0] cpu_arlen;
  wire [ 2:0] cpu_arsize;
  wire [ 1:0] cpu_arburst;
  wire [ 1:0] cpu_arlock;
  wire [ 3:0] cpu_arcache;
  wire [ 2:0] cpu_arprot;
  wire        cpu_arvalid;
  wire        cpu_arready;
  wire [ 3:0] cpu_rid;
  wire [31:0] cpu_rdata;
  wire [ 1:0] cpu_rresp;
  wire        cpu_rlast;
  wire        cpu_rvalid;
  wire        cpu_rready;

  //aw
  wire [ 3:0] cpu_awid;
  wire [31:0] cpu_awaddr;
  wire [ 3:0] cpu_awlen;
  wire [ 2:0] cpu_awsize;
  wire [ 1:0] cpu_awburst;
  wire [ 1:0] cpu_awlock;
  wire [ 3:0] cpu_awcache;
  wire [ 2:0] cpu_awprot;
  wire        cpu_awvalid;
  wire        cpu_awready;
  //w
  wire [ 3:0] cpu_wid;
  wire [31:0] cpu_wdata;
  wire [ 3:0] cpu_wstrb;
  wire        cpu_wlast;
  wire        cpu_wvalid;
  wire        cpu_wready;
  //b
  wire [ 3:0] cpu_bid;
  wire [ 1:0] cpu_bresp;
  wire        cpu_bvalid;
  wire        cpu_bready;

  ma_river_core_0 mrcore (
      .ext_int(0),
      .aclk(clk),
      .aresetn(resetn),

      // axi
      .arid(cpu_arid),
      .araddr(cpu_araddr),
      .arlen(cpu_arlen),
      .arsize(cpu_arsize),
      .arburst(cpu_arburst),
      .arlock(cpu_arlock),
      .arcache(cpu_arcache),
      .arprot(cpu_arprot),
      .arvalid(cpu_arvalid),
      .arready(cpu_arready),
      .rid(cpu_rid),
      .rdata(cpu_rdata),
      .rresp(cpu_rresp),
      .rlast(cpu_rlast),
      .rvalid(cpu_rvalid),
      .rready(cpu_rready),

      .awid(cpu_awid),
      .awaddr(cpu_awaddr),
      .awlen(cpu_awlen),
      .awsize(cpu_awsize),
      .awburst(cpu_awburst),
      .awlock(cpu_awlock),
      .awcache(cpu_awcache),
      .awprot(cpu_awprot),
      .awvalid(cpu_awvalid),
      .awready(cpu_awready),
      .wid(cpu_wid),
      .wdata(cpu_wdata),
      .wstrb(cpu_wstrb),
      .wlast(cpu_wlast),
      .wvalid(cpu_wvalid),
      .wready(cpu_wready),
      .bid(cpu_bid),
      .bresp(cpu_bresp),
      .bvalid(cpu_bvalid),
      .bready(cpu_bready)
  );

  wire [ 3:0] checker_arid;
  wire [31:0] checker_araddr;
  wire [ 3:0] checker_arlen;
  wire [ 2:0] checker_arsize;
  wire [ 1:0] checker_arburst;
  wire [ 1:0] checker_arlock;
  wire [ 3:0] checker_arcache;
  wire [ 2:0] checker_arprot;
  wire        checker_arvalid;
  wire        checker_arready;
  wire [ 3:0] checker_rid;
  wire [31:0] checker_rdata;
  wire [ 1:0] checker_rresp;
  wire        checker_rlast;
  wire        checker_rvalid;
  wire        checker_rready;

  //aw
  wire [ 3:0] checker_awid;
  wire [31:0] checker_awaddr;
  wire [ 3:0] checker_awlen;
  wire [ 2:0] checker_awsize;
  wire [ 1:0] checker_awburst;
  wire [ 1:0] checker_awlock;
  wire [ 3:0] checker_awcache;
  wire [ 2:0] checker_awprot;
  wire        checker_awvalid;
  wire        checker_awready;
  //w
  wire [ 3:0] checker_wid;
  wire [31:0] checker_wdata;
  wire [ 3:0] checker_wstrb;
  wire        checker_wlast;
  wire        checker_wvalid;
  wire        checker_wready;
  //b
  wire [ 3:0] checker_bid;
  wire [ 1:0] checker_bresp;
  wire        checker_bvalid;
  wire        checker_bready;

  wire        c_rvalid;
  wire        c_rready;
  wire [31:0] c_raddr;
  wire [31:0] c_rdata;
  wire        c_wen;
  wire [31:0] c_waddr;
  wire [31:0] c_wdata;

  checker_wrapper cw (
      .aclk(clk),
      .aresetn(resetn),

      // axi
      .arid(checker_arid),
      .araddr(checker_araddr),
      .arlen(checker_arlen),
      .arsize(checker_arsize),
      .arburst(checker_arburst),
      .arlock(checker_arlock),
      .arcache(checker_arcache),
      .arprot(checker_arprot),
      .arvalid(checker_arvalid),
      .arready(checker_arready),
      .rid(checker_rid),
      .rdata(checker_rdata),
      .rresp(checker_rresp),
      .rlast(checker_rlast),
      .rvalid(checker_rvalid),
      .rready(checker_rready),

      .awid(checker_awid),
      .awaddr(checker_awaddr),
      .awlen(checker_awlen),
      .awsize(checker_awsize),
      .awburst(checker_awburst),
      .awlock(checker_awlock),
      .awcache(checker_awcache),
      .awprot(checker_awprot),
      .awvalid(checker_awvalid),
      .awready(checker_awready),
      .wid(checker_wid),
      .wdata(checker_wdata),
      .wstrb(checker_wstrb),
      .wlast(checker_wlast),
      .wvalid(checker_wvalid),
      .wready(checker_wready),
      .bid(checker_bid),
      .bresp(checker_bresp),
      .bvalid(checker_bvalid),
      .bready(checker_bready),

      .checker_rvalid(c_rvalid),
      .checker_rready(c_rready),
      .checker_raddr(c_raddr),
      .checker_rdata(c_rdata),
      .checker_wen(c_wen),
      .checker_waddr(c_waddr),
      .checker_wdata(c_wdata)
  );

  axi_bus axib (
      .aclk(clk),
      .aresetn(resetn),

      .s_axi_arid(cpu_arid),
      .s_axi_araddr(cpu_araddr),
      .s_axi_arlen(cpu_arlen),
      .s_axi_arsize(cpu_arsize),
      .s_axi_arburst(cpu_arburst),
      .s_axi_arlock(cpu_arlock),
      .s_axi_arcache(cpu_arcache),
      .s_axi_arprot(cpu_arprot),
      .s_axi_arvalid(cpu_arvalid),
      .s_axi_arready(cpu_arready),
      .s_axi_arqos(0),
      .s_axi_rid(cpu_rid),
      .s_axi_rdata(cpu_rdata),
      .s_axi_rresp(cpu_rresp),
      .s_axi_rlast(cpu_rlast),
      .s_axi_rvalid(cpu_rvalid),
      .s_axi_rready(cpu_rready),
      .s_axi_awid(cpu_awid),
      .s_axi_awaddr(cpu_awaddr),
      .s_axi_awlen(cpu_awlen),
      .s_axi_awsize(cpu_awsize),
      .s_axi_awburst(cpu_awburst),
      .s_axi_awlock(cpu_awlock),
      .s_axi_awcache(cpu_awcache),
      .s_axi_awprot(cpu_awprot),
      .s_axi_awvalid(cpu_awvalid),
      .s_axi_awready(cpu_awready),
      .s_axi_awqos(0),
      .s_axi_wid(cpu_wid),
      .s_axi_wdata(cpu_wdata),
      .s_axi_wstrb(cpu_wstrb),
      .s_axi_wlast(cpu_wlast),
      .s_axi_wvalid(cpu_wvalid),
      .s_axi_wready(cpu_wready),
      .s_axi_bid(cpu_bid),
      .s_axi_bresp(cpu_bresp),
      .s_axi_bvalid(cpu_bvalid),
      .s_axi_bready(cpu_bready),


      .m_axi_arid({checker_arid, uart_arid, ram_arid}),
      .m_axi_araddr({checker_araddr, uart_araddr, ram_araddr}),
      .m_axi_arlen({checker_arlen, uart_arlen, ram_arlen}),
      .m_axi_arsize({checker_arsize, uart_arsize, ram_arsize}),
      .m_axi_arburst({checker_arburst, uart_arburst, ram_arburst}),
      .m_axi_arlock({checker_arlock, uart_arlock, ram_arlock}),
      .m_axi_arcache({checker_arcache, uart_arcache, ram_arcache}),
      .m_axi_arprot({checker_arprot, uart_arprot, ram_arprot}),
      .m_axi_arvalid({checker_arvalid, uart_arvalid, ram_arvalid}),
      .m_axi_arready({checker_arready, uart_arready, ram_arready}),
      .m_axi_rid({checker_rid, uart_rid, ram_rid}),
      .m_axi_rdata({checker_rdata, uart_rdata, ram_rdata}),
      .m_axi_rresp({checker_rresp, uart_rresp, ram_rresp}),
      .m_axi_rlast({checker_rlast, uart_rlast, ram_rlast}),
      .m_axi_rvalid({checker_rvalid, uart_rvalid, ram_rvalid}),
      .m_axi_rready({checker_rready, uart_rready, ram_rready}),
      .m_axi_awid({checker_awid, uart_awid, ram_awid}),
      .m_axi_awaddr({checker_awaddr, uart_awaddr, ram_awaddr}),
      .m_axi_awlen({checker_awlen, uart_awlen, ram_awlen}),
      .m_axi_awsize({checker_awsize, uart_awsize, ram_awsize}),
      .m_axi_awburst({checker_awburst, uart_awburst, ram_awburst}),
      .m_axi_awlock({checker_awlock, uart_awlock, ram_awlock}),
      .m_axi_awcache({checker_awcache, uart_awcache, ram_awcache}),
      .m_axi_awprot({checker_awprot, uart_awprot, ram_awprot}),
      .m_axi_awvalid({checker_awvalid, uart_awvalid, ram_awvalid}),
      .m_axi_awready({checker_awready, uart_awready, ram_awready}),
      .m_axi_wid({checker_wid, uart_wid, ram_wid}),
      .m_axi_wdata({checker_wdata, uart_wdata, ram_wdata}),
      .m_axi_wstrb({checker_wstrb, uart_wstrb, ram_wstrb}),
      .m_axi_wlast({checker_wlast, uart_wlast, ram_wlast}),
      .m_axi_wvalid({checker_wvalid, uart_wvalid, ram_wvalid}),
      .m_axi_wready({checker_wready, uart_wready, ram_wready}),
      .m_axi_bid({checker_bid, uart_bid, ram_bid}),
      .m_axi_bresp({checker_bresp, uart_bresp, ram_bresp}),
      .m_axi_bvalid({checker_bvalid, uart_bvalid, ram_bvalid}),
      .m_axi_bready({checker_bready, uart_bready, ram_bready})
  );


  wire        inst_sram_en;
  wire [31:0] inst_sram_addr;
  reg  [31:0] inst_sram_rdata;
  wire [31:0] inst_sram_out;

  wire        data_sram_en;
  wire [ 3:0] data_sram_wen;
  wire [31:0] data_sram_addr;
  wire [31:0] data_sram_wdata;
  reg  [31:0] data_sram_rdata;
  wire [31:0] data_sram_out;

  wire        inst_addr_valid = ~|inst_sram_addr[31:9];
  wire        data_addr_valid = ~|data_sram_addr[31:9];

  cpu_inst_rom inst_sram (
      .sel (sel),
      .addr(inst_sram_addr[8:2]),
      .data(inst_sram_out)
  );

  cpu_data_ram data_sram (
      .a  (data_sram_addr[8:2]),
      .d  (data_sram_wdata),
      .clk(clk),
      .we (data_sram_en & data_addr_valid & data_sram_wen[0]),
      .spo(data_sram_out)
  );

  always @(posedge clk) begin
    if (~resetn) begin
      inst_sram_rdata <= 0;
      data_sram_rdata <= 0;

      if (SIMULATION) begin
        if ((inst_sram_en === 1'b1) || (data_sram_en === 1'b1)) begin
          $display("---------------------------");
          $display("Simulator: Detect error at %d ns", $time);
          $display("Instruction or Data RAM enable signal shouldn't be 1 during reset!");
          $display("Simulator: Simulation stopped. Check your CPU :-(");
          $display("---------------------------");
          $finish;
        end
      end

    end else begin
      if (inst_sram_en) begin
        if (inst_addr_valid) begin
          inst_sram_rdata <= inst_sram_out;
        end else begin
          inst_sram_rdata <= SIMULATION ? 32'hx : 32'h0;
          if (SIMULATION) begin
            $display("---------------------------");
            $display("Simulator: Detect error at %d ns", $time);
            $display("Instruction fetch address %h is out of range!", inst_sram_addr);
            $display("Simulator: Simulation stopped. Check your CPU :-(");
            $display("---------------------------");
            $finish;
          end
        end
      end

      if (SIMULATION) begin
        if ($isunknown(inst_sram_en)) begin
          $display("---------------------------");
          $display("Simulator: Detect unknown signal inst_sram_en=%b at %d ns", inst_sram_en,
                   $time);
          $display("Simulator: Simulation stopped. Check your CPU :-(");
          $display("---------------------------");
          $finish;
        end else if (inst_sram_en && $isunknown(inst_sram_addr)) begin
          $display("---------------------------");
          $display("Simulator: Detect unknown signal inst_sram_addr=%h at %d ns", inst_sram_addr,
                   $time);
          $display("Simulator: Simulation stopped. Check your CPU :-(");
          $display("---------------------------");
          $finish;
        end
      end

      if (data_sram_en & ~data_sram_wen[0]) begin
        if (data_addr_valid) begin
          data_sram_rdata <= data_sram_out;
        end else begin
          data_sram_rdata <= SIMULATION ? 32'hx : 32'h0;
          if (SIMULATION) begin
            $display("---------------------------");
            $display("Simulator: Detect error at %d ns", $time);
            $display("Data access address %h is out of range!", data_sram_addr);
            $display("Simulator: Simulation stopped. Check your CPU :-(");
            $display("---------------------------");
            $finish;
          end
        end
      end

      if (SIMULATION) begin
        if ($isunknown(data_sram_en)) begin
          $display("---------------------------");
          $display("Simulator: Detect unknown signal data_sram_en=%b at %d ns", data_sram_en,
                   $time);
          $display("Simulator: Simulation stopped. Check your CPU :-(");
          $display("---------------------------");
          $finish;
        end else if (data_sram_en && ($isunknown(
                data_sram_addr
            ) || $isunknown(
                data_sram_wen
            ) || (data_sram_wen[0] && $isunknown(
                data_sram_wdata
            )))) begin
          $display("---------------------------");
          $display("Simulator: Detect unknown signal at %d ns", $time);
          $display("data_sram_addr=%h, data_sram_wen=%b, data_sram_wdata=%h",
                   data_sram_addr, data_sram_wen, data_sram_wdata);
          $display("Simulator: Simulation stopped. Check your CPU :-(");
          $display("---------------------------");
          $finish;
        end
      end
    end
  end

  wire [31:0] debug_wb_pc;
  wire        debug_wb_rf_wen;
  wire [ 4:0] debug_wb_rf_addr;
  wire [31:0] debug_wb_rf_wdata;

  cpu your_cpu (
      .clk(clk),
      .resetn(resetn),
      .inst_sram_en(inst_sram_en),
      .inst_sram_addr(inst_sram_addr),
      .inst_sram_rdata(inst_sram_rdata),
      .data_sram_en(data_sram_en),
      .data_sram_wen(data_sram_wen),
      .data_sram_addr(data_sram_addr),
      .data_sram_wdata(data_sram_wdata),
      .data_sram_rdata(data_sram_rdata),
      .debug_wb_pc(debug_wb_pc),
      .debug_wb_rf_wen(debug_wb_rf_wen),
      .debug_wb_rf_wnum(debug_wb_rf_addr),
      .debug_wb_rf_wdata(debug_wb_rf_wdata)
  );

  cpu_checker #(
      .SIMULATION(SIMULATION)
  ) u_checker (
      .clk(clk),
      .resetn(resetn),
      .sel(sel),

      .checker_rvalid(c_rvalid),
      .checker_rready(c_rready),
      .checker_raddr(c_raddr),
      .checker_rdata(c_rdata),
      .checker_wen(c_wen),
      .checker_waddr(c_waddr),
      .checker_wdata(c_wdata),

      .debug_wb_pc(debug_wb_pc),
      .debug_wb_rf_wen(debug_wb_rf_wen),
      .debug_wb_rf_addr(debug_wb_rf_addr),
      .debug_wb_rf_wdata(debug_wb_rf_wdata)
  );


endmodule
