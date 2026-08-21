/*module cache_tagv (
    input         clk     ,  // 时钟
    input         resetn  ,  // 低有效复位信号

    // cpu 访问信号（用于命中判断）
    input         re      ,  // 读使能（CPU 请求）
    input  [31:0] raddr   ,  // CPU 地址
    output wire   hit0    ,  // 命中 way0
    output wire   hit1    ,  // 命中 way1
    output wire   miss    ,  // 未命中

    // 写端口（来自主存读回完成后写入 tag/valid）
    input         we      ,  // 写使能（在 DONE）
    input         sel0,        // 写入哪一路（顶层锁存的替换选择）
    input  [31:0] waddr   , // 写入地址（用于 tag 与 index）

    // 当 CPU 在 IDLE 检测到 miss 时，顶层需要知道该组应该替换哪一路
    output wire   sel0_replace // combinational: 对应当前 raddr index 的替换选择（1->way0,0->way1）
);

reg [19:0] tag_way0 [127:0]; // 每行 20-bit tag（31:12）
reg [19:0] tag_way1 [127:0];
reg [127:0] valid_way0;      // 每行 valid 位
reg [127:0] valid_way1;

reg [127:0] lru;             // 每组 1 位 LRU：1 表示 way0 是 LRU（下次替换选择 way0），0 表示 way1 是 LRU

wire [6:0] index;
wire [19:0] tag;

genvar i;
generate
    for(i=0; i < 128; i = i + 1) begin
        initial begin
            tag_way0[i] = 20'b0;      // 仿真友好初始化
            tag_way1[i] = 20'b0;
        end
    end
endgenerate

wire [6:0] windex;
assign windex = waddr[11:5];

assign index = raddr[11:5];
assign tag = raddr[31:12];

// 命中判断（组合）
assign hit0 = (tag_way0[index] == tag) && valid_way0[index] && re;
assign hit1 = (tag_way1[index] == tag) && valid_way1[index] && re;

assign miss = re && ~hit0 && ~hit1;

// sel0_replace：当顶层在 IDLE 检测到 miss 时，可以读取该信号决定替换哪一路
// 定义：lru[index] == 1 -> way0 是 LRU -> 选择写入 way0 (sel0 = 1)
assign sel0_replace = lru[index];

integer j;
// 写入处理与 LRU 更新（时序）
always@(posedge clk) begin
    if(~resetn) begin
        valid_way0 <= 128'b0;        // 复位时将所有 Cache 行置为无效
        valid_way1 <= 128'b0;
        lru <= 128'b0;               // 初始都设为 0（表示默认 way1 为 LRU）
        // 可选：显式清 tag（仿真友好），但 valid 已清零即可避免误命中
        for (j = 0; j < 128; j = j + 1) begin
            tag_way0[j] <= 20'b0;
            tag_way1[j] <= 20'b0;
        end
    end
    else begin
        // 1) 命中时更新 LRU：命中某一路则把该路标记为 MRU（另一路为 LRU）
        //    hit0 -> way0 被访问，设置 lru[index] = 0（way1 为 LRU）
        //    hit1 -> way1 被访问，设置 lru[index] = 1（way0 为 LRU）
        if (re) begin
            if (hit0) begin
                lru[index] <= 1'b0;
            end
            else if (hit1) begin
                lru[index] <= 1'b1;
            end
        end

        // 2) miss 填充完成时写入 tag/valid，并更新该组的 LRU（写入后另一路为 LRU）
        if (we) begin
            if (sel0) begin
                valid_way0[windex] <= 1'b1;
                tag_way0[windex] <= waddr[31:12];
                // 写入 way0 后，way0 成为 MRU，另一路 way1 为 LRU -> lru = 0
                lru[windex] <= 1'b0;
            end
            else begin
                valid_way1[windex] <= 1'b1;
                tag_way1[windex] <= waddr[31:12];
                // 写入 way1 后，way1 成为 MRU，另一路 way0 为 LRU -> lru = 1
                lru[windex] <= 1'b1;
            end
        end
    end
end

endmodule*/
module cache_tagv (
    input         clk,
    input         resetn,

    // CPU 访问
    input         re,
    input  [31:0] raddr,
    output wire   hit0,
    output wire   hit1,
    output wire   miss,

    // 写端口（来自主存）
    input         we,
    input         sel0,
    input  [31:0] waddr,

    // 替换路选择
    output wire   sel0_replace
);

    // ------------------------------
    // 存储结构
    // ------------------------------
    reg [19:0] tag_way0 [0:127];
    reg [19:0] tag_way1 [0:127];
    reg [127:0] valid_way0;
    reg [127:0] valid_way1;
    reg [127:0] lru;          // 1: way0 是 LRU；0: way1 是 LRU

    // ------------------------------
    // 地址拆分
    // ------------------------------
    wire [6:0] index  = raddr[11:5];
    wire [6:0] windex = waddr[11:5];
    wire [19:0] tag   = raddr[31:12];

    // ------------------------------
    // 初始化（仿真友好）
    // ------------------------------
    genvar i;
    generate
        for (i = 0; i < 128; i = i + 1) begin : INIT_TAG
            initial begin
                tag_way0[i] = 20'b0;
                tag_way1[i] = 20'b0;
            end
        end
    endgenerate

    // ------------------------------
    // 命中判断（组合逻辑）
    // ------------------------------
    assign hit0 = re && valid_way0[index] && (tag_way0[index] == tag);
    assign hit1 = re && valid_way1[index] && (tag_way1[index] == tag);

    assign miss = re && ~hit0 && ~hit1;

    // 替换选择（组合）
    // lru=1 → way0 为 LRU → 选择 way0
    assign sel0_replace = lru[index];

    // ------------------------------
    // 时序逻辑
    // ------------------------------
    integer j;
    always @(posedge clk) begin
        if (!resetn) begin
            valid_way0 <= 128'b0;
            valid_way1 <= 128'b0;
            lru        <= 128'b0;

            // 仿真安全清零
            for (j = 0; j < 128; j = j + 1) begin
                tag_way0[j] <= 20'b0;
                tag_way1[j] <= 20'b0;
            end
        end
        else begin
            // 命中时更新 LRU
            if (re) begin
                if (hit0)
                    lru[index] <= 1'b0;  // way1 成为 LRU
                else if (hit1)
                    lru[index] <= 1'b1;  // way0 成为 LRU
            end

            // miss 回填
            if (we) begin
                if (sel0) begin
                    valid_way0[windex] <= 1'b1;
                    tag_way0[windex]   <= waddr[31:12];
                    lru[windex]        <= 1'b0;
                end
                else begin
                    valid_way1[windex] <= 1'b1;
                    tag_way1[windex]   <= waddr[31:12];
                    lru[windex]        <= 1'b1;
                end
            end
        end
    end

endmodule

