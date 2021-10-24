module paso8bto32b(
            input               clk_f, clk_4f,
            input       [7:0]   data_in,
            input               valid_0,
            input               reset,
            output reg          valid_out,
            output reg  [31:0]  data_out);

    reg [31:0] valorTrans;
    reg [31:0] valorTrans2;
    reg [1:0] selector;
    reg [1:0] contador_clk;
    reg validTemp;
    reg validTemp2;

    always @ (posedge clk_4f) begin
        if (reset) begin
            selector <= 0;
            valorTrans <= 0;
            valorTrans2 <= 0;
            validTemp <= 0;
            validTemp2 <= 0;
            contador_clk <= 0;
        end
        else begin
            if (validTemp) begin
                valorTrans2 <= valorTrans;
                validTemp <= 0;
                validTemp2 <= 1;
            end

            if (valid_0) begin
                case(selector)
                    0: begin
                        selector <= selector + 1;
                        valorTrans[31:24] <= data_in;
                    end
                    1: begin
                        selector <= selector + 1;
                        valorTrans[23:16] <= data_in;
                    end
                    2: begin
                        selector <= selector + 1;
                        valorTrans[15:8] <= data_in;
                    end
                    3: begin
                        valorTrans[7:0] <= data_in;
                        validTemp <= 1;
                        selector <= 0;
                    end
                endcase
            end

            if (contador_clk == 3) begin
                contador_clk <= 0;
                valid_out <= validTemp2;
                if (validTemp2 == 1) begin
                    data_out <= valorTrans2;
                    validTemp2 <= 0;
                end
            end
            else begin
                contador_clk <= contador_clk + 1;
            end
        end
    end

endmodule
