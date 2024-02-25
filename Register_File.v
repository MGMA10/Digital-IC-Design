module Register_File (
    input [15:0]WrData,
    input [2:0]Address,
    input RdEn,WrEn,
    input CLK,RST,
    output reg [15:0] RdData
);
    reg [15:0] register [7:0];
    always @(posedge CLK, negedge RST) begin
        if (RST)
        begin
            case ({WrEn , RdEn})
                0: begin
                    RdData <= RdData;
                    register[Address]<=register[Address];
                end
                1: begin
                    RdData <= register[Address];
                    register[Address]<=register[Address];
                end
                2: begin
                    RdData <= RdData;
                    register[Address]<=WrData;
                end
                3: begin
                    RdData <= RdData;
                    register[Address]<=register[Address];
                end
                default:  begin
                    RdData <= RdData;
                    register[Address]<=register[Address];
                end
            endcase
        end
        else
        begin
            register[0] <= 0;
            register[1] <= 0;
            register[2] <= 0;
            register[3] <= 0;
            register[4] <= 0;
            register[5] <= 0;
            register[6] <= 0;
            register[7] <= 0;
        end
    end
endmodule