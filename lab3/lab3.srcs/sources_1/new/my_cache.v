module cache (
    input            clk             ,  // 时钟
    input            resetn          ,  // 低有效复位信号

    //  Sram-Like接口信号，用于CPU访问Cache
    input         cpu_req      ,    //由CPU发送至Cache
    input  [31:0] cpu_addr     ,    //由CPU发送至Cache
    output [31:0] cache_rdata  ,    //由Cache返回给CPU
    output        cache_addr_ok,    //由Cache返回给CPU
    output        cache_data_ok,    //由Cache返回给CPU

    //  AXI接口信号，用于Cache访问主存
    output [3 :0] arid   ,              //Cache向主存发起读请求时使用的AXI信道的id号
    output [31:0] araddr ,              //Cache向主存发起读请求时所使用的地址
    output        arvalid,              //Cache向主存发起读请求的请求信号
    input         arready,              //读请求能否被接收的握手信号

    input  [3 :0] rid    ,              //主存向Cache返回数据时使用的AXI信道的id号
    input  [31:0] rdata  ,              //主存向Cache返回的数据
    input         rlast  ,              //是否是主存向Cache返回的最后一个数据
    input         rvalid ,              //主存向Cache返回数据时的数据有效信号
    output        rready                //标识当前的Cache已经准备好可以接收主存返回的数据
);

reg [3:0] stage;
parameter IDLE = 4'b1000,
          SEND = 4'b0100,
          REC  = 4'b0010,
          DONE = 4'b0001;
reg [2:0] offset;

reg [31:0] axi_addr;
reg sel0; // 锁存的替换选择（1->way0, 0->way1）

always @(posedge clk) begin
    if(~resetn) begin
        stage <= IDLE;
        offset <= 3'b0;
        sel0 <= 1'b0;
    end 
    else begin
        case(stage)
            IDLE: begin
                if(miss) begin
                    stage <= SEND;
                    axi_addr <= {cpu_addr[31:5],5'b0}; // 行对齐
                    sel0 <= sel0_replace; // 锁存该组的替换选择（来自 cache_tagv）
                end
            end
            SEND: begin
                if(arready && arvalid) begin
                    stage <= REC;
                    offset <= 3'b0;
                end
            end
            REC: begin
                if(rready & rvalid) begin
                    if(rlast) begin
                        stage <= DONE;
                    end
                    offset <= offset + 3'b1;
                end
            end
            DONE: begin
                stage <= IDLE;
            end
            default: stage <= IDLE;
        endcase
    end
end

assign arid = 4'b0;
assign araddr = axi_addr;
assign arvalid = (stage == SEND);

assign rready = (stage == REC);

wire hit0;
wire hit1;
wire miss;
wire tagv_we;
wire [31:0] tagv_waddr;
wire sel0_replace; // 来自 cache_tagv，表示当前 raddr index 的替换选择

assign tagv_we = (stage == DONE);
assign tagv_waddr = axi_addr;

cache_tagv cache_tagv(
    .clk(clk),
    .resetn(resetn),
    .re(cpu_req),
    .raddr(cpu_addr),
    .hit0(hit0),
    .hit1(hit1),
    .miss(miss),

    .we(tagv_we),
    .sel0(sel0),            // 写入哪一路（顶层锁存）
    .waddr(tagv_waddr),

    .sel0_replace(sel0_replace) // 新增输出：当前组的替换选择
);

cache_data cache_data(
    .clk(clk),
    .resetn(resetn),

    .raddr(cpu_addr),
    .re_way_sel0(hit0),
    .rdata(cache_rdata),

    .we(rvalid & rready),
    .waddr({axi_addr[31:5],offset[2:0],2'b0}),
    .we_way_sel0(sel0),
    .wdata(rdata)
);

assign cache_addr_ok = (stage == IDLE) && (hit0 || hit1);

reg rdata_valid;

always @(posedge clk) begin
    if(~resetn) begin
        rdata_valid <= 1'b0;
    end
    else if(cache_addr_ok) begin
        rdata_valid <= 1'b1;
    end else begin
        rdata_valid <= 1'b0;
    end
end

assign cache_data_ok = rdata_valid;

endmodule
