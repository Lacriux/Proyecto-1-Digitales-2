`timescale 1ns/1ns
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "paraleloSerial_sintetizado.v"
`include "paraleloSerial.v"
`include "probador_paraleloSerial.v"

//Testbench
module BancoPruebas;
    wire            clk_32f, clk_4f, reset, valid_in;
    wire    [7:0]   data_in;
    wire            data_out;
    wire            data_out_sintetizado;

    //Descripcion conductual
    paraleloSerial paraleloSerial_cond(/*AUTOINST*/
				       // Outputs
				       .data_out	(data_out),
				       // Inputs
				       .data_in		(data_in[7:0]),
				       .clk_4f		(clk_4f),
				       .clk_32f		(clk_32f),
				       .valid_in	(valid_in),
				       .reset		(reset));

    //Descripcion estructural
    paraleloSerial_sintetizado paraleloSerial_estruct(/*AUTOINST*/
						      // Outputs
						      .data_out_sintetizado(data_out_sintetizado),
						      // Inputs
						      .clk_32f		(clk_32f),
						      .clk_4f		(clk_4f),
						      .data_in		(data_in[7:0]),
						      .reset		(reset),
						      .valid_in		(valid_in));

    // Probador: generador de senales y monitor
    probador_paraleloSerial probador(/*AUTOINST*/
				     // Outputs
				     .data_in		(data_in[7:0]),
				     .clk_4f		(clk_4f),
				     .clk_32f		(clk_32f),
				     .valid_in		(valid_in),
				     .reset		(reset),
				     // Inputs
				     .data_out		(data_out),
				     .data_out_sintetizado(data_out_sintetizado));

endmodule
