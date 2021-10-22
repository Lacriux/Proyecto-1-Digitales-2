`timescale 1ns / 100ps
// escala	unidad temporal (valor de "#1") / precisi�n
//include de los archivos.v
`include "probador.v"
`include "relojes.v"
`include "test.v"
`include "relojes_est.v"
`include "cmos_cells.v"
//`include "relojes_synth.v"

module BancoPruebas; //testbench
	wire clk_out_c,clk2f_out_c,clk4f_out_c,clk32f_out_c,rst,
	clk_out_e, clk2f_out_e, clk4f_out_e,
	a,not_a;
	relojes relojes_(/*AUTOINST*/
			 // Outputs
			 .clk4f_out_c		(clk4f_out_c),
			 .clk2f_out_c		(clk2f_out_c),
			 .clk_out_c		(clk_out_c),
			 // Inputs
			 .clk32f		(clk32f),
			 .rst			(rst));
	
	relojes_est relojes_est_(/*AUTOINST*/
				 // Outputs
				 .clk2f_out_e		(clk2f_out_e),
				 .clk4f_out_e		(clk4f_out_e),
				 .clk_out_e		(clk_out_e),
				 // Inputs
				 .clk32f		(clk32f),
				 .rst			(rst));
	test test_(/*AUTOINST*/
		   // Outputs
		   .not_a		(not_a),
		   // Inputs
		   .a			(a));
	probador probador_(/*AUTOINST*/
			   // Outputs
			   .a			(a),
			   .clk32f		(clk32f),
			   .rst			(rst),
			   // Inputs
			   .clk_out_c		(clk_out_c),
			   .clk2f_out_c		(clk2f_out_c),
			   .clk4f_out_c		(clk4f_out_c),
			   .clk_out_e		(clk_out_e),
			   .clk2f_out_e		(clk2f_out_e),
			   .clk4f_out_e		(clk4f_out_e),
			   .not_a		(not_a));
	

endmodule
