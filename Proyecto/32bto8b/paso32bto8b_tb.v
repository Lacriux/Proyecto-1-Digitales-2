`include "paso32bto8b.v"
`include "probador_paso32bto8b.v"
`include "paso32bto8b_sintetizado.v"


`timescale 1ns/1ns
// escala unidad temporal (valor de "#1") / precision

module BancoPruebas;
    wire  clk_f, clk_4f;
    wire  [31:0] data_in;
    wire  valid_0; 
    wire valid_out;
    wire [7:0] data_out;
    wire valid_out_sintetizado;
    wire [7:0] data_out_sintetizado;



paso32bto8b paso32bto8b_conductual(/*AUTOINST*/
				   // Outputs
				   .valid_out		(valid_out),
				   .data_out		(data_out[7:0]),
				   // Inputs
				   .clk_f		(clk_f),
				   .clk_4f		(clk_4f),
				   .reset		(reset),
				   .data_in		(data_in[31:0]),
				   .valid_0		(valid_0));


probador_paso32bto8b probador32bto8b(/*AUTOINST*/
				     // Outputs
				     .clk_f		(clk_f),
				     .clk_4f		(clk_4f),
				     .reset		(reset),
				     .data_in		(data_in[31:0]),
				     .valid_0		(valid_0),
				     // Inputs
				     .valid_out		(valid_out),
				     .valid_out_sintetizado(valid_out_sintetizado),
				     .data_out		(data_out[7:0]),
				     .data_out_sintetizado(data_out_sintetizado[7:0]));

paso32bto8b_sintetizado paso32bto8b_struct(/*AUTOINST*/
					   // Outputs
					   .data_out_sintetizado(data_out_sintetizado[7:0]),
					   .valid_out_sintetizado(valid_out_sintetizado),
					   // Inputs
					   .clk_4f		(clk_4f),
					   .clk_f		(clk_f),
					   .data_in		(data_in[31:0]),
					   .reset		(reset),
					   .valid_0		(valid_0));



endmodule
