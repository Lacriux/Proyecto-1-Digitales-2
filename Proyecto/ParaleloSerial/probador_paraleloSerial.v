module probador_paraleloSerial( // Modulo probador: generador de senales y monitor de datos
	input 				data_out, data_out_sintetizado,
	output reg [7:0]	data_in,
	output reg 			clk_4f, clk_32f, valid_in, reset);

	//Valores iniciales
	initial begin
		data_in  = 0;
		valid_in = 0;
		reset = 1;
	end
	// Bloque de procedimiento, no sintetizable.
	initial begin
		$dumpfile("verificacion_paraleloSerial.vcd");	// Nombre de archivo del "dump"
		$dumpvars;				// Directiva para "dumpear" variables

		@(posedge clk_4f)
		reset <= 0;

		@(posedge clk_4f)
		data_in <= 'hFF;
		valid_in <= 1;

		@(posedge clk_4f)
		data_in <= 'hEE;

		@(posedge clk_4f)
		valid_in <= 0;
		data_in <= 'hAA;

		@(posedge clk_4f)
		#8 $finish;

	end

	// Reloj
	initial	begin
		clk_4f 	<= 0;		 // Valor inicial al reloj, sino siempre sera indeterminado
		clk_32f <= 1;		 // Valor inicial al reloj, sino siempre sera indeterminado
	end
	always	begin
		#32 clk_4f 	<= ~clk_4f;		// Hace "toggle" cada 2*16s
	end
	always begin
		#4 clk_32f <= ~clk_32f;   // Hace "toggle" cada 2*2s
	end


endmodule
