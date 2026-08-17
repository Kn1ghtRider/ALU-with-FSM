module controller
(
    input wire clk, reset,
    output reg [4:0] A, B,
    output reg [1:0] sel
);

reg [2:0] pstate, nstate;

parameter [2:0] START  = 3'b000,
                OP1    = 3'b001,
                OP2    = 3'b010,
                OP3    = 3'b011,
                FINISH = 3'b100;

// State Register
always @(posedge clk or posedge reset)
begin
    if (reset)
        pstate <= START;
    else
        pstate <= nstate;
end

// Next State and Outputs
always @(*)
begin
    // Default outputs
    A = 5'b00000;
    B = 5'b00000;
    sel = 2'b00;
    nstate = pstate;

    case (pstate)
        START:
            nstate = OP1;

        OP1: begin
            A = 5'b00011; // 3
            B = 5'b00101; // 5
            sel = 2'b00;  // ADD
            nstate = OP2;
        end

        OP2: begin
            A = 5'b10101; // 21
            B = 5'b01010; // 10
            sel = 2'b01;  // NAND
            nstate = OP3;
        end

        OP3: begin
            A = 5'b11111; // 31
            B = 5'b00001; // 1
            sel = 2'b00;  // ADD (with carry expected)
            nstate = FINISH;
        end

        FINISH:
            nstate = START;

        default:
            nstate = START;
    endcase
end

endmodule
