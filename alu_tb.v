`timescale 1us/1ns
module alu_tb #(parameter n=16)();
    reg [n:0] A_tb , B_tb;
    reg [3:0] ALU_FUN_tb;
    reg CLK_tb;
    wire [n+1:0] ALU_OUT_tb;
    wire Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb;

    

    alu #(.n(n)) tb (
    .A(A_tb),
    .B(B_tb),
    .ALU_FUN(ALU_FUN_tb),
    .CLK(CLK_tb),
    .ALU_OUT(ALU_OUT_tb),
    .Arith_Flag(Arith_Flag_tb),
    .Logic_Flag(Logic_Flag_tb),
    .CMP_Flag(CMP_Flag_tb),
    .Shift_Flag(Shift_Flag_tb)
    );

    initial begin
        $dumpfile ("dump alu");
        $dumpvars;
        A_tb =0;
        B_tb=0;
        ALU_FUN_tb=0;
        CLK_tb=0;
        $display("lets start the test bench time = %t",$time);
        #5 //case 0
        A_tb =3;
        B_tb=5;
        ALU_FUN_tb=0;
        #5
        $display("case 1 add+:: time = %t --A=%0d B=%0d -- OUT=%0d -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=1;
        #5
        $display("case 2 sub-:: time = %t --A=%0d B=%0d -- OUT=%0d -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=2;
        #5
        $display("case 3 mul*:: time = %t --A=%0d B=%0d -- OUT=%0d -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=3;
        #5
        $display("case 4 div/:: time = %t --A=%0d B=%0d -- OUT=%0d -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=4;
        #5
        $display("case 5 and&:: time = %t --A=%b B=%b -- OUT=%b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=5;
        #5
        $display("case 6 or|:: time = %t --A=%b B=%b -- OUT=%b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=6;
        #5
        $display("case 7 nand~&:: time = %t --A=%b B=%b -- OUT=%b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=7;
        #5
        $display("case 8 nor~|:: time = %t --A=%b B=%b -- OUT=%b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=8;
        #5
        $display("case 9 xor^:: time = %t --A=%b B=%b -- OUT=%b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=9;
        #5
        $display("case 10 xnor~^|:: time = %t --A=%b B=%b -- OUT=%b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =3;
        B_tb=3;
        ALU_FUN_tb=10;
        #5
        $display("case 11 cmp=:: time = %t --A=%b B=%b -- OUT=%0b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=11;
        #5
        $display("case 12 cmp a>b:: time = %t --A=%b B=%b -- OUT=%0b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=12;
        #5
        $display("case 13 cmp a<b:: time = %t --A=%d B=%d -- OUT=%0b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=10;
        ALU_FUN_tb=12;
        #5
        $display("case 14 cmp a<b:: time = %t --A=%d B=%d -- OUT=%0b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=13;
        #5
        $display("case 15 shift r>>:: time = %t --A=%b B=%b -- OUT=%b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        #5
        A_tb =7;
        B_tb=2;
        ALU_FUN_tb=14;
        #5
        $display("case 16 shift l<<:: time = %t --A=%b B=%b -- OUT=%b -- flags:: A=%b L=%b C=%b S=%b",$time,A_tb,B_tb,ALU_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb);
        
        #10
        $stop;
    end
    always #5 CLK_tb = !CLK_tb;
        
    
endmodule