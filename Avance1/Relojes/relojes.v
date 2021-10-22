
module relojes(
	//--------- Outputs ---------
	output reg clk4f_out_c,clk2f_out_c,clk_out_c,
	//--------- Inputs ---------
	input clk32f,
	input rst
	
);
	
	reg [5:0]cont = 5'b0;
	always @(posedge clk32f) begin
		cont <= cont+1;
		if(rst) begin
			clk_out_c <= 0;
			clk2f_out_c <= 0;
			clk4f_out_c <= 0;
			 
		end
		else begin 
			if(cont==5'b11 || cont==5'b111 || cont==5'b1011 || cont == 5'b10011 || cont == 5'b10111 || cont == 5'b11011) begin
			clk4f_out_c <= ~clk4f_out_c;
			end
			if(cont == 5'b1111) begin
				clk2f_out_c <= ~clk2f_out_c;
				clk4f_out_c <= ~clk4f_out_c;
			end
			else
			if(cont==5'b11111) begin
				cont <= 5'b0;
				clk_out_c <= ~clk_out_c;
				clk4f_out_c <= ~clk4f_out_c;
				clk2f_out_c <= ~clk2f_out_c;
				
			end
		end
	end
	





endmodule
