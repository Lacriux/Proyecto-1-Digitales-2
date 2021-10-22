module probador(

//------------- outputs----------
	output reg a,
	output reg clk32f,rst,
//-------------- inputs ---------
	input clk_out_c,clk2f_out_c,clk4f_out_c, //Inputs de modulo conductual
	input clk_out_e, clk2f_out_e, clk4f_out_e, //Inputs de modulo estructural
	input not_a
);

	initial begin
		$dumpfile("resultados.vcd");
		$dumpvars;
			$display ("\t\t\tclk32f \tclk4f \tclk2f \tclk \tnot_a");
			
			$monitor($time,"\t%b\t%b\t%b\t%b \t%b" ,clk32f, clk4f_out_c, clk2f_out_c, clk_out_c, not_a);	
			{a} = 'b0;
			repeat (6) begin		
				@(posedge clk4f_out_c);
				{a} <= {a}+1;	
			end
			@(posedge clk4f_out_c);	
			a <= 0;
			$finish;
			
	end
initial	a <= 5;
initial rst <= 1;
always #4 rst <= 0;
initial clk32f <= 0;

always #2 clk32f <= ~clk32f;


endmodule




