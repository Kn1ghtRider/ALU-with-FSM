module top
(
    input wire clk, reset,
    output wire [4:0] result,
    output wire flag_gt_zero
);

wire [4:0] A, B;
wire [1:0] sel;
wire [4:0] R_result;
wire R_ZF;

// Controller generates operands and select signal
controller controller1 (
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .sel(sel)
);

// ALU performs operation
ALU_5bit datapath1 (
    .A(A),
    .B(B),
    .sel(sel),
    .OUT(R_result),
    .ZF(R_ZF),
    .SF(),      // Unused
    .CF()       // Unused
);

// Outputs
assign result = R_result;
assign flag_gt_zero = ~R_ZF;

endmodule
