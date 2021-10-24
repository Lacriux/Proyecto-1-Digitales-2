module probador_byteUnstriping( // Modulo probador: generador de senales y monitor de datos
	input       		valid_out, valid_out_sintetizado,
    input 		[31:0]  data_out, data_out_sintetizado,
	output reg  [31:0]  lane_0,
	output reg 	[31:0]  lane_1,
	output reg			valid_0, valid_1, clk, reset);

	//Valores iniciales
	initial begin
		lane_0  = 0;
		lane_1 = 0;
		valid_0 = 0;
		valid_1 = 0;
	end
	// Bloque de procedimiento, no sintetizable.
	initial begin
		$dumpfile("verificacion_byteUnstriping.vcd");	// Nombre de archivo del "dump"
		$dumpvars;				// Directiva para "dumpear" variables
		$display ("\t\t\tclk,\tlane_0,\tvalid_0,\tlane_1,\tvalid_1,\tdata_out,\tvalid_out");
		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor($time,"\t%b\t%h\t%b\t%h\t%b\t%h\t%b", clk, lane_0, valid_0, lane_1, valid_1, data_out, valid_out);
		@(posedge clk); //Flanco positivo para reset
		reset <= 1;
		@(posedge clk); //Flanco positvo para apagar reset
		reset <= 0;
		@(posedge clk); //Primer flanco positvo
		lane_0 <= 'h0xFFFFFFFF;
		valid_0 <= 1;
		@(posedge clk); //Segundo flanco positvo
		lane_1 <= 'h0xEEEEEEEE;
		valid_1 <= 1;
		@(posedge clk); //Tercer flanco positivo
		lane_0 <= 'h0xDDDDDDDD;
		@(posedge clk); //Cuarto flanco positivo
		lane_1 <= 'h0xCCCCCCCC;
		@(posedge clk); //Quinto flanco positivo
		valid_0 <= 0;
		@(posedge clk); //Sexto flanco positivo
		valid_1 = 0;
		@(posedge clk); //Septimo flanco positivo
		valid_0 <= 1; lane_0 <= 'h0x00000003;
		@(posedge clk); //Octavo flanco positivo
		valid_1 <= 1; lane_1 <= 'h0x00000004;
		@(posedge clk); //Noveno flanco positivo
		valid_0 <= 0;
		@(posedge clk); //Decimo flanco positivo
		valid_1 <= 0;
		@(posedge clk); //Undecimo flanco positivo
		valid_0 <= 1; lane_0 <= 'h0xAAAAAAAA;
		@(posedge clk); //Decimo segundo flanco positivo
		valid_1 <= 1; lane_1 <= 'h0x99999999;
		@(posedge clk); //Decimo tercero flanco positivo
		valid_0 <= 0;
		@(posedge clk); //Decimo cuarto flanco positivo
		valid_1 <= 0;
		#8 $finish; // Termina de almacenar senales
	end

	// Reloj
	initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre sera indeterminado
	always	#20 clk 	<= ~clk;		// Hace "toggle" cada 2*10s
	//Frecuencia maxima experimental a los #2.5, mas bajo de esto se cae.

endmodule
