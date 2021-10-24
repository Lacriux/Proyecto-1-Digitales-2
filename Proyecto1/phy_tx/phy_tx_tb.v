`include "phy_tx.v"
`include "phy_tx_sintetizado.v"
`include "probador_phy_tx.v"


module BancoPruebas();
    wire [31:0] data_in_tx;
    wire clk;
    wire clk_2f;
    wire clk_4f;
    wire clk_32f;
    wire valid_in;
    wire reset;
    wire data_out_lane_0_tx; 
    wire data_out_lane_1_tx;
    wire data_out_lane_0_sintetizado_tx; 
    wire data_out_lane_1_sintetizado_tx;


    phy_tx phy_tx_conductual(/*AUTOINST*/
			     // Outputs
			     .data_out_lane_0_tx(data_out_lane_0_tx),
			     .data_out_lane_1_tx(data_out_lane_1_tx),
			     // Inputs
			     .data_in_tx	(data_in_tx[31:0]),
			     .clk		(clk),
			     .clk_2f		(clk_2f),
			     .clk_4f		(clk_4f),
			     .clk_32f		(clk_32f),
			     .valid_in_tx	(valid_in_tx),
			     .reset		(reset));


    phy_tx_sintetizado phy_tx_estructual(/*AUTOINST*/
					 // Outputs
					 .data_out_lane_0_sintetizado_tx(data_out_lane_0_sintetizado_tx),
					 .data_out_lane_1_sintetizado_tx(data_out_lane_1_sintetizado_tx),
					 // Inputs
					 .clk			(clk),
					 .clk_2f		(clk_2f),
					 .clk_32f		(clk_32f),
					 .clk_4f		(clk_4f),
					 .data_in_tx		(data_in_tx[31:0]),
					 .reset			(reset),
					 .valid_in_tx		(valid_in_tx));


    probador_phy_tx probador(/*AUTOINST*/
			     // Outputs
			     .data_in_tx	(data_in_tx[31:0]),
			     .clk		(clk),
			     .clk_2f		(clk_2f),
			     .clk_4f		(clk_4f),
			     .clk_32f		(clk_32f),
			     .valid_in_tx	(valid_in_tx),
			     .reset		(reset),
			     // Inputs
			     .data_out_lane_0_sintetizado_tx(data_out_lane_0_sintetizado_tx),
			     .data_out_lane_1_sintetizado_tx(data_out_lane_1_sintetizado_tx),
			     .data_out_lane_0_tx(data_out_lane_0_tx),
			     .data_out_lane_1_tx(data_out_lane_1_tx));

endmodule

