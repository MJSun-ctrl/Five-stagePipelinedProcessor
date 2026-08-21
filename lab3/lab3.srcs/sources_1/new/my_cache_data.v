module cache_data (
    input          clk        ,  // 时钟
    input          resetn     ,  // 低有效复位信号

    //读端口
    input  [ 31:0] raddr      ,    //由CPU发送至Cache
    input          re_way_sel0,     // 读时选择哪一路（来自 tagv 的 hit0）
    output [ 31:0] rdata      ,     // 返回给 CPU 的数据
    //写端口
    input          we         ,     // 写使能（当 rvalid & rready 时）
    input  [ 31:0] waddr      ,     // 写地址（字地址）
    input  wire    we_way_sel0,     // 写入哪一路（替换选择）
    input  [ 31:0] wdata            // 写入的数据（主存返回）

);

reg r_sel0;                    // 读时选择寄存，和 BRAM 的同步输出对齐
wire [9:0] bram_addr;           // BRAM 的地址宽度 10 位（1024 行）
wire [31:0] rdata0;
wire [31:0] rdata1;
// BRAM 地址：写时用 waddr[11:2]（字地址 >> 2），读时用 raddr[11:2]
assign bram_addr = we ? waddr[11:2] : raddr[11:2];

data_bram data_way0(
    .clka(clk),
    .addra(bram_addr),
    .dina(wdata),
    .douta(rdata0),
    .wea(we & we_way_sel0)// 只有在 we 且 写入选择为 way0 时才写
);

data_bram data_way1(
    .clka(clk),
    .addra(bram_addr),
    .dina(wdata),
    .douta(rdata1),
    .wea(we & ~we_way_sel0)// 写入 way1 的条件
);
// 将读选择寄存一拍，以对齐 BRAM 的同步输出（BRAM 的 douta 在时钟上寄存）
always@(posedge clk) begin
    r_sel0 <= re_way_sel0;
end

assign rdata = r_sel0 ? rdata0 : rdata1;

endmodule
