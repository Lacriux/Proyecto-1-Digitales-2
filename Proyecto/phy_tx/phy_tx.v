`include "../32bto8b/paso32bto8b.v"
`include "../ByteStriping/byteStriping.v"
`include "../ParaleloSerial/paraleloSerial.v"


module phy_tx(
    input [31:0] data_in_tx,
    input clk,
    input clk_2f,
    input clk_4f,
    input clk_32f,
    input valid_in_tx,
    input reset,
    output data_out_lane_0_tx, data_out_lane_1_tx);


    wire [31:0]  data_out_byteStriping_lane_0;
    wire [31:0]  data_out_byteStriping_lane_1;
    wire valid_out_byteStriping_lane_0, valid_out_byteStriping_lane_1;

    wire [7:0] data_out_32to8b_lane0;
    wire [7:0] data_out_32to8b_lane1;
    wire valid_out_32bto8b_lane0, valid_out_32bto8b_lane1;

//Striping con dos lane //

    byteStriping byteStripingTest(
        .valid_in(valid_in_tx),
        .clk(clk_2f), 
        .reset(reset),
        .data_in(data_in_tx),
        .lane_0(data_out_byteStriping_lane_0),
        .lane_1(data_out_byteStriping_lane_1),
        .valid_0(valid_out_byteStriping_lane_0),
        .valid_1(valid_out_byteStriping_lane_1)
    );


// Bloues pasao de 32b to 8b dos lane//

    paso32bto8b Lane_0_32bto8(
        .clk_f(clk), 
        .clk_4f(clk_4f), 
        .reset(reset),
        .data_in(data_out_byteStriping_lane_0),
        .valid_0(valid_out_byteStriping_lane_0), 
        .valid_out(valid_out_32bto8b_lane0),
        .data_out(data_out_32to8b_lane0));


    
    paso32bto8b Lane_1_32bto8(
        .clk_f(clk), 
        .clk_4f(clk_4f), 
        .reset(reset),
        .data_in(data_out_byteStriping_lane_1),
        .valid_0(valid_out_byteStriping_lane_1), 
        .valid_out(valid_out_32bto8b_lane1),
        .data_out(data_out_32to8b_lane1));

//Paralelo serial dos lineas.  //


paraleloSerial ParaleloSerial_lane_0(

    .data_in(data_out_32to8b_lane0),
    .clk_4f(clk_4f),
    .clk_32f(clk_32f),
    .valid_in(valid_out_32bto8b_lane0),
    .reset(reset),
    .data_out(data_out_lane_0_tx)
);


paraleloSerial ParaleloSerial_lane_1(

    .data_in(data_out_32to8b_lane1),
    .clk_4f(clk_4f),
    .clk_32f(clk_32f),
    .valid_in(valid_out_32bto8b_lane1),
    .reset(reset),
    .data_out(data_out_lane_1_tx)
);


endmodule