module full_adder (
input x ,y ,cin,
output s,cout
);

wire sum1,c1,c2;

half_adder H0 (.x(x), .y(y), .s(sum1), .c(c1));
half_adder H1 (.x(cin), .y(sum1), .s(s), .c(c2));
assign cout = c1 | c2;
endmodule
