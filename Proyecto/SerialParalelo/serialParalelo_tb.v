`timescale 1ns/1ns
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "serialParalelo_sintetizado.v"
`include "serialParalelo.v"
`include "probador_serialParalelo.v"

//Testbench
module BancoPruebas;
    wire            clk_32f, clk_4f, reset;
    wire            valid_out, valid_out_sintetizado;
    wire            data_in;
    wire    [7:0]   data_out;
    wire    [7:0]   data_out_sintetizado;

    //Descripcion conductual
    serialParalelo serialParalelo_cond(/*AUTOINST*/
				       // Outputs
				       .data_out	(data_out[7:0]),
				       .valid_out	(valid_out),
				       // Inputs
				       .clk_32f		(clk_32f),
				       .clk_4f		(clk_4f),
				       .data_in		(data_in),
				       .reset		(reset));

    //Descripcion estructural
    serialParalelo_sintetizado serialParalelo_estruct(/*AUTOINST*/
						      // Outputs
						      .data_out_sintetizado(data_out_sintetizado[7:0]),
						      .valid_out_sintetizado(valid_out_sintetizado),
						      // Inputs
						      .clk_32f		(clk_32f),
						      .clk_4f		(clk_4f),
						      .data_in		(data_in),
						      .reset		(reset));

    // Probador: generador de senales y monitor
    probador_serialParalelo probador(/*AUTOINST*/
				     // Outputs
				     .clk_32f		(clk_32f),
				     .clk_4f		(clk_4f),
				     .reset		(reset),
				     .data_in		(data_in),
				     // Inputs
				     .data_out		(data_out[7:0]),
				     .data_out_sintetizado(data_out_sintetizado[7:0]),
				     .valid_out		(valid_out),
				     .valid_out_sintetizado(valid_out_sintetizado));

endmodule
