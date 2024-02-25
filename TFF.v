module TFF(
  input t,rstn,clk,
  output Q,Q_n
  );
reg  j_reg,j_next;
always @ (posedge clk , negedge rstn)
begin
  if (!rstn)
    j_reg <= -1;
    else
    j_reg <= j_next ;
  end
always @ (*)
begin
  if(t)
j_next=~j_reg;
else
j_next=j_reg;  
end
  assign Q = j_reg;
  assign Q_n =~j_reg;
    
endmodule