module probador_phy_rx( // Modulo probador: generador de senales y monitor de datos
	input	   [31:0]	data_out_rx, data_out_rx_sintetizado,
	input 				valid_out_rx, valid_out_rx_sintetizado,
	output reg			data_in_lane0_rx, data_in_lane1_rx,
	output reg 			clk, clk_2f, clk_4f, clk_32f, reset);

	//Valores iniciales
	initial begin
		data_in_lane0_rx  = 0;
		data_in_lane1_rx = 0;
	end
	// Bloque de procedimiento, no sintetizable.
	initial begin
		$dumpfile("verificacion_phy_rx.vcd");	// Nombre de archivo del "dump"
		$dumpvars;				// Directiva para "dumpear" variables

	@(posedge clk_4f); //Primer flanco positvo reloj 4f
		reset <= 1;
	
		@(posedge clk_4f); //Primer flanco positvo reloj 4f
		reset <= 0;

		// Se envían los 4 'h0xBC
		repeat (4) begin
			@(posedge clk_32f);
			data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
			@(posedge clk_32f);
			data_in_lane0_rx <= 0; data_in_lane1_rx <= 0;
			@(posedge clk_32f);
			data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
			@(posedge clk_32f);
			data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
			@(posedge clk_32f);
			data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
			@(posedge clk_32f);
			data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
			@(posedge clk_32f);
			data_in_lane0_rx <= 0; data_in_lane1_rx <= 0;
			@(posedge clk_32f); 
			data_in_lane0_rx <= 0; data_in_lane1_rx <= 0;
		end
		// Se envían 0xFF y 0xEE como datos válidos
		// Primero el 0xFF
		repeat (8) begin
			@(posedge clk_32f);
			data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
		end
		// Ahora el 0xEE
		repeat (3) begin
			@(posedge clk_32f);
			data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
		end
		@(posedge clk_32f);
		data_in_lane0_rx <= 0; data_in_lane1_rx <= 0;
		repeat (3) begin
			@(posedge clk_32f);
			data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
		end
		@(posedge clk_32f);
		data_in_lane0_rx <= 0; data_in_lane1_rx <= 0;


		//Segunda ronda de pruebas //


		// Se envían 0xFF y 0xEE como datos válidos
		// Primero el 0xFF
		repeat (8) begin
			@(posedge clk_32f);
			data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
		end
		// Ahora el 0xEE
		repeat (3) begin
			@(posedge clk_32f);
			data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
		end
		@(posedge clk_32f);
		data_in_lane0_rx <= 0; data_in_lane1_rx <= 0;
		repeat (3) begin
			@(posedge clk_32f);
			data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
		end
		@(posedge clk_32f);
		data_in_lane0_rx <= 0; data_in_lane1_rx <= 0;

		// Se vuelve a enviar un último 0xBC
		@(posedge clk_32f);
		data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
		@(posedge clk_32f);
		data_in_lane0_rx <= 0; data_in_lane1_rx <= 0;
		@(posedge clk_32f);
		data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
		@(posedge clk_32f);
		data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
		@(posedge clk_32f);
		data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
		@(posedge clk_32f);
		data_in_lane0_rx <= 1; data_in_lane1_rx <= 1;
		@(posedge clk_32f);
		data_in_lane0_rx <= 0; data_in_lane1_rx <= 0;
		@(posedge clk_32f);
		data_in_lane0_rx <= 0; data_in_lane1_rx <= 0;

		repeat (3) @(posedge clk_4f);

		#8000 $finish; // Termina de almacenar senales
	end


	// Reloj
	initial	begin
		clk 	<= 0;		 // Valor inicial al reloj, sino siempre sera indeterminado
		clk_2f 	<= 0;		 // Valor inicial al reloj, sino siempre sera indeterminado
		clk_4f 	<= 0;		 // Valor inicial al reloj, sino siempre sera indeterminado
		clk_32f <= 0;		 // Valor inicial al reloj, sino siempre sera indeterminado
	end
	always	#320 clk 	<= ~clk;		// Hace "toggle" cada 2*16s
	always	#160 clk_2f <= ~clk_2f;   	// Hace "toggle" cada 2*8s
	always	#80 clk_4f 	<= ~clk_4f;		// Hace "toggle" cada 2*4s
	always	#10 clk_32f  <= ~clk_32f;   	// Hace "toggle" cada 2*1s


endmodule
