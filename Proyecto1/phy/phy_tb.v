`timescale 1ns /100ps
`include "phy.v"
`include "phy_sintetizado.v"
`include "probador.v"


module BancoPruebas;

wire clk, clk_2f, clk_4f, clk_32f, reset;
wire [31:0] data_in_tx, data_out, data_out_sintetizado;
wire valid_in, valid_out, valid_out_sintetizado;
	
phy phy_conductual(/*AUTOINST*/
		   // Outputs
		   .data_out		(data_out[31:0]),
		   .valid_out		(valid_out),
		   // Inputs
		   .data_in_tx		(data_in_tx[31:0]),
		   .reset		(reset),
		   .valid_in_tx		(valid_in_tx),
		   .clk			(clk),
		   .clk_2f		(clk_2f),
		   .clk_4f		(clk_4f),
		   .clk_32f		(clk_32f));

phy_sintetizado phy_struct(/*AUTOINST*/
			   // Outputs
			   .data_out_sintetizado(data_out_sintetizado[31:0]),
			   .valid_out_sintetizado(valid_out_sintetizado),
			   // Inputs
			   .clk			(clk),
			   .clk_2f		(clk_2f),
			   .clk_32f		(clk_32f),
			   .clk_4f		(clk_4f),
			   .data_in_tx		(data_in_tx[31:0]),
			   .reset		(reset),
			   .valid_in_tx		(valid_in_tx));

probador probador (/*AUTOINST*/
		   // Outputs
		   .data_in_tx		(data_in_tx[31:0]),
		   .valid_in_tx		(valid_in_tx),
		   .clk			(clk),
		   .clk_2f		(clk_2f),
		   .clk_4f		(clk_4f),
		   .clk_32f		(clk_32f),
		   .reset		(reset),
		   // Inputs
		   .valid_out		(valid_out),
		   .valid_out_sintetizado(valid_out_sintetizado),
		   .data_out		(data_out[31:0]),
		   .data_out_sintetizado(data_out_sintetizado[31:0]));
endmodule
