module mux_4x1 (
  input [3:0] x,
  input s0, s1,
  output y
);
  wire w1, w2;
  mux_2x1_gate M0 (.x1(x[0]), .x2(x[1]), .s(s0), .y(w1));
  mux_2x1_gate M1 (.x1(x[2]), .x2(x[3]), .s(s0), .y(w2));
  mux_2x1_gate M2 (w1,w2,s1,y);


//always @ (x , s0 ,s1)
//begin
//y=s1?(s0?x[3]:x[2]):(s0?x[1]:x[0]);
//end
 
endmodule
