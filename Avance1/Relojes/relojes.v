
module relojes(
	//--------- Outputs ---------
	output reg clk4f,clk2f,clk,
	//--------- Inputs ---------
	input clk32f
	
);
	initial clk4f <= 0;
	initial clk2f<= 0;
	initial clk <= 0;
	parameter f_32 = 0.5;
	parameter t_min = 1/f_32;
	
	always #(8*t_min) clk4f <= ~clk4f;
	always #(16*t_min) clk2f <= ~clk2f;
	always #(32*t_min) clk <= ~clk;




endmodule
