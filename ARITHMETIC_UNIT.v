module ARITHMETIC_UNIT #(parameter n=15)(
    input signed  [n:0] A,B,
    input CLK,
    input [1:0] ALU_FUN,
    input Arith_EN,
    input RST,
    output reg signed [2*n+1 : 0]  Arith_OUT,
    output reg Carry_OUT, 
    output reg Arith_Flag
);
always @(posedge CLK,negedge RST) begin
    Arith_Flag <= Arith_EN;
    if (RST & Arith_EN)
    case (ALU_FUN[1:0])
     0: Arith_OUT <= A + B; // Arithmatic : signed addition
     1: Arith_OUT <= A - B; // Arithmatic : signed subtraction
     2: Arith_OUT <= A * B; // Arithmatic : signed multiplication
     3: Arith_OUT <= A / B; // Arithmatic : signed division
     default: Arith_OUT <= 0; 
    endcase
    else 
    Arith_OUT <= 0;
    case (ALU_FUN[1])
    0: Carry_OUT <= Arith_OUT [n]^ALU_FUN[0];
    1: Carry_OUT <= 0;
    default: Carry_OUT <= 0; 
    endcase
end
endmodule