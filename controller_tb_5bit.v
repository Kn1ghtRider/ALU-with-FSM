`timescale 1ns/1ns

module controller_tb;

reg clk, reset;
wire [4:0] A, B;
wire [1:0] sel;

// Instantiate controller
controller uut (
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .sel(sel)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Simulation logic
initial begin
    $dumpfile("controller_tb.vcd");
    $dumpvars(0, controller_tb);

    reset = 1;
    #10;
    reset = 0;

    #100;
    $finish;
end

endmodule
