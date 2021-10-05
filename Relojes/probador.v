module probador(

//------------- outputs----------
	output reg a,
	output reg clk32f,
//-------------- inputs ---------
	input clk,clk2f,clk4f,
	input not_a
);

	initial begin
		$dumpfile("resultados.vcd");
		$dumpvars;
			$display ("\t\t\tclk32f \tclk4f \tclk2f \tclk_test \tnot_a");
			
			$monitor($time,"\t%b\t%b\t%b\t%b \t%b" ,clk32f, clk4f, clk2f, clk, not_a);	
			{a} = 'b0;
			repeat (12) begin		
				@(posedge clk);
				{a} <= {a}+1;	
			end
			@(posedge clk);	
			a <= 0;
			$finish;
	end
initial	a <= 5;
initial clk32f <= 0;

always #5 clk32f <= ~clk32f;


endmodule




