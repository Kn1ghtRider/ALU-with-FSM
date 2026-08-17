module ALU_NAND_5bit(
    input [4:0] A,
    input [4:0] B,
    output [4:0] RES
);
    assign RES = ~(A & B);
endmodule