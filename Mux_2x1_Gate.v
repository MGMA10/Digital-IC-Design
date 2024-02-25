module mux_2x1_gate(
input x1,x2,
input s,
output y
);
wire w1 , w2;

and(w1,x1,~s);
and(w2,x2,s);
or(y,w1,w2);

endmodule


