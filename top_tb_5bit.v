`timescale 1ns/1ns

module top_tb;

reg clk, reset;
wire [4:0] result;
wire flag_gt_zero;

// Instantiate the top-level module
top uut (
    .clk(clk),
    .reset(reset),
    .result(result),
    .flag_gt_zero(flag_gt_zero)
);

// Generate clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Apply reset and observe behavior
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
