module univ_shift_reg #(parameter n=4) (
  input clk,reset_b,MSB_IN,LSB_IN,
  input [n-1:0] I,
  input [1:0] s,
  output [n-1:0] Q  
  );
  
  reg [n-1:0] Q_next ,Q_reg;
  ////////////////////////////////////////////
  always @ ( posedge clk ,negedge reset_b)
  begin
    
  if(!reset_b)
   Q_reg <= 0;
   else
   Q_reg <= Q_next;
  end
//////////////////////////////////////////
 always @ ( MSB_IN , LSB_IN , I , s )
 begin
  
  casex( s )
  0:Q_next = Q_reg;
  1:Q_next = { MSB_IN , Q_reg[n-1:1] };
  2:Q_next = {Q_reg[n-2:0] ,LSB_IN };
  3:Q_next = I;
  default:Q_next = Q_reg;
  endcase
 end
//////////////////////////////////////////////
assign Q = Q_reg;
endmodule
