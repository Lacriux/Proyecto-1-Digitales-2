`timescale 1ns/1ns
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "byteStriping_sintetizado.v"
`include "byteStriping.v"
`include "probador_byteStriping.v"

//Testbench
module BancoPruebas;
    wire            valid_in, clk, reset;
    wire    [31:0]  data_in;
    wire    [31:0]  lane_0, lane_0_sintetizado;
	wire    [31:0]  lane_1, lane_1_sintetizado;
	wire 			valid_0, valid_1, valid_0_sintetizado, valid_1_sintetizado;

    //Descripcion conductual
    byteStriping byteStriping_cond(/*AUTOINST*/
				   // Outputs
				   .valid_0		(valid_0),
				   .valid_1		(valid_1),
				   .lane_0		(lane_0[31:0]),
				   .lane_1		(lane_1[31:0]),
				   // Inputs
				   .valid_in		(valid_in),
				   .clk			(clk),
				   .reset		(reset),
				   .data_in		(data_in[31:0]));

    //Descripcion estructural
    byteStriping_sintetizado byteStriping_estruct(/*AUTOINST*/
						  // Outputs
						  .lane_0_sintetizado	(lane_0_sintetizado[31:0]),
						  .lane_1_sintetizado	(lane_1_sintetizado[31:0]),
						  .valid_0_sintetizado	(valid_0_sintetizado),
						  .valid_1_sintetizado	(valid_1_sintetizado),
						  // Inputs
						  .clk			(clk),
						  .data_in		(data_in[31:0]),
						  .reset		(reset),
						  .valid_in		(valid_in));

    // Probador: generador de senales y monitor
    probador_byteStriping probador(/*AUTOINST*/
				   // Outputs
				   .valid_in		(valid_in),
				   .clk			(clk),
				   .reset		(reset),
				   .data_in		(data_in[31:0]),
				   // Inputs
				   .lane_0		(lane_0[31:0]),
				   .lane_0_sintetizado	(lane_0_sintetizado[31:0]),
				   .lane_1		(lane_1[31:0]),
				   .lane_1_sintetizado	(lane_1_sintetizado[31:0]),
				   .valid_0		(valid_0),
				   .valid_1		(valid_1),
				   .valid_0_sintetizado	(valid_0_sintetizado),
				   .valid_1_sintetizado	(valid_1_sintetizado));

endmodule
