module probador_serialParalelo( // Modulo probador: generador de senales y monitor de datos
	input   		[7:0]  data_out,
	input   		[7:0]  data_out_sintetizado,
	input 						 valid_out, valid_out_sintetizado,
	output	reg        clk_32f, clk_4f, reset,
  	output	reg   	   data_in);

	//Valores iniciales
	initial begin
		data_in  = 0;
	end
	// Bloque de procedimiento, no sintetizable.
	initial begin
		$dumpfile("verificacion_serialParalelo.vcd");	// Nombre de archivo del "dump"
		$dumpvars;				// Directiva para "dumpear" variables

		@(posedge clk_32f); //Primer flanco positvo reloj 4f
		reset <= 1;
		@(posedge clk_32f); //Primer flanco positvo reloj 4
		reset <= 0;

		// Se envían los 4 'h0xBC
		repeat (4) begin
			@(posedge clk_32f);
			data_in <= 1;
			@(posedge clk_32f);
			data_in <= 0;
			@(posedge clk_32f);
			data_in <= 1;
			@(posedge clk_32f);
			data_in <= 1;
			@(posedge clk_32f);
			data_in <= 1;
			@(posedge clk_32f);
			data_in <= 1;
			@(posedge clk_32f);
			data_in <= 0;
			@(posedge clk_32f);
			data_in <= 0;
		end
		// Se envían 0xFF y 0xEE como datos válidos
		// Primero el 0xFF
		repeat (8) begin
			@(posedge clk_32f);
			data_in <= 1;
		end
		// Ahora el 0xEE
		repeat (3) begin
			@(posedge clk_32f);
			data_in <= 1;
		end
		@(posedge clk_32f);
		data_in <= 0;
		repeat (3) begin
			@(posedge clk_32f);
			data_in <= 1;
		end
		@(posedge clk_32f);
		data_in <= 0;

		// Se vuelve a enviar un último 0xBC
		@(posedge clk_32f);
		data_in <= 1;
		@(posedge clk_32f);
		data_in <= 0;
		@(posedge clk_32f);
		data_in <= 1;
		@(posedge clk_32f);
		data_in <= 1;
		@(posedge clk_32f);
		data_in <= 1;
		@(posedge clk_32f);
		data_in <= 1;
		@(posedge clk_32f);
		data_in <= 0;
		@(posedge clk_32f);
		data_in <= 0;

		repeat (3) @(posedge clk_4f);

		#8 $finish; // Termina de almacenar senales
	end

	// Reloj
	initial	clk_4f 	<= 0;			// Valor inicial al reloj, sino siempre sera indeterminado
	always	#8 clk_4f 	<= ~clk_4f;		// Hace "toggle" cada 32 ns
	initial clk_32f <= 1;
	always #1 clk_32f <= ~clk_32f; // Hace toogle cada 4 ns

endmodule
