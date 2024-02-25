module ripple_counter_4DFF(
  input clk,rstn,
  output [3:0] Q
  );
wire [3:0] Qn;

d_f_ff_b #(.FF_TYPE("DFF") ) a (
    .clk(clk),
    .reset_b(rstn),
    .d(Qn[0]),
    .Q(Q[0])
    ); 
d_f_ff_b #(.FF_TYPE("DFF") ) b (
    .clk(Q[0]),
    .reset_b(rstn),
    .d(Qn[1]),
    .Q(Q[1])
    );
d_f_ff_b #(.FF_TYPE("DFF") ) c (
    .clk(Q[1]),
    .reset_b(rstn),
    .d(Qn[2]),
    .Q(Q[2])
    );
d_f_ff_b #(.FF_TYPE("DFF") ) d (
    .clk(Q[2]),
    .reset_b(rstn),
    .d(Qn[3]),
    .Q(Q[3])
    );
    assign Qn = ~Q;
  endmodule