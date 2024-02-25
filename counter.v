module counter (
    input [4:0] IN,
    input Load,Up,Down,CLK,
    output reg High,Low,
    output reg [4:0] counter

);
    always @(posedge CLK) begin
        if (Load) begin
            counter <= IN;
        end
        else if (!High && Up)begin
            counter <= counter + 1;
        end // if counter =31 and up =1 down =1 the counter wil toggl as thier is no spics on that i won't fix it as it will add more complixty on the code 
        else if (!Low && Down)begin
            counter <= counter - 1;
        end
        High <= & counter;
        Low <= ~| counter;
    end
endmodule
