`timescale 1ns/1ns

module top_tb;

reg clk, reset;
wire [6:0] result;
wire flag_gt_zero;

top uut (
    .clk(clk),
    .reset(reset),
    .result(result),
    .flag_gt_zero(flag_gt_zero)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("top_test.vcd");
    $dumpvars(0, top_tb);

    reset = 1;
    #10;
    reset = 0;

    #100;

    $finish;
end

endmodule