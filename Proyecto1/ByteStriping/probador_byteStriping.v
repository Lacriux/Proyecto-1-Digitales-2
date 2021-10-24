module probador_byteStriping( // Modulo probador: generador de senales y monitor de datos
	input   		[31:0]  lane_0, lane_0_sintetizado,
	input   		[31:0]  lane_1, lane_1_sintetizado,
	input 					valid_0, valid_1, valid_0_sintetizado, valid_1_sintetizado,
	output	reg            	valid_in, clk, reset,
    output	reg   	[31:0]  data_in);

	//Valores iniciales
	initial begin
		data_in  = 0;
		valid_in = 1;
	end
	// Bloque de procedimiento, no sintetizable.
	initial begin
		$dumpfile("verificacion_byteStriping.vcd");	// Nombre de archivo del "dump"
		$dumpvars;				// Directiva para "dumpear" variables
		@(posedge clk); //Primer flanco positvo
		reset <= 1;
		@(posedge clk); //Primer flanco positvo
		reset <= 0;
		@(posedge clk); //Primer flanco positvo
		data_in <= 'h0xFFFFFFFF;
		@(posedge clk); //Segundo flanco positvo
		data_in <= 'h0xEEEEEEEE;
		@(posedge clk); //Tercer flanco positivo
		data_in <= 'h0xDDDDDDDD;
		@(posedge clk); //Cuarto flanco positivo
		data_in <= 'h0xCCCCCCCC;
		@(posedge clk); //Quinto flanco positivo
		valid_in <= 0;
		@(posedge clk); //Sexto flanco positivo
		@(posedge clk); //Septimo flanco positivo
		valid_in <= 1; data_in <= 'h0x00000003;
		@(posedge clk); //Octavo flanco positivo
		data_in <= 'h0x00000004;
		@(posedge clk); //Noveno flanco positivo
		valid_in <= 0;
		@(posedge clk); //Decimo flanco positivo
		@(posedge clk); //Undecimo flanco positivo
		valid_in <= 1; data_in <= 'h0xAAAAAAAA;
		@(posedge clk); //Decimo segundo flanco positivo
		data_in <= 'h0x99999999;
		@(posedge clk); //Decimo tercero flanco positivo
		valid_in <= 0;
		#8 $finish; // Termina de almacenar senales
	end

	// Reloj
	initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre sera indeterminado
	always	#20 clk 	<= ~clk;		// Hace "toggle" cada 2*10s
	//Frecuencia maxima experimental a los #2.5, mas bajo de esto se cae.

endmodule
