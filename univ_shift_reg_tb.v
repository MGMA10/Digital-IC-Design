`timescale 1ns / 1ps

module univ_shift_reg_tb (

);
parameter n=4;

   reg clk,reset_b,MSB_IN,LSB_IN;
  reg [n-1:0] I;
  reg [1:0] s;
  wire [n-1:0] Q;

univ_shift_reg #(.n(n) ) tb (
    .clk(clk),
    .reset_b(reset_b),
    .MSB_IN(MSB_IN),
    .LSB_IN(LSB_IN),
    .I(I),
    .s(s),
    .Q(Q)
    );

localparam T = 10;

always 
begin
  clk =0;
  #(T/2);
  clk =1;
  #(T/2);
end

initial
begin
  s=2'b11;
  I=4'b1001;
  MSB_IN=0;
  LSB_IN=1;
  reset_b=1;
  
  #20
   s=2'b00;
  I=4'b1111;
  
  #10
   s=2'b01;
  I=4'b0001;
  
  #10
   s=2'b10;
  I=4'b1101;
  
  #20
  reset_b=0;
  
  #20 $stop;
end


endmodule
