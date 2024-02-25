module CMP_UNIT #(parameter n=15 )(
    input signed [n:0] A,B,
    input CLK,
    input [1:0] ALU_FUN,
    input RST,
    input CMP_EN,
    output reg [1 : 0] CMP_OUT,
    output reg CMP_Flag
);
always @(posedge CLK,negedge RST) begin
    if (RST & CMP_EN)
    case (ALU_FUN)
     0: CMP_OUT <= CMP_OUT; // NO_op
     1: CMP_OUT <= (A == B); // CMP
     2: CMP_OUT <= (A > B)? 2 : 0; //CMP
     3: CMP_OUT <= (A < B)? 3 : 0; //CMP
     default: CMP_OUT <= 0; 
    endcase
    else 
    CMP_OUT <= 0;
    CMP_Flag <= CMP_EN;
end
endmodule
// i don't know if it is signed comp or not