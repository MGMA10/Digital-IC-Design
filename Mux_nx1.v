module mux_nx1 #(parameter n=10)(
  input [n-1:0] x,
  input  [$clog2(n)-1:0] s,
  output reg y
);

integer k;
  always @ (x,s)
  begin
    
    y='bx;
    for(k=0;k<n;k=k+1)
    begin
      if (k==s)
        y=x[k];
      
    end
    
  end

 
endmodule

