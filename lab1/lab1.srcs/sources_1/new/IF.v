module IF(
    input reset,
    input clk,
    input br_taken,
    input wire [31:0] br_target,
    input IF_ready_go,

    output reg [31:0] pc
);
    // 顺序PC与下一PC
    wire [31:0] seq_pc;
    wire [31:0] nextpc;

    assign seq_pc = pc + 32'h4;
    // 仅支持分支跳转或顺序执行，不含分支预测
    assign nextpc = br_taken ? br_target : seq_pc;

    always @(posedge clk) begin
        if (reset) begin
            // 复位到 pc=0-4以便第一个周期取pc=0的指令
            pc <= 32'hfffffffc;
        end
        else if (IF_ready_go) begin
            pc <= nextpc;
        end
        else begin
            pc <= pc;
        end
    end

endmodule
