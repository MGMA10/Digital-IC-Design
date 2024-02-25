`timescale 1us/1ns
module ALU_TOP_tb #(parameter n=15)() ; 

  wire    Carry_OUT   ; 
  reg  signed [n:0]  A   ; 
  reg    RST   ; 
  reg  signed [n:0]  B   ; 
  wire  [n:0]  SHIFT_OUT   ; 
  wire  [n:0]  Logic_OUT   ; 
  wire    Arith_Flag   ; 
  wire    CMP_Flag   ; 
  reg    CLK   ; 
  reg  [3:0]  ALU_FUN   ; 
  wire    SHIFT_Flag   ; 
  wire  signed [2*n:0]  Arith_OUT   ; 
  wire    Logic_Flag   ; 
  wire  [1:0]  CMP_OUT   ; 
  
  ALU_TOP    #( .n(n)  )
   TOP  ( 
       .Carry_OUT (Carry_OUT ) ,
      .A (A ) ,
      .RST (RST ) ,
      .B (B ) ,
      .SHIFT_OUT (SHIFT_OUT ) ,
      .Logic_OUT (Logic_OUT ) ,
      .Arith_Flag (Arith_Flag ) ,
      .CMP_Flag (CMP_Flag ) ,
      .CLK (CLK ) ,
      .ALU_FUN (ALU_FUN ) ,
      .SHIFT_Flag (SHIFT_Flag ) ,
      .Arith_OUT (Arith_OUT ) ,
      .Logic_Flag (Logic_Flag ) ,
      .CMP_OUT (CMP_OUT ) ); 
      
      initial begin
        $dumpfile ("dump ALU_TOP");
        $dumpvars;
        A =-15;
        B =-20;
        ALU_FUN=0;
        CLK=0;
        RST=1;
        $display("lets start the test bench time = %t",$time);
        #2
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=0;
        #5
        $display("test ADD case 1 time = %t  A= %d  B= %d  A+B= %d  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d Carry_OUT=%d", $time , A , B , Arith_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag,Carry_OUT );
        #5
        A =-13;
        B =20;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=0;
        #5
        $display("test ADD case 2 time = %t  A= %d  B= %d  A+B= %d  Arith_Flag=%D Carry_OUT=%d",$time,A,B,Arith_OUT,Arith_Flag,Carry_OUT );
        #5
        A =100;
        B =-30;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=0;
        #5
        $display("test ADD case 3 time = %t  A= %d  B= %d  A+B= %d  Arith_Flag=%D Carry_OUT=%d",$time,A,B,Arith_OUT,Arith_Flag,Carry_OUT );
        #5
        A =100;
        B =30;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=0;
        #5
        $display("test ADD case 4 time = %t  A= %d  B= %d  A+B= %d  Arith_Flag=%D Carry_OUT=%d",$time,A,B,Arith_OUT,Arith_Flag,Carry_OUT );
        #5
        A =-13;
        B =-20;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=1;
        #5
        $display("test SUB case 1 time = %t  A= %d  B= %d  A-B= %d  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d Borroe=%d", $time , A , B , Arith_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag ,Carry_OUT );
        #5
        A =-13;
        B =20;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=1;
        #5
        $display("test SUB case 2 time = %t  A= %d  B= %d  A-B= %d  Arith_Flag=%D Borrow=%d",$time,A,B,Arith_OUT,Arith_Flag,Carry_OUT );
        #5
        A =100;
        B =-30;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=1;
        #5
        $display("test SUB case 3 time = %t  A= %d  B= %d  A-B= %d  Arith_Flag=%D Borrow=%d",$time,A,B,Arith_OUT,Arith_Flag,Carry_OUT );
        #5
        A =100;
        B =30;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=1;
        #5
        $display("test SUB case 4 time = %t  A= %d  B= %d  A-B= %d  Arith_Flag=%D Borrow=%d",$time,A,B,Arith_OUT,Arith_Flag,Carry_OUT );
        #5
        A =-13;
        B =-20;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=2;
        #5
        $display("test MUL case 1 time = %t  A= %d  B= %d  A*B= %d  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d Carry_OUT=%d", $time , A , B , Arith_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag ,Carry_OUT );
        #5
        A =-13;
        B =20;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=2;
        #5
        $display("test MUL case 2 time = %t  A= %d  B= %d  A*B= %d  Arith_Flag=%D",$time,A,B,Arith_OUT,Arith_Flag);
        #5
        A =100;
        B =-30;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=2;
        #5
        $display("test MUL case 3 time = %t  A= %d  B= %d  A*B= %d  Arith_Flag=%D",$time,A,B,Arith_OUT,Arith_Flag);
        #5
        A =100;
        B =30;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=2;
        #5
        $display("test MUL case 4 time = %t  A= %d  B= %d  A*B= %d  Arith_Flag=%D",$time,A,B,Arith_OUT,Arith_Flag);
        #5
        A =-130;
        B =-2;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=3;
        #5
        $display("test DIV case 1 time = %t  A= %d  B= %d  A/B= %d  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d Carry_OUT=%d", $time , A , B , Arith_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag ,Carry_OUT );
        #5
        A =-625;
        B =25;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=3;
        #5
        $display("test DIV case 2 time = %t  A= %d  B= %d  A/B= %d  Arith_Flag=%D",$time,A,B,Arith_OUT,Arith_Flag);
        #5
        A =456;
        B =-7;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=3;
        #5
        $display("test DIV case 3 time = %t  A= %d  B= %d  A/B= %d  Arith_Flag=%D",$time,A,B,Arith_OUT,Arith_Flag);
        #5
        A =1230;
        B =13;
        ALU_FUN[3:2]=0;
        ALU_FUN[1:0]=3;
        #5
        $display("test DIV case 4 time = %t  A= %d  B= %d  A/B= %d  Arith_Flag=%D",$time,A,B,Arith_OUT,Arith_Flag);
        #5
////////////////////////////// logic
        A =16'b011101010;
        B =16'b0101111010;
        ALU_FUN[3:2]=1;
        ALU_FUN[1:0]=0;
        #5
        $display("test logic & case 1 time = %t  A= %0b  B= %0b  A & B= %0b  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , Logic_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        A =16'b011101010;
        B =16'b0101111010;
        ALU_FUN[3:2]=1;
        ALU_FUN[1:0]=1;
        #5
        $display("test logic | case 2 time = %t  A= %0b  B= %0b  A | B= %0b  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , Logic_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        A =16'b011101010;
        B =16'b0101111010;
        ALU_FUN[3:2]=1;
        ALU_FUN[1:0]=2;
        #5
        $display("test logic ~& case 3 time = %t  A= %0b  B= %0b  A ~& B= %0b  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , Logic_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        A =16'b011101010;
        B =16'b0101111010;
        ALU_FUN[3:2]=1;
        ALU_FUN[1:0]=3;
        #5
        $display("test logic ~| case 4 time = %t  A= %0b  B= %0b  A |~ B= %0b  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , Logic_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
//////////////////////CMP
        A =15;
        B =15;
        ALU_FUN[3:2]=2;
        ALU_FUN[1:0]=1;
        #5
        $display("test CMP = case 1 time = %t  A= %0b  B= %0b  CMP= %0b  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , CMP_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        A =15;
        B =15;
        ALU_FUN[1:0]=2;
        #5
        $display("test CMP > case 2 time = %t  A= %0b  B= %0b  CMP= %0b  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , CMP_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        A =15;
        B =15;
        ALU_FUN[1:0]=3;
        #5
        $display("test CMP < case 3 time = %t  A= %0b  B= %0b  CMP= %0b  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , CMP_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        A =19;
        B =10;
        ALU_FUN[1:0]=1;
        #5
        $display("test CMP = case 4 time = %t  A= %0b  B= %0b  CMP= %0b  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , CMP_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        A =19;
        B =10;
        ALU_FUN[1:0]=2;
        #5
        $display("test CMP > case 4 time = %t  A= %0b  B= %0b  CMP= %0b  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , CMP_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        A =19;
        B =10;
        ALU_FUN[1:0]=3;
        #5
        $display("test CMP < case 4 time = %t  A= %0b  B= %0b  CMP= %0b  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , CMP_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        A =-19;
        B =10;
        ALU_FUN[1:0]=3;
        #5
        $display("test CMP < case 4 time = %t  A= %0b  B= %0b  CMP= %0b  Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , CMP_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        A =-19;
        B =10;
        ALU_FUN[1:0]=0;
        #5
        $display("test CMP NO OP case 4 time = %t  A= %0b  B= %0b  CMP= %0b  (#NO OP) Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , CMP_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
///////////////////////////shift
        A =16'b01101111;
        B =16'b1111111111111111;
        ALU_FUN[3:2]=3;
        ALU_FUN[1:0]=0;
        $display("test shift (A *before =%b) (B *before =%b) ",A,B);
        #5
        $display("test shift A  >> case 1 time = %t A= %b  B= %b  OUt= %b      Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , SHIFT_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        ALU_FUN[1:0]=1;
        #5
        $display("test shift A  << case 2 time = %t A= %b  B= %b  OUt= %b      Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , SHIFT_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        ALU_FUN[1:0]=2;
        #5
        $display("test shift B  << case 2 time = %t A= %b  B= %b  OUt= %b      Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , SHIFT_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5
        ALU_FUN[1:0]=3;
        #5
        $display("test shift B  << case 2 time = %t A= %b  B= %b  OUt= %b      Arith_Flag=%d  Logic_Flag=%d  CMP_Flag=%d SHIFT_Flag=%d", $time , A , B , SHIFT_OUT , Arith_Flag ,  Logic_Flag , CMP_Flag , SHIFT_Flag );
        #5

        #10
        $stop;
    end
        
   always 
   begin #4 CLK = 1;
         #6 CLK = 0; end
          
endmodule


