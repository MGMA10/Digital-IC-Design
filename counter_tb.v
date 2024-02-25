`timescale 1ns/1ps
module counter_tb ();
    reg [4:0] IN_tb;
    reg Load_tb,Up_tb,Down_tb,CLK_tb;
    wire High_tb,Low_tb;
    wire [4:0] counter_tb;
    counter (
        .IN(IN_tb),
        .Load(Load_tb),
        .Up(Up_tb),
        .Down(Down_tb),
        .CLK(CLK_tb),
        .High(High_tb),
        .Low(Low_tb),
        .counter(counter_tb)
    );
    initial begin
        $dumpfile ("dump counter");
        $dumpvars;
        IN_tb = 5;
        Load_tb = 0;
        Up_tb = 0;
        Down_tb=0;
        CLK_tb=0;
        $display("lets start the test bench time = %t",$time);
        #5
        $display("test case 1 :: input=%d  load=%b  up=%b  down=%b" ,IN,Load,up,down);
        #5
        $display("counter = %d High=%b , Low=%b",counter,High,Low);
        IN_tb = 5;
        Load_tb = 1;
        Up_tb = 0;
        Down_tb=0;
         #5
        $display("test case 2 :: input=%d  load=%b  up=%b  down=%b" ,IN,Load,up,down);
        #5
        $display("counter = %d High=%b , Low=%b",counter,High,Low);
        IN_tb = 5;
        Load_tb = 1;
        Up_tb = 1;
        Down_tb=0;
         #5
        $display("test case 3 :: input=%d  load=%b  up=%b  down=%b" ,IN,Load,up,down);
        #5
        $display("counter = %d High=%b , Low=%b",counter,High,Low);
        IN_tb = 20;
        Load_tb = 1;
        Up_tb = 1;
        Down_tb=1;
         #5
        $display("test case 4 :: input=%d  load=%b  up=%b  down=%b" ,IN,Load,up,down);
        #5
        $display("counter = %d High=%b , Low=%b",counter,High,Low);
        IN_tb = 5;
        Load_tb = 0;
        Up_tb = 1;
        Down_tb=0;
         #5
        $display("test case 5 :: input=%d  load=%b  up=%b  down=%b" ,IN,Load,up,down);
        #5
        $display("counter = %d High=%b , Low=%b",counter,High,Low);
        #200
        $display("counter = %d it should be 31 ,,High=%b , Low=%b",counter,High,Low);
        IN_tb = 5;
        Load_tb = 0;
        Up_tb = 1;
        Down_tb=1;
         #5
        $display("test case 6 :: input=%d  load=%b  up=%b  down=%b" ,IN,Load,up,down);
        #5
        $display("counter = %d toggling ,, High=%b , Low=%b",counter,High,Low);
        #5
        $display("counter = %d toggling ,, High=%b , Low=%b",counter,High,Low);
        #5
        $display("counter = %d toggling ,, High=%b , Low=%b",counter,High,Low);
        IN_tb = 5;
        Load_tb = 0;
        Up_tb = 0;
        Down_tb=1;
         #5
        $display("test case 7 :: input=%d  load=%b  up=%b  down=%b" ,IN,Load,up,down);
        #5
        $display("counter = %d DEC ,, High=%b , Low=%b",counter,High,Low);
        #5
        $display("counter = %d DEC ,, High=%b , Low=%b",counter,High,Low);
        #5
        $display("counter = %d DEC ,, High=%b , Low=%b",counter,High,Low);
        #500
        $display("counter = %d it should be 00 ,, High=%b , Low=%b",counter,High,Low);
        $stop;
    end
        always #5 CLK_tb = !CLK_tb;

endmodule