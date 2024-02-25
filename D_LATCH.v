module d_latch #(parameter LAT_WIDTH = 3)(
  input aset,gate,aclr,
  input [LAT_WIDTH-1:0] data,
  output [LAT_WIDTH-1:0] Q
  );
reg [LAT_WIDTH-1:0] D_reg;
wire [LAT_WIDTH-1:0] D_next;
always @ (*)
begin  
  if (aclr)
    D_reg=0;
  else if (aset)
  D_reg=-1;
else if(gate==1)
D_reg=D_next;  
else
  D_reg = D_reg;
end

assign Q = D_reg;
assign D_next= data;
endmodule