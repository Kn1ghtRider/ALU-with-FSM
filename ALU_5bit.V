module ALU_5bit(
    input [4:0] A,
    input [4:0] B,
    input [1:0] sel,
    output reg [4:0] OUT,
    output reg ZF,
    output reg SF,
    output reg CF
);
    wire [4:0] sum_out;
    wire [4:0] nand_out;
    wire add_CF;

    ALU_ADD_5bit add_unit(
        .A(A),
        .B(B),
        .SUM(sum_out),
        .CF(add_CF)
    );

    ALU_NAND_5bit nand_unit(
        .A(A),
        .B(B),
        .RES(nand_out)
    );

    always @(*) begin
        case(sel)
            2'b00: begin
                OUT = sum_out;
                CF = add_CF;
            end
            2'b01: begin
                OUT = nand_out;
                CF = 0;
            end
            default: begin
                OUT = 5'b00000;
                CF = 0;
            end
        endcase
        ZF = (OUT == 5'b00000);
        SF = OUT[4];
    end
endmodule
