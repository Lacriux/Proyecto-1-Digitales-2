module probador_paso8bto32b(
    output reg clk_f, clk_4f, reset,
    output reg [7:0] data_in,
    output reg valid_0, 
    input valid_out, valid_out_sintetizado,
    input [31:0] data_out, data_out_sintetizado);
 
   initial begin
      data_in = 0;
      valid_0 = 0;
      reset = 0;
   end   
   initial begin
      $dumpfile("verificacion_paso8bto32b.vcd");
      $dumpvars;

      @(posedge clk_4f);
      reset <= 1;
      @(posedge clk_4f);
      reset <= 0;
      @(posedge clk_4f);
      data_in<=8'h1F;
      valid_0<=1'b1;
    
      @(posedge clk_4f);
      data_in<=8'h2F;
      valid_0<=1'b1;  

      @(posedge clk_4f);
      data_in<=8'h3F;
      valid_0<=1'b1;

      @(posedge clk_4f);
      data_in<=8'h4F;
      valid_0<=1'b1;            

      @(posedge clk_4f);
      data_in<=8'h1D;
      valid_0<=1'b1;

      @(posedge clk_4f);
      data_in<=8'h2D;
      valid_0<=1'b1;  

      @(posedge clk_4f);
      data_in<=8'h3D;
      valid_0<=1'b1;

      @(posedge clk_4f);
      data_in<=8'h4D;
      valid_0<=1'b1;    
      @(posedge clk_4f);
      valid_0 <= 0;
      @(posedge clk_4f);
      @(posedge clk_4f);
      @(posedge clk_4f);
      @(posedge clk_4f);
      data_in<=8'h00;
      valid_0<=1'b1;

      @(posedge clk_4f);
      data_in<=8'h00;
       @(posedge clk_4f);
      data_in<=8'h00;
      @(posedge clk_4f);
      data_in<=8'h03;
      @(posedge clk_4f);
      valid_0 <= 1'b0;
      @(posedge clk_4f);
      @(posedge clk_4f);
      @(posedge clk_4f);
      @(posedge clk_4f);

      #200 $finish;

      end



//Valor inicial del reloj para que no sea indeterminado
	initial	clk_f 	<= 1;
   initial	clk_4f 	<= 1;

   //Toggle	
	always	#160 clk_f <= ~clk_f;
   always  #20 clk_4f <= ~clk_4f;

endmodule
