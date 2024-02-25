
module n_bit_adder2 #(parameter r=32  , k=16 )(
input [r-1:0] x ,y ,
output [r-1:0] sxy,
output coutxy,
input [k-1:0] a ,b ,
output [k-1:0] sab,
output coutab
);

n_bit_adder #(.n(r) ) add32_bit (
    .x(x),
    .y(y),
    .cin(0),
    .cout(coutxy),
    .s(sxy)
    );

n_bit_adder #(.n(k) ) add16_bit (
    .x(a),
    .y(b),
    .cin(0),
    .cout(coutab),
    .s(sab)
    );
endmodule



