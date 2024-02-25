module adder_substractor # (parameter n=4)(
   input [n-1:0] x,y,
   input s,
   output [n-1:0] f,
   output cout, ov
);

  wire [n-1:0] onscom;
  
  generate
  genvar i;
  for(i=0;i<n;i=i+1)
  begin
  assign onscom[i] = y[i] ^ s ;
 end

assign av = x[n-1] & y[n-1] & ~f[n-1] | ~x[n-1] & ~y[n-1] & f[n-1];

endgenerate
 n_bit_adder #(.n(n) ) add_sub (
    .x(x),
    .y(onscom),
    .cin(s),
    .cout(cout),
    .s(f)
    );
endmodule
