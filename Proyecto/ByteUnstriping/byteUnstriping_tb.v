`timescale 1ns/1ns
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "byteUnstriping_sintetizado.v"
`include "byteUnstriping.v"
`include "probador_byteUnstriping.v"

//Testbench
module BancoPruebas;
    wire            valid_out, valid_out_sintetizado, clk, reset;
    wire    [31:0]  data_out, data_out_sintetizado;
    wire    [31:0]  lane_0;
	wire    [31:0]  lane_1;
	wire 			valid_0, valid_1;

    //Descripcion conductual
    byteUnstriping byteUnstriping_cond(/*AUTOINST*/
				       // Outputs
				       .valid_out	(valid_out),
				       .data_out	(data_out[31:0]),
				       // Inputs
				       .valid_0		(valid_0),
				       .valid_1		(valid_1),
				       .clk		(clk),
				       .reset		(reset),
				       .lane_0		(lane_0[31:0]),
				       .lane_1		(lane_1[31:0]));

    //Descripcion estructural
    byteUnstriping_sintetizado byteUnstriping_estruct(/*AUTOINST*/
						      // Outputs
						      .data_out_sintetizado(data_out_sintetizado[31:0]),
						      .valid_out_sintetizado(valid_out_sintetizado),
						      // Inputs
						      .clk		(clk),
						      .lane_0		(lane_0[31:0]),
						      .lane_1		(lane_1[31:0]),
						      .reset		(reset),
						      .valid_0		(valid_0),
						      .valid_1		(valid_1));

    // Probador: generador de senales y monitor
    probador_byteUnstriping probador(/*AUTOINST*/
				     // Outputs
				     .lane_0		(lane_0[31:0]),
				     .lane_1		(lane_1[31:0]),
				     .valid_0		(valid_0),
				     .valid_1		(valid_1),
				     .clk		(clk),
				     .reset		(reset),
				     // Inputs
				     .valid_out		(valid_out),
				     .valid_out_sintetizado(valid_out_sintetizado),
				     .data_out		(data_out[31:0]),
				     .data_out_sintetizado(data_out_sintetizado[31:0]));

endmodule
