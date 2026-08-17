module controller
(
    input wire clk, reset,
    output reg [6:0] A, B,
    output reg OP
);

reg [2:0] pstate, nstate;

parameter [2:0] START = 3'b000,
                ONE   = 3'b001,
                TWO   = 3'b010,
                THREE = 3'b011,
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
    A = 7'b0000000;
    B = 7'b0000000;
    OP = 1'b0;
    nstate = pstate;

    case (pstate)
        START: 
        begin
            nstate = ONE;
        end
        ONE:
        begin
            A = 7'b1010101;
            B = 7'b0101010;
            OP = 1'b0; // NOR (to test flag = 0)
            nstate = TWO;
        end

        TWO:
        begin
            A = 7'b1110001;
            B = 7'b0001110;
            OP = 1'b0; // NOR
            nstate = THREE;
        end

        THREE:
        begin
            A = 7'b0011100;
            B = 7'b0000010;
            OP = 1'b1; // ROR 
            nstate = FINISH;
        end

        FINISH:
        begin
            nstate = START;
        end

        default: nstate = START;
    endcase
end

endmodule