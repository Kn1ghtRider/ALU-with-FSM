module ALU_tb_5bit;
    reg [4:0] A;
    reg [4:0] B;
    reg [1:0] sel;
    wire [4:0] OUT;
    wire ZF;
    wire SF;
    wire CF;

    ALU_5bit uut(
        .A(A),
        .B(B),
        .sel(sel),
        .OUT(OUT),
        .ZF(ZF),
        .SF(SF),
        .CF(CF)
    );

    initial begin
        $dumpfile("alu_test.vcd");
        $dumpvars(0, ALU_tb_5bit);


        $display("A     B     sel OUT   ZF SF CF");
        A = 5'b00011; B = 5'b00101; sel = 2'b00; #10;
        $display("%b %b %b %b  %b  %b  %b", A, B, sel, OUT, ZF, SF, CF);

        A = 5'b01010; B = 5'b00101; sel = 2'b01; #10;
        $display("%b %b %b %b  %b  %b  %b", A, B, sel, OUT, ZF, SF, CF);

        A = 5'b11100; B = 5'b00011; sel = 2'b10; #10;
        $display("%b %b %b %b  %b  %b  %b", A, B, sel, OUT, ZF, SF, CF);

        $finish;
    end
endmodule
