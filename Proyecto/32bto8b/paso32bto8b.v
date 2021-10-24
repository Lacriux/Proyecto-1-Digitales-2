module paso32bto8b(
    input clk_f, clk_4f, reset,

    input [31:0] data_in,
    input valid_0,
    output reg valid_out,
    output reg [7:0] data_out);

    reg [7:0] valorTrans;
    reg  validTemp;
    reg  [1:0] indice;


    always @(posedge clk_4f)begin

        if(reset ==1)begin
            indice<=0;
            valid_out <= 0;
            validTemp <= 0;

        end
        else begin
            if (valid_0 == 1) begin
                if (indice ==0) begin
                    data_out <= data_in[31:24];
                    valid_out <= 1;
                    indice <= indice + 1;
                end
                else if (indice ==1) begin
                    data_out <= data_in[23:16];
                    indice <= indice + 1;
                    valid_out <= 1;
                end
                else if (indice ==2) begin
                    data_out <= data_in[15:8];
                    indice <= indice + 1;
                    valid_out <= 1;
                end
                else if (indice ==3) begin
                    data_out <= data_in[7:0];
                    valid_out <= 1;
                    indice <= 0; //reinicia el contador de posiciones
                end
            end
            else begin
                valid_out <= 0;
            end
        end
    end
endmodule
