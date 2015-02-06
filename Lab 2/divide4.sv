module divide4(remainder, quotient, dividend, divisor, clk, rst);
	input clk, rst;
	input [3:0] dividend, divisor;
	output [3:0] remainder, quotient;
	
	wire [7:0] AQ;
	reg [7:0] D;
	reg in;
	
	//counter, want to do everything 4 times
	wire [2:0] count;
	wire enable;
	count4 counter(clk, rst, count);
	assign enable = count[2] | count[1] | count[0];
	
	
	wire [3:0] mOut;
	
	//shift register
	DFlipFlop d7(AQ[7], qBar, mOut[2], clk&enable, rst);
	DFlipFlop d6(AQ[6], qBar, mOut[1], clk&enable, rst);
	DFlipFlop d5(AQ[5], qBar, mOut[0], clk&enable, rst);
	DFlipFlop d4(AQ[4], qBar, AQ[3], clk&enable, rst);
	DFlipFlop d3(AQ[3], qBar, AQ[2], clk&enable, rst);
	DFlipFlop d2(AQ[2], qBar, AQ[1], clk&enable, rst);
	DFlipFlop d1(AQ[1], qBar, AQ[0], clk&enable, rst);
	DFlipFlop d0(AQ[0], qBar, in, clk&enable, rst);
	
	wire [7:0] addOut, subOut;
	
	//add and subtract controlled by mux
	adder8 add(addOut, {{4'b0}, {AQ[7:4]}}, {{4'b0}, divisor}, 1'b0);
	adder8 sub(subOut, {{4'b0}, {AQ[7:4]}}, {{4'b0}, divisor}, 1'b1);
	mux2_1 m3(mOut[3], {{subOut[3]}, {addOut[3]}}, AQ[7]);
	mux2_1 m2(mOut[2], {{subOut[2]}, {addOut[2]}}, AQ[7]);
	mux2_1 m1(mOut[1], {{subOut[1]}, {addOut[1]}}, AQ[7]);
	mux2_1 m0(mOut[0], {{subOut[0]}, {addOut[0]}}, AQ[7]);
	
	
	assign in = ~AQ[7];
	
	
	assign remainder = AQ[7:4];
	assign quotient = AQ[3:0];
endmodule


module divide4_testbench();
	reg clk, rst;
	reg [3:0] dividend, divisor;
	wire [3:0] remainder, quotient;
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	divide4 dut(remainder, quotient, dividend, divisor, clk, rst);
	
	initial begin
		dividend <= 4'b1000;
		divisor <= 4'b0011;
		rst <= 1; @(posedge clk);
		rst <= 0; @(posedge clk);
		 @(posedge clk);
		  @(posedge clk);
		   @(posedge clk);
			 @(posedge clk);
			  @(posedge clk);
			   @(posedge clk);
				 @(posedge clk);
				  @(posedge clk);
				   @(posedge clk);
					 @(posedge clk);
		
	
	$stop;
	end
endmodule
