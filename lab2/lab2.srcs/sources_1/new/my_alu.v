`timescale 1ns / 1ps

module my_alu(
    input[11:0] alu_op,     //操作
    input[31:0] src_1,  //加数1
    input[31:0] src_2,  //加数2
    
    output reg [31:0] alu_result //存储计算结果
    );
    
    wire [31:0] add_b;  //实际加数
    wire [31:0] add_result; //加和结果
    wire        cin;        //进位
    wire        cout;       //结果进位
    wire [63:0] product;
    
    // 判断是否是减法
    wire is_sub = alu_op == 12'b000000000010 ? 1'b1 : 1'b0; // A - B
    assign add_b = is_sub ? ~src_2 : src_2; //若是减法则取反后+1
    assign cin = is_sub ? 1'b1 : 1'b0;  //特殊处理减法时的+1

    assign product = ($signed(src_1) * $signed(src_2));
    // 实例化 adder

    assign add_result = {1'b0, src_1} + {1'b0, add_b} + cin;//计算
    always @(*) begin
        case (alu_op)
            12'b0000_0000_0001: alu_result = add_result;                     //  add_w
            12'b0000_0000_0010: alu_result = add_result;                     //  sub_w
            12'b0000_0000_0100: alu_result = src_1 & src_2;          //  and
            12'b0000_0000_1000: alu_result = product[31:0];                  // mul_w
            12'b0000_0001_0000: alu_result = src_1 << src_2[4:0];    // slli_w
            12'b0000_0010_0000: alu_result = ($signed(src_1) < $signed(src_2)) ? 32'b1 : 32'b0;
            12'b0000_0100_0000: alu_result = src_1 + src_2;
            12'b0000_1000_0000: alu_result = src_1 | src_2;
            12'b0001_0000_0000: alu_result = src_1 + src_2;
            12'b0010_0000_0000: alu_result = src_1 + src_2;
            12'b0100_0000_0000: alu_result = src_1 + src_2;
            12'b1000_0000_0000: alu_result = src_1 + src_2;
            default: alu_result = 32'b0;
        endcase
    end
endmodule
