module DigCt(
input IN1 ,IN2 ,IN3 ,IN4 ,IN5 ,
input CLK ,
output reg OUT1 ,OUT2 ,OUT3 
);

reg x1,x2,x3,x4,x5;
//Q1
always @(IN1,IN2)
begin 
    x1 =~(IN1|IN2);
end

always @(x1,IN3)
begin 
    x2 =~(x1&IN3);
end

always @(posedge CLK)
begin 
    OUT1 <=x2;
end
//end Q1


//Q2
always @(IN2,IN3)
begin 
    x3 =~(IN2&IN3);
end

always @(posedge CLK)
begin 
    OUT2 <=x3;
end
//end Q2

//Q3
always @(IN3,~IN4)
begin 
    x4 =(IN2|IN3);
end

always @(x4,~IN5)
begin 
    x5 =(x4|IN5);
end

always @(posedge CLK)
begin 
    OUT3 <=x5;
end
//end Q3

endmodule
