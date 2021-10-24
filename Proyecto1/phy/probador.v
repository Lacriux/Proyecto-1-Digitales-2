module probador(

//------------- outputs----------
	output reg [31:0] data_in_tx,
	output reg valid_in_tx,
	output reg clk,
	output reg clk_2f,
	output reg clk_4f,
	output reg clk_32f,
	output reg reset,
//-------------- inputs ---------
	input valid_out, valid_out_sintetizado,
	input [31:0] data_out, data_out_sintetizado);

	//Valores iniciales
	initial begin
		data_in_tx  = 0;
		valid_in_tx = 0;
	end
	// Bloque de procedimiento, no sintetizable.
	initial begin
		$dumpfile("verificacion_phy.vcd");
		$dumpvars;
		@(posedge clk_2f); //Primer flanco positvo
		reset <= 1;
		@(posedge clk_2f); //Primer flanco positvo
		reset <= 0;
		@(posedge clk_2f); //Primer flanco positvo
		data_in_tx <= 'h0xFFFFFFFF;
       		valid_in_tx <= 1;
		@(posedge clk_2f); //Segundo flanco positvo
		data_in_tx <= 'h0xEEEEEEEE;
		@(posedge clk_2f); //Tercer flanco positivo
		data_in_tx <= 'h0xDDDDDDDD;
		@(posedge clk_2f); //Cuarto flanco positivo
		data_in_tx <= 'h0xCCCCCCCC;
		@(posedge clk_2f); //Quinto flanco positivo
		valid_in_tx <= 0;
		@(posedge clk_2f); //Sexto flanco positivo
		@(posedge clk_2f); //Septimo flanco positivo
		valid_in_tx <= 1;
        	data_in_tx <= 'h0x00000003;
		@(posedge clk_2f); //Octavo flanco positivo
		data_in_tx <= 'h0x00000004;
		@(posedge clk_2f); //Noveno flanco positivo
		valid_in_tx <= 0;
		@(posedge clk_2f); //Decimo flanco positivo
		@(posedge clk_2f); //Undecimo flanco positivo
		valid_in_tx <= 1; data_in_tx <= 'h0xAAAAAAAA;
		@(posedge clk_2f); //Decimo segundo flanco positivo
		data_in_tx <= 'h0x99999999;
		@(posedge clk_2f); //Decimo tercero flanco positivo
		valid_in_tx <= 0;
		#8000 $finish; // Termina de almacenar senales



	end
	// Reloj
	initial	begin
		clk 	<= 1;		 // Valor inicial al reloj, sino siempre sera indeterminado
		clk_2f 	<= 1;		 // Valor inicial al reloj, sino siempre sera indeterminado
		clk_4f 	<= 1;		 // Valor inicial al reloj, sino siempre sera indeterminado
		clk_32f <= 1;		 // Valor inicial al reloj, sino siempre sera indeterminado
	end

	always	#640 clk 	<= ~clk;		// Hace "toggle" cada 2*16s
	always	#320 clk_2f 	<= ~clk_2f;   	// Hace "toggle" cada 2*8s
	always	#160 clk_4f 	<= ~clk_4f;		// Hace "toggle" cada 2*4s
	always	#20 clk_32f  <= ~clk_32f;   	// Hace "toggle" cada 2*1s


endmodule
