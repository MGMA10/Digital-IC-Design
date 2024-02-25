module ALU_TOP #(parameter n=15,m=1)(
    input [n:0] A,B,
    input CLK,
    input [3:0] ALU_FUN,
    input RST,
    output signed [2*n : 0]  Arith_OUT,
    output Carry_OUT, 
    output Arith_Flag,
    output [n : 0] Logic_OUT,
    output Logic_Flag,
    output [m : 0] CMP_OUT,
    output CMP_Flag,
    output [n : 0] SHIFT_OUT,
    output SHIFT_Flag
);
wire Arith_EN,Logic_EN,CMP_EN,SHIFT_EN;
Decoder_Unit Dec (
    .s(ALU_FUN[3:2]),
    .OUT({SHIFT_EN,CMP_EN,Logic_EN,Arith_EN})
    );

ARITHMETIC_UNIT #(.n(n)) ARITHMETIC_UNIT_TOP (
    .A(A),
    .B(B),
    .ALU_FUN(ALU_FUN[1:0]),
    .CLK(CLK),
    .Arith_OUT(Arith_OUT),
    .Carry_OUT(Carry_OUT),
    .Arith_Flag(Arith_Flag),
    .RST(RST),
    .Arith_EN(Arith_EN)
    );

    LOGIC_UNIT #(.n(n)) LOGIC_UNIT_TOP (
    .A(A),
    .B(B),
    .ALU_FUN(ALU_FUN[1:0]),
    .CLK(CLK),
    .RST(RST),
    .Logic_OUT(Logic_OUT),
    .Logic_Flag(Logic_Flag),
    .Logic_EN(Logic_EN)
    );

    CMP_UNIT #(.n(n)) CMP_UNIT_TOP (
        .A(A),
        .B(B),
        .ALU_FUN(ALU_FUN[1:0]),
        .CLK(CLK),
        .RST(RST),
        .CMP_OUT(CMP_OUT),
        .CMP_Flag(CMP_Flag),
        .CMP_EN(CMP_EN)
        );

        SHIFT_UNIT #(.n(n)) SHIFT_UNIT_TOP (
            .A(A),
            .B(B),
            .ALU_FUN(ALU_FUN[1:0]),
            .CLK(CLK),
            .RST(RST),
            .SHIFT_OUT(SHIFT_OUT),
            .SHIFT_Flag(SHIFT_Flag),
            .SHIFT_EN(SHIFT_EN)
            );

endmodule