
module relojes(
	//--------- Outputs ---------
	output reg clk4f_out_c,clk2f_out_c,clk_out_c,
	//--------- Inputs ---------
	input clk32f,
	input rst
	
);
	
	reg [6:0]cont; //= 5'b0;
	always @(posedge clk32f) begin
		cont <= cont+1;
		if(rst) begin
			clk_out_c <= 0;
			clk2f_out_c <= 0;
			clk4f_out_c <= 0;
			cont <= 0;
	 
		end
		else begin 
			if(cont%4==0) begin
				clk4f_out_c <= ~clk4f_out_c;
				if(cont%8== 0)begin
					clk2f_out_c <= ~clk2f_out_c;
					if(cont%16 == 0)begin
						clk_out_c <= ~clk_out_c;
					end
					else begin
					end
				end
				else begin
				end
				
			end
			else begin
			end

		end
	end
	





endmodule
