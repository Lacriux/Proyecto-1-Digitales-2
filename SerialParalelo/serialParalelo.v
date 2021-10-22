/*Modulo verde serial paralelo*/
module serialParalelo (
              input             clk_32f, clk_4f,
              input             data_in,
              input             reset,
              output reg [7:0]  data_out,
              output reg        valid_out);

    reg active;
    reg temp;
    reg temp1;
    reg temp2;
    reg temp3;
    reg temp4;
    reg temp5;
    reg temp6;
    reg temp7;
    reg [3:0] selector;
    reg [2:0] BC_counter;
    reg [7:0] data2Send;
    reg valid_dts;
    reg [7:0] contador_CLK;

    always @ (posedge clk_32f) begin
        if (reset) begin
            active = 0;
            selector = 0;
            temp7 = 0;
            temp6 = 0;
            temp5 = 0;
            temp4 = 0;
            temp3 = 0;
            temp2 = 0;
            temp1 = 0;
            temp = 0;
            BC_counter = 0;
            valid_dts = 0;
            contador_CLK = 0;
        end
        else begin
            if (valid_dts) begin
                data2Send <= {temp7, temp6, temp5, temp4, temp3, temp2, temp1, temp};
                valid_dts <= 0;
            end
            else begin
                data2Send <= data2Send;
            end

            case (selector)
                0: begin
                    temp <= data_in;
                    selector <= 7;
                    valid_dts <= 1;
                end
                1: begin
                    temp1 <= data_in;
                    selector <= 0;
                end
                2: begin
                    temp2 <= data_in;
                    selector <= 1;
                end
                3: begin
                    temp3 <= data_in;
                    selector <= 2;
                end
                4: begin
                    temp4 <= data_in;
                    selector <= 3;
                end
                5: begin
                    temp5 <= data_in;
                    selector <= 4;
                end
                6: begin
                    temp6 <= data_in;
                    selector <= 5;
                end
                7: begin
                    temp7 <= data_in;
                    selector <= 6;
                end
            endcase

            if (BC_counter == 3) begin
                active <= 1;
            end
            else begin
                active <= active;
            end

            if (contador_CLK == 7) begin
                contador_CLK <= 0;
                if (active && data2Send != 'hBC) begin
                    data_out <= data2Send;
                    valid_out <= 1;
                end
                else begin
                    data_out <= data2Send;
                    valid_out <= 0;
                end

                if (data2Send == 'hBC && active == 0) begin
                    BC_counter <= BC_counter + 1;
                end
                else begin
                end
            end
            else begin
                contador_CLK <= contador_CLK + 1;
            end
        end
    end

endmodule
