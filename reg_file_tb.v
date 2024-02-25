`timescale 1ns/1ps 
module Register_File_tb  ; 
 
  wire  [15:0]  RdData   ; 
  reg    WrEn   ; 
  reg    RST   ; 
  reg    RdEn   ; 
  reg    CLK   ; 
  reg  [2:0]  Address   ; 
  reg  [15:0]  WrData   ; 
  Register_File  
   RF  ( 
       .RdData (RdData ) ,
      .WrEn (WrEn ) ,
      .RST (RST ) ,
      .RdEn (RdEn ) ,
      .CLK (CLK ) ,
      .Address (Address ) ,
      .WrData (WrData ) ); 
initial begin
        $dumpfile ("dump Reg_File");
        $dumpvars;
        CLK=0;
        RST=0;
        #10
        #2.5
        RST=1;
        WrEn=1;
        RdEn=0;
        Address=5;
        WrData=10;
        #5
        $display ("test case 1 time=%t WrData=%d RdData=%d  #WRITE IN ADD 5",$time,WrData,RdData);
        #5
        WrEn=0;
        RdEn=1;
        Address=5;
        #5
        $display ("test case 2 time=%t WrData=%d RdData=%d  /n #read the same value we write IN ADD 5",$time,WrData,RdData);
        #5
        WrEn=1;
        RdEn=0;
        Address=3;
        WrData=14;
        #5
        $display ("test case 3 time=%t WrData=%d RdData=%d  /n #WRITE IN ADD 3",$time,WrData,RdData);
        #5
        WrEn=0;
        RdEn=1;
        Address=3;
        #5
        $display ("test case 4 time=%t WrData=%d RdData=%d  /n #read the same value we write IN ADD 3",$time,WrData,RdData);
        #5
        WrEn=1;
        RdEn=1;
        Address=3;
        WrData=100;
        #5
        $display ("test case 5 time=%t WrData=%d RdData=%d  /n #rNO OP 11",$time,WrData,RdData);
        #5
        WrEn=0;
        RdEn=0;
        Address=5;
        WrData=13;
        #5
        $display ("test case 6 time=%t WrData=%d RdData=%d  /n #NO OP 00",$time,WrData,RdData);
        #5    
        RST=0;
        WrEn=1;
        RdEn=0;
        Address=5;
        WrData=13;
        #5
        $display ("test case 7 time=%t WrData=%d RdData=%d  /n #NO OP 00",$time,WrData,RdData);
        #5    
        WrEn=0;
        RdEn=1;
        Address=3;
        WrData=14;
        #5
        $display ("test case 8 time=%t WrData=%d RdData=%d  /n #reset , READ 0",$time,WrData,RdData);

        #10
        $stop;
    end
        
   always 
    #5 CLK = !CLK;
endmodule


