`timescale 1ns/1ns
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "phy_rx.v"
`include "phy_rx_sintetizado.v"
`include "probador_phy_rx.v"

//Testbench
module BancoPruebas;
   	wire data_in_lane0_rx, data_in_lane1_rx;
    wire clk;
    wire clk_2f;
    wire clk_4f;
    wire clk_32f;
    wire reset;
    wire valid_out_rx, valid_out_rx_sintetizado;
    wire [31:0] data_out_rx, data_out_rx_sintetizado;

    //Descripcion conductual
   phy_rx phy_rx_cond(/*AUTOINST*/
		      // Outputs
		      .valid_out_rx	(valid_out_rx),
		      .data_out_rx	(data_out_rx[31:0]),
		      // Inputs
		      .data_in_lane0_rx	(data_in_lane0_rx),
		      .data_in_lane1_rx	(data_in_lane1_rx),
		      .clk		(clk),
		      .clk_2f		(clk_2f),
		      .clk_4f		(clk_4f),
		      .clk_32f		(clk_32f),
		      .reset		(reset));
   phy_rx_sintetizado phy_rx_estruct(/*AUTOINST*/
				     // Outputs
				     .data_out_rx_sintetizado(data_out_rx_sintetizado[31:0]),
				     .valid_out_rx_sintetizado(valid_out_rx_sintetizado),
				     // Inputs
				     .clk		(clk),
				     .clk_2f		(clk_2f),
				     .clk_32f		(clk_32f),
				     .clk_4f		(clk_4f),
				     .data_in_lane0_rx	(data_in_lane0_rx),
				     .data_in_lane1_rx	(data_in_lane1_rx),
				     .reset		(reset));
   probador_phy_rx probador(/*AUTOINST*/
			    // Outputs
			    .data_in_lane0_rx	(data_in_lane0_rx),
			    .data_in_lane1_rx	(data_in_lane1_rx),
			    .clk		(clk),
			    .clk_2f		(clk_2f),
			    .clk_4f		(clk_4f),
			    .clk_32f		(clk_32f),
			    .reset		(reset),
			    // Inputs
			    .data_out_rx	(data_out_rx[31:0]),
			    .data_out_rx_sintetizado(data_out_rx_sintetizado[31:0]),
			    .valid_out_rx	(valid_out_rx),
			    .valid_out_rx_sintetizado(valid_out_rx_sintetizado));

endmodule
