module mux_2x1_dataflow(
input x1 ,x2 ,s,
output y
);

assign y = ~s & x1| s & x2;
endmodule


