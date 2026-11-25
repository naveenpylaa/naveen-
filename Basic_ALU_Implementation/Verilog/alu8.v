
module alu8 (
    input  [7:0] A,
    input  [7:0] B,
    input  [3:0] ALU_Sel,

    output reg [7:0] Result,
    output reg Zero,
    output reg Carry,
    output reg Negative,
    output reg Overflow
);

reg [8:0] temp;

always @(*) begin

    Result   = 8'b00000000;
    Carry    = 1'b0;
    Overflow = 1'b0;
    temp     = 9'b000000000;

    case (ALU_Sel)

        4'b0000: begin
            temp = {1'b0,A} + {1'b0,B};
            Result = temp[7:0];
            Carry = temp[8];
            Overflow = ~(A[7]^B[7]) &
                       (Result[7]^A[7]);
        end

        4'b0001: begin
            temp = {1'b0,A} - {1'b0,B};
            Result = temp[7:0];
            Carry = ~temp[8];
            Overflow = (A[7]^B[7]) &
                       (Result[7]^A[7]);
        end

        4'b0010: Result = A & B;

        4'b0011: Result = A | B;

        4'b0100: Result = A ^ B;

        4'b0101: Result = ~A;

        4'b0110: begin
            Result = A << 1;
            Carry = A[7];
        end

        4'b0111: begin
            Result = A >> 1;
            Carry = A[0];
        end

        default: Result = 8'b00000000;

    endcase

    Zero = (Result == 8'b00000000);
    Negative = Result[7];

end

endmodule
