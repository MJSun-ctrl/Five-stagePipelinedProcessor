`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module regfile(
    input         clk,      // 时钟
    input         resetn,   // 新增：低有效复位
    input         we,       // 写使能
    input [4:0]   waddr,    // 写地址
    input [31:0]  wdata,    // 写数据
    input [4:0]   raddr1,   // 读地址1
    output [31:0] rdata1,   // 读数据1
    input [4:0]   raddr2,   // 读地址2
    output [31:0] rdata2    // 读数据2
);

    // 32 个 32bit 寄存器堆
    reg [31:0] regs[31:0];

    integer i;
    always @(posedge clk) begin
        if (!resetn) begin
            // 复位：全部寄存器清 0
            for (i = 0; i < 32; i = i + 1)
                regs[i] <= 32'b0;
        end 
        else if (we && waddr != 5'd0) begin
            // 写寄存器，禁止写 x0
            regs[waddr] <= wdata;
        end
    end

    assign rdata1 = (raddr1 != 5'd0) ? regs[raddr1] : 32'b0;
    assign rdata2 = (raddr2 != 5'd0) ? regs[raddr2] : 32'b0;

endmodule
