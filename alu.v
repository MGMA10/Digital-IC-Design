module alu #(parameter n=16)(
    input [n:0] A,B,
    input [3:0] ALU_FUN,
    input CLK,
    output reg [n+1:0] ALU_OUT,
    output reg Arith_Flag,Logic_Flag,CMP_Flag,Shift_Flag

);
    always @(posedge CLK) begin
        case (ALU_FUN)
         0: ALU_OUT <= A + B; // Arithmatic : unsigned addition
         1: ALU_OUT <= A - B; // Arithmatic : unsigned subtraction
         2: ALU_OUT <= A * B; // Arithmatic : unsigned multiplication
         3: ALU_OUT <= A / B; // Arithmatic : unsigned division
         4: ALU_OUT <= A & B; // Logic : AND
         5: ALU_OUT <= A | B; // Logic : OR
         6: ALU_OUT <= ~(A & B); // Logic : NAND
         7: ALU_OUT <= ~(A | B); // Logic : NOR
         8: ALU_OUT <= A ^ B; // Logic : XOR
         9: ALU_OUT <= ~(A ^ B); // Logic : XNOR
         10: ALU_OUT <= (A == B); // CMP
         11: ALU_OUT <= (A > B)? 2 : 0; //CMP
         12: ALU_OUT <= (A < B)? 3 : 0; //CMP
         13: ALU_OUT <= ALU_OUT >> 1 ; //shift right
         14: ALU_OUT <= ALU_OUT << 1 ; //shift lift
         default: ALU_OUT <= 0; 
        endcase
    end

    always @(*) begin
        Arith_Flag=~(ALU_FUN[2]|ALU_FUN[3]);
        Logic_Flag=(((~ALU_FUN[3])&ALU_FUN[2])|(ALU_FUN[3]&(~ALU_FUN[2])&(~ALU_FUN[1])));
        CMP_Flag=(((~ALU_FUN[2])&ALU_FUN[3]&ALU_FUN[1])|(ALU_FUN[3]&ALU_FUN[2]&(~ALU_FUN[0])&(~ALU_FUN[1])));
        Shift_Flag=(((~ALU_FUN[1])&ALU_FUN[2]&ALU_FUN[3]&ALU_FUN[0])|(ALU_FUN[3]&(ALU_FUN[2])&(ALU_FUN[1])&(~ALU_FUN[0])));
    end
    
endmodule