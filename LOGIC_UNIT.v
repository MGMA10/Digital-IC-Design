module LOGIC_UNIT #(parameter n=15)(
    input [n:0] A,B,
    input CLK,
    input [1:0] ALU_FUN,
    input Logic_EN,
    input RST,
    output reg [n : 0] Logic_OUT,
    output reg Logic_Flag
);
always @(posedge CLK,negedge RST) begin
    if (RST & Logic_EN)
    case (ALU_FUN)
     0: Logic_OUT <= A & B; // Bitwise : AND
     1: Logic_OUT <= A | B; // Bitwise : OR
     2: Logic_OUT <= ~(A & B); // Bitwise : NAND
     3: Logic_OUT <= ~(A | B); // Bitwise : NOR
     default: Logic_OUT <= 0; 
    endcase
    else 
    Logic_OUT <= 0;
    Logic_Flag<=Logic_EN;
end
endmodule

// if logic gates (not bitwise) is used we will use the operations {&& , ||} 