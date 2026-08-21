module data_bram (
    input          clka,    // 时钟
    input          wea,     // 写使能
    input  [9:0]   addra,   // 地址（10 位 -> 1024 深度）
    input  [31:0]  dina,    // 写数据
    output [31:0]  douta    // 读数据（寄存输出）
);

// 1024 x 32bit RAM -> 4KB
reg [31:0] ram [0:1023];

// 寄存输出
reg [31:0] douta_reg;

// 声明循环变量在模块作用域，避免综合器在 initial 中声明 loop 变量报错
integer i;

// 写端口：在时钟上写入（同步写）
always @(posedge clka) begin
    if (wea) begin
        ram[addra] <= dina;
    end
end

// 读端口：同步读，输出寄存
always @(posedge clka) begin
    douta_reg <= ram[addra];
end

assign douta = douta_reg;

// 初始化 RAM 为 0（仿真友好）
// 注意：有些综合工具会忽略 initial 对 BRAM 的初始化，FPGA 上 BRAM 的上电初值由工具/设备决定
initial begin
    for (i = 0; i < 1024; i = i + 1) begin
        ram[i] = 32'h0;
    end
end

endmodule
