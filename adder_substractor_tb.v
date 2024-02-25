`timescale 1ns / 1ps

module adder_substractor_tb (

);
parameter n=4;

   reg [n-1:0] x,y;
   reg s;
   wire [n-1:0] f;
   wire cout, ov;

adder_substractor #(.n(n) ) tb (
    .x(x),
    .y(y),
    .s(s),
    .cout(cout),
    .f(f),
    .ov(ov)
    );



initial
begin
  x= 4'd6;
  y= 4'd7;
  s= 1'b1;
  
  #10
  s= 1'b0;
  
  #10
  x= 4'd3;
  y= 4'd4;
 
  #10
  s= 1'b1;
end

initial
begin
  $monitor("time = %3d: x = %d \t y = %d \t s = %1b \t result = %3d \t cout = %1b \t ov = %1b",
  $time, x, y , s , f , cout , ov);
end


endmodule