module top
(
    input wire clk, reset,
    output wire [6:0] result,
    output wire flag_gt_zero
);

wire [6:0] A, B;
wire OP;
wire [6:0] R_result;
wire R_ZF;

controller controller1 (
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .OP(OP)
);

ALU datapath1 (
    .A(A),
    .B(B),
    .OP(OP),
    .result(R_result),
    .ZF(R_ZF)
);

assign result = R_result;
assign flag_gt_zero = ~R_ZF;

endmodule