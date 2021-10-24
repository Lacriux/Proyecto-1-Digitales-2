module byteStriping(
    input               valid_in, clk, reset,
    input       [31:0]  data_in,
    output  reg         valid_0, valid_1,
    output  reg [31:0]  lane_0,
    output  reg [31:0]  lane_1);

    reg         selector;
    always @ (posedge clk) begin
        if (reset)begin
            selector <= 0;
            lane_0 <= 0;
            lane_1 <= 0;
            valid_0 <= 0;
            valid_1 <= 0;
        end
        else begin
            if (valid_in)begin
                if (~selector)begin
                    lane_1 <= data_in;
                    valid_1 <= valid_in;
                end
                else begin
                    lane_0 <= data_in;
                    valid_0 <= valid_in;
                end
            end
            else begin
                if (~selector)begin
                    valid_1 <= valid_in;
                end
                else begin
                    valid_0 <= valid_in;
                end
            end
            selector <= ~selector;
        end
    end
endmodule
