`include "../phy_tx/phy_tx.v"
`include "../phy_rx/phy_rx.v"

module phy(
	//--------- Outputs ---------
	output wire [31:0]data_out,
	output wire valid_out,
	//--------- Inputs ---------
	input [31:0] data_in_tx,
	input reset,
	input valid_in_tx,
	input clk,
	input clk_2f,
	input clk_4f,
	input clk_32f);
//----- Wires from tx ----------
wire data_out_lane_0_tx, data_out_lane_1_tx;
//----- Wires from rx ----------
phy_tx phy_tx_(/*AUTOINST*/
	//Inputs
	.data_in_tx			(data_in_tx[31:0]),
	.clk				(clk),
	.clk_2f				(clk_2f),
	.clk_4f				(clk_4f),
	.clk_32f			(clk_32f),
	.valid_in_tx			(valid_in_tx),
	.reset				(reset),
	//Outputs
	.data_out_lane_0_tx		(data_out_lane_0_tx),
	.data_out_lane_1_tx		(data_out_lane_1_tx)
	
);

phy_rx phy_rx_( /*AUTOINST*/
	//Inputs
	.data_in_lane0_rx		(data_out_lane_0_tx),
	.data_in_lane1_rx		(data_out_lane_1_tx),
	.clk				(clk),
	.clk_2f				(clk_2f),
	.clk_4f				(clk_4f),
	.clk_32f			(clk_32f),
	.reset				(reset),
	//Outputs
	.valid_out_rx			(valid_out),
	.data_out_rx			(data_out[31:0])
	);


endmodule
