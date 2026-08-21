/*`timescale 1ns / 1ps


module predictor(
    input wire clk,                  // 时钟
    input wire resetn,               // 复位信号

    input  wire [31:0] pc,           // PC地址
    output wire [31:0] pred_pc, // 预测
    output wire        pred_taken,// 预测

    input  wire        update_en,       // 预使能
    input  wire [31:0] update_pc,// 待更新的PC地址
    input  wire        update_is_branch,  // 是否为分支指令
    input  wire        update_is_cond,// 当是否为条件分支指令 更新PHT
    input  wire        update_branch_taken, // 实际执行结果
    input  wire [31:0] update_branch_target// 实际目标地址
);

    // 全局历史寄存器
    reg [11:0] ghr;

    // PHT 00: 强不分支 01: 弱不分支 弱分支 强分支
    reg [1:0] pht [4095:0]; 


    reg                 btb_valid [255:0];      
    reg [21:0]          btb_tag   [255:0];     
    reg [31:0]          btb_target[255:0];   


    wire [7:0] btb_index = pc[9:2];
    wire [21:0] btb_tag_req = pc[31:10];
    
    wire btb_hit = btb_valid[btb_index] && (btb_tag[btb_index] == btb_tag_req);
    wire [31:0] btb_pred_target = btb_target[btb_index];


    wire [11:0] pht_index = pc[13:2];
    // 当前PHT项的状态
    wire [1:0] pht_state = pht[pht_index];
    
    // 分支预测结果生成：
    assign pred_taken = btb_hit && pht_state[1];
    
    // 预测下一条PC
    assign pred_pc = pred_taken ? btb_pred_target : (pc + 4);

    
    integer i;
    always @(posedge clk) begin
        if (!resetn) begin
            // 复位初始化
            ghr <= 0;
            
            // PHT初始化
            for (i = 0; i < 4096; i = i + 1) begin
                pht[i] <= 2'b10; 
            end
            
            // BTB初始化：所有项设为无效
            for (i = 0; i < 256; i = i + 1) begin
                btb_valid[i] <= 0;
                btb_tag[i] <= 0;
                btb_target[i] <= 0;                   
            end
        end else if (update_en) begin
            if (update_is_branch) begin 
                // BTB更新
                if (update_branch_taken) begin
                    btb_valid[update_pc[9:2]] <= 1;
                    btb_tag[update_pc[9:2]] <= update_pc[31:10];
                    btb_target[update_pc[9:2]] <= update_branch_target;
                end

                // GHR更新
                ghr <= {ghr[10:0], update_branch_taken};

                // PHT更新
                if (update_is_cond) begin
                    // 更新2-bit饱和计数器
                    case (pht[update_pc[13:2]])
                        2'b00: pht[update_pc[13:2]] <= update_branch_taken ? 2'b01 : 2'b00; // 强不分支→弱不分支/保持
                        2'b01: pht[update_pc[13:2]] <= update_branch_taken ? 2'b10 : 2'b00; // 弱不分支→弱分支/强不分支
                        2'b10: pht[update_pc[13:2]] <= update_branch_taken ? 2'b11 : 2'b01; // 弱分支→强分支/弱不分支
                        2'b11: pht[update_pc[13:2]] <= update_branch_taken ? 2'b11 : 2'b10; // 强分支→保持/弱分支
                    endcase
                end
            end
        end
    end

endmodule*/
`timescale 1ns / 1ps

module predictor(
    input  wire        clk,                  // 时钟
    input  wire        resetn,               // 低有效复位

    input  wire [31:0] pc,                   // 当前取指 PC
    output wire [31:0] pred_pc,              // 预测下一条 PC
    output wire        pred_taken,           // 是否预测跳转

    input  wire        update_en,             // 更新使能
    input  wire [31:0] update_pc,             // 待更新指令 PC
    input  wire        update_is_branch,      // 是否为分支指令
    input  wire        update_is_cond,        // 是否为条件分支
    input  wire        update_branch_taken,   // 实际是否跳转
    input  wire [31:0] update_branch_target   // 实际跳转目标
);

    reg [11:0] ghr;

    reg [1:0] pht [0:4095];

    reg        btb_valid  [0:255];
    reg [21:0] btb_tag    [0:255];
    reg [31:0] btb_target [0:255];

    wire [7:0]  btb_index;
    wire [21:0] btb_tag_req;
    wire        btb_hit;
    wire [31:0] btb_pred_target;

    assign btb_index     = pc[9:2];
    assign btb_tag_req   = pc[31:10];
    assign btb_hit       = btb_valid[btb_index] &&
                           (btb_tag[btb_index] == btb_tag_req);
    assign btb_pred_target = btb_target[btb_index];

    //  PHT 查询

    wire [11:0] pht_index;
    wire [1:0]  pht_state;

    assign pht_index = pc[13:2];
    assign pht_state = pht[pht_index];


    // 只有 BTB 命中 + PHT 预测跳转 才认为跳转
    assign pred_taken = btb_hit && pht_state[1];

    // 预测 PC
    assign pred_pc = pred_taken ? btb_pred_target : (pc + 4);

    integer i;
    always @(posedge clk) begin
        if (!resetn) begin
            ghr <= 12'b0;

            // 初始化 PHT：默认"弱跳转"
            for (i = 0; i < 4096; i = i + 1) begin
                pht[i] <= 2'b10;
            end

            // 初始化 BTB
            for (i = 0; i < 256; i = i + 1) begin
                btb_valid[i]  <= 1'b0;
                btb_tag[i]    <= 22'b0;
                btb_target[i] <= 32'b0;
            end

        end else if (update_en) begin


            if (update_is_branch) begin

                // BTB 更新 
                if (update_branch_taken) begin
                    btb_valid[update_pc[9:2]]  <= 1'b1;
                    btb_tag[update_pc[9:2]]    <= update_pc[31:10];
                    btb_target[update_pc[9:2]] <= update_branch_target;
                end

                // GHR 更新
                ghr <= {ghr[10:0], update_branch_taken};

                // PHT 更新（仅条件分支）
                if (update_is_cond) begin
                    case (pht[update_pc[13:2]])
                        2'b00: pht[update_pc[13:2]] <= update_branch_taken ? 2'b01 : 2'b00;
                        2'b01: pht[update_pc[13:2]] <= update_branch_taken ? 2'b10 : 2'b00;
                        2'b10: pht[update_pc[13:2]] <= update_branch_taken ? 2'b11 : 2'b01;
                        2'b11: pht[update_pc[13:2]] <= update_branch_taken ? 2'b11 : 2'b10;
                    endcase
                end
            end
        end
    end

endmodule
