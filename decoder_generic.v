module decoder_generic # (parameter n=3)(
   input [n-1:0] x,
   input en,
   output reg [0: 2 ** (n - 1)] y
);
always @(x,en)
begin
  y='b0;
  if(en)
    y[x]=1'b1;
  else
    y='b0;
end

endmodule