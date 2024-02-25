module mux_2x1_beh(
input x1 ,x2 ,s,
output reg y
);

always @(x1,x2,s)
begin 
    if (s)
    begin
        y = x2;
    end  
    else
    begin
        y = x1;
    end
end

endmodule
