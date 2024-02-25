module SHIFT_UNIT #(parameter n=15)(
    input [n:0] A,B,
    input CLK,
    input [1:0] ALU_FUN,
    input RST,
    input SHIFT_EN,
    output reg [n : 0] SHIFT_OUT,
    output reg SHIFT_Flag
);
always @(posedge CLK,negedge RST) begin
    if (RST & SHIFT_EN)
    case (ALU_FUN[1:0])
     0: SHIFT_OUT <= A >> 1 ; //shift A right
     1: SHIFT_OUT <= A << 1 ; //shift A lift
     2: SHIFT_OUT <= B >> 1 ; //shift B right
     3: SHIFT_OUT <= B << 1 ; //shift B lift
     default: SHIFT_OUT <= 0;
    endcase
    else 
    SHIFT_OUT <= 0;
    SHIFT_Flag <= SHIFT_EN ;
end
endmodule