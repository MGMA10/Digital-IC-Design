module Decoder_Unit (
    input [1:0] s,
    output reg [3:0] OUT
);
always @(*) begin
    OUT[0] =~(s[0]|s[1]);
    OUT[1] =((~s[1])&s[0]);
    OUT[2] =((~s[0])&s[1]);
    OUT[3] =(s[0]&s[1]);
end
endmodule