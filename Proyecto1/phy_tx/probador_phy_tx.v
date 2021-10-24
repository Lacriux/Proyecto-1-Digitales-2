module probador_phy_tx( // Modulo probador: generador de senales y monitor de datos
    output reg [31:0] data_in_tx,
    output reg clk,
    output reg clk_2f,
    output reg clk_4f,
    output reg clk_32f,
    output reg valid_in_tx,
    output reg reset,
    input data_out_lane_0_sintetizado_tx, data_out_lane_1_sintetizado_tx,
    input data_out_lane_0_tx, data_out_lane_1_tx);

	//Valores iniciales
	initial begin
		data_in_tx <= 0;
		valid_in_tx <= 0;
	end
	// Bloque de procedimiento, no sintetizable.
	initial begin
		$dumpfile("verificacion_phy_tx.vcd");	// Nombre de archivo del "dump"
		$dumpvars;				// Directiva para "dumpear" variables
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
		#8 $finish; // Termina de almacenar senales
	end

	
  	// Reloj

    //Valor inicial del reloj para que no sea indeterminado
	initial	clk 	<= 0;
    initial	clk_2f 	<= 0;
    initial	clk_4f 	<= 0;
    initial clk_32f <= 0;

    //Toggle cada 2*10 nano segundos		
	always	#32 clk <= ~clk;

    always  #16 clk_2f <= ~clk_2f;

    always  #8 clk_4f <= ~clk_4f;
    
    always  #1 clk_32f <= ~clk_32f;
    		
endmodule