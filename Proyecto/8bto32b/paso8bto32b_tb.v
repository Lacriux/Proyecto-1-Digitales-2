`timescale 1ns/1ns
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "paso8bto32b.v"
`include "probador_paso8bto32b.v"
`include "paso8bto32b_sintetizado.v"

module BancoPruebas;
    wire  clk_f, clk_4f, reset;
    wire  [7:0] data_in;
    wire  valid_0; 
    wire valid_out;
    wire [31:0] data_out;
    wire valid_out_sintetizado;
    wire [31:0] data_out_sintetizado;


paso8bto32b paso8bto32_cond(/*AUTOINST*/
			    // Outputs
			    .valid_out		(valid_out),
			    .data_out		(data_out[31:0]),
			    // Inputs
			    .clk_f		(clk_f),
			    .clk_4f		(clk_4f),
			    .data_in		(data_in[7:0]),
			    .valid_0		(valid_0),
			    .reset		(reset));

paso8bto32b_sintetizado paso8bto32b_estuct(/*AUTOINST*/
					   // Outputs
					   .data_out_sintetizado(data_out_sintetizado[31:0]),
					   .valid_out_sintetizado(valid_out_sintetizado),
					   // Inputs
					   .clk_4f		(clk_4f),
					   .clk_f		(clk_f),
					   .data_in		(data_in[7:0]),
					   .reset		(reset),
					   .valid_0		(valid_0));

probador_paso8bto32b probador(/*AUTOINST*/
			      // Outputs
			      .clk_f		(clk_f),
			      .clk_4f		(clk_4f),
			      .reset		(reset),
			      .data_in		(data_in[7:0]),
			      .valid_0		(valid_0),
			      // Inputs
			      .valid_out	(valid_out),
			      .valid_out_sintetizado(valid_out_sintetizado),
			      .data_out		(data_out[31:0]),
			      .data_out_sintetizado(data_out_sintetizado[31:0]));





endmodule
