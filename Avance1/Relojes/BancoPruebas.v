`timescale 1ns / 100ps
// escala	unidad temporal (valor de "#1") / precisi�n
//include de los archivos.v
`include "probador.v"
`include "relojes.v"
`include "test.v"

module BancoPruebas; //testbench
	wire clk,clk2f,clk4f,clk32f,
	a,not_a;
	relojes relojes_(/*AUTOINST*/
			 // Outputs
			 .clk4f			(clk4f),
			 .clk2f			(clk2f),
			 .clk			(clk),
			 // Inputs
			 .clk32f		(clk32f));
	test test_(/*AUTOINST*/
		   // Outputs
		   .not_a		(not_a),
		   // Inputs
		   .a			(a));
	probador probador_(/*AUTOINST*/
			   // Outputs
			   .a			(a),
			   .clk32f		(clk32f),
			   // Inputs
			   .clk			(clk),
			   .clk2f		(clk2f),
			   .clk4f		(clk4f),
			   .not_a		(not_a));

endmodule
