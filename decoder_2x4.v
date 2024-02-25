module decoder_2x4 (
  input x1 ,x2, en,
  output reg [3:0] y  
  );
always @ (x1,x2)
begin 
  y=4'b0000;
  if (en)

y[{x2,x1}]=1'b1;  
  /*
  if(x1==0 && x2==0)
  y[0] = 1'b1;
  else if(x1==1 && x2==0)
    y[1] = 1'b1;
  else if(x1==0 && x2==1)
  y[2] = 1'b1;
   else if(x1==1 && x2==1)
  y[3] = 1'b1;
  else
    y=4'b0000;
    */
/*
    casex(x1)
0:casex(x2)
0:y=4'b1000;
1:y=4'b0100;
default:y=4'b0000;
endcase
1:casex(x2)
0:y=4'b0010;
1:y=4'b0001;
default:y=4'b0000;
endcase
default:y=4'b0000;
endcase
*/
else
    y=4'b0000;

end
endmodule