
`timescale 1ns/1ps

module alu8_tb;

reg [7:0] A, B;
reg [3:0] ALU_Sel;

wire [7:0] Result;
wire Zero, Carry, Negative, Overflow;

alu8 uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .Result(Result),
    .Zero(Zero),
    .Carry(Carry),
    .Negative(Negative),
    .Overflow(Overflow)
);

initial begin

    $dumpfile("alu8.vcd");
    $dumpvars(0, alu8_tb);

    $monitor("Time=%0t A=%h B=%h Sel=%b Result=%h Z=%b C=%b N=%b V=%b",
    $time, A, B, ALU_Sel, Result,
    Zero, Carry, Negative, Overflow);

    A = 8'd20;
    B = 8'd10;

    ALU_Sel = 4'b0000; #10;
    ALU_Sel = 4'b0001; #10;
    ALU_Sel = 4'b0010; #10;
    ALU_Sel = 4'b0011; #10;
    ALU_Sel = 4'b0100; #10;
    ALU_Sel = 4'b0101; #10;
    ALU_Sel = 4'b0110; #10;
    ALU_Sel = 4'b0111; #10;

    A = 8'hFF;
    B = 8'h01;
    ALU_Sel = 4'b0000; #10;

    A = 8'h7F;
    B = 8'h01;
    ALU_Sel = 4'b0000; #10;

    A = 8'h80;
    B = 8'h01;
    ALU_Sel = 4'b0001; #10;

    $display("ALU TEST COMPLETED");
    $finish;

end

endmodule
