module ALU_ADD_5bit(
    input [4:0] A,
    input [4:0] B,
    output [4:0] SUM,
    output CF
);
    wire [5:0] full_sum;
    assign full_sum = A + B;
    assign SUM = full_sum[4:0];
    assign CF = full_sum[5];
endmodule