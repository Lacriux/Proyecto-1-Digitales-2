`include "../8bto32b/paso8bto32b.v"
`include "../ByteUnstriping/byteUnstriping.v"
`include "../SerialParalelo/serialParalelo.v"


module phy_rx(
    input data_in_lane0_rx, data_in_lane1_rx,
    input clk,
    input clk_2f,
    input clk_4f,
    input clk_32f,
    input reset,
    output valid_out_rx,
    output [31:0] data_out_rx);


    wire [7:0] data_out_serialParalelo_lane0;
    wire [7:0] data_out_serialParalelo_lane1;
    wire valid_out_serialParalelo_lane0;
    wire valid_out_serialParalelo_lane1;
    wire [31:0] data_out_8bto32b_lane0;
    wire [31:0] data_out_8bto32b_lane1;
    wire valid_out_8bto32b_lane0;
    wire valid_out_8bto32b_lane1;

//Striping con dos lane //


    byteUnstriping byteUnstriping(
        .valid_0(valid_out_8bto32b_lane0),
        .valid_1(valid_out_8bto32b_lane1),
        .clk(clk_2f), 
        .reset(reset),
        .lane_0(data_out_8bto32b_lane0),
        .lane_1(data_out_8bto32b_lane1),
        .valid_out(valid_out_rx),
        .data_out(data_out_rx)
    );


// Bloues paso de 32b to 8b dos lane//

    paso8bto32b Lane_0_8bto32(
        .clk_f(clk), 
        .clk_4f(clk_4f), 
        .reset(reset),
        .data_in(data_out_serialParalelo_lane0),
        .valid_0(valid_out_serialParalelo_lane0), 
        .valid_out(valid_out_8bto32b_lane0),
        .data_out(data_out_8bto32b_lane0));


    
    paso8bto32b Lane_1_8bto32(
        .clk_f(clk), 
        .clk_4f(clk_4f), 
        .reset(reset),
        .data_in(data_out_serialParalelo_lane1),
        .valid_0(valid_out_serialParalelo_lane1), 
        .valid_out(valid_out_8bto32b_lane1),
        .data_out(data_out_8bto32b_lane1));

//Paralelo serial dos lineas.  //


serialParalelo serialParalelo_lane_0(

    .data_in(data_in_lane0_rx),
    .clk_4f(clk_4f),
    .clk_32f(clk_32f),
    .reset(reset),
    .valid_out(valid_out_serialParalelo_lane0),
    .data_out(data_out_serialParalelo_lane0)
);


serialParalelo serialParalelo_lane_1(

    .data_in(data_in_lane1_rx),
    .clk_4f(clk_4f),
    .clk_32f(clk_32f),
    .reset(reset),
    .valid_out(valid_out_serialParalelo_lane1),
    .data_out(data_out_serialParalelo_lane1)
);


endmodule
