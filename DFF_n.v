module d_f_ff_b #(parameter FF_TYPE="DFF") (
  input clk,reset_b,
  input  d,
  output  Q  
  );
  reg  Q_next ,Q_reg;
  always @ (posedge clk , negedge reset_b)
begin
  if (!reset_b)
    Q_reg <= -1;
    else
    Q_reg <= Q_next ;
  end
always @ (*)
begin
  if (FF_TYPE=="DFF")
Q_next=d;
else if (FF_TYPE=="TFF")
  Q_next=d^Q_reg;
else
  Q_next=Q_next;
end
assign Q = Q_reg;

endmodule

