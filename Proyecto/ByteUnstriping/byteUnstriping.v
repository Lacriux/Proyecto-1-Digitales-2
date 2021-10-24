module byteUnstriping(
    input               valid_0, valid_1, clk, reset,
    input       [31:0]  lane_0,
    input       [31:0]  lane_1,
    output  reg         valid_out,
    output  reg [31:0]  data_out);

    reg     selector;
    always @ (posedge clk) begin
        if (reset)begin
            selector <= 0;
            valid_out <= 0;
            data_out <= 0;
        end
        else begin
            if (selector)begin
                if(valid_1)begin
                    data_out <= lane_1;
                    valid_out <= valid_1;
                end
            end
            else begin
                if(valid_0)begin
                    data_out <= lane_0;
                    valid_out <= valid_0;
                end
                else begin
                    valid_out <= valid_0;
                end
            end
            selector <= ~selector;
        end
    end
endmodule
