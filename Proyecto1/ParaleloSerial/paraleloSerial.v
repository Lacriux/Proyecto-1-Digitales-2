module paraleloSerial(
    input      [7:0]  data_in,
    input             clk_4f, clk_32f, valid_in, reset,
    output reg        data_out);

    reg [7:0] data2send;
    reg [3:0] selector;
    //reg validTemp;

    always @(posedge clk_32f) begin
        if (reset)begin
            data2send <= 'hBC;
            data_out <= 0;
            selector <= 7;
            //validTemp <= 1;
        end
        else begin
            if (valid_in == 0) begin
                //validTemp <= 0;
                data2send <= 'hBC;
            end
            else begin
                data2send <= data_in;
                //validTemp <= 0;
            end

            if (selector == 0) begin
                data_out <= data2send[selector];
                selector <= 7;
                //validTemp <= 1;
            end
            else begin
                data_out <= data2send[selector];
                selector <= selector - 1;
            end
        end
    end
endmodule
