/*
probador del paso 
*/

module probador_paso32bto8b(
    output reg clk_f, clk_4f, reset,
    output reg [31:0] data_in,
    output reg valid_0, 
    input valid_out, valid_out_sintetizado, 
    input [7:0] data_out, data_out_sintetizado);
 
    
    
    initial begin
        $dumpfile("verificacion_paso32bto8b.vcd");
        $dumpvars;

        data_in <= 32'b0;
        valid_0 <= 1'b0;

        @(posedge clk_4f)
            reset <=1;
        @(posedge clk_4f)
            reset<=0;

        @(posedge clk_f)
            data_in <= 32'hABCDEFFF;
            valid_0 <= 1'b1;

        @(posedge clk_f)
            data_in <= 32'hADBDCDDD;
            valid_0 <= 1'b1;

        @(posedge clk_f)
        valid_0 <= 1'b0;
    
        @(posedge clk_f)
            data_in <= 32'h01020403;
            valid_0 <= 1'b1;

        @(posedge clk_f)
            #80 $finish;
    end
        

    
    
//Valor inicial del reloj para que no sea indeterminado
	initial	clk_f 	<= 1;
    initial	clk_4f 	<= 1;

    //Toggle cada 2*10 nano segundos		
	always	#8 clk_f <= ~clk_f;
    always  #2 clk_4f <= ~clk_4f;
endmodule