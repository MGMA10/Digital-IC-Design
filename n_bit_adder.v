
module n_bit_adder #(parameter n=8 )(
input [n-1:0] x ,y ,
input cin,
output [n-1:0] s,
output cout
);

wire [n:0] c;
assign c[0]=cin;
assign cout=c[n];
generate
  genvar i;
  for(i=0;i<n;i=i+1)
  begin
    full_adder FA (
    
    .x(x[i]),
    .y(y[i]),
    .cin(c[i]),
    .cout(c[i+1]),
    .s(s[i])
    );
  end

endgenerate

endmodule

