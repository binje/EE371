module johnson(clk, rst, out);
	input clk, rst;
	output [3:0] out;
	
	wire qbar0, qbar1, qbar2, qbar3;
	reg d0, d1, d2, d3;
	
	// Behavioral level logic
	always@(posedge clk)
	begin
		d0 = ~out[3];
	end
	
	DFlipFlop bit0 (out[0], qbar0, d0, clk, rst);
	DFlipFlop bit1 (out[1], qbar1, out[0], clk, rst);
	DFlipFlop bit2 (out[2], qbar2, out[1], clk, rst);
	DFlipFlop bit3 (out[3], qbar3, out[2], clk, rst);
endmodule 

module johnson_testbench();
	reg clk, rst;
	wire [3:0] out;
	parameter t = 10;
	
	johnson timer (.clk, .rst, .out);
	
	always #(t) clk = ~clk;
	
	initial begin
		// reset state to 0's
		clk = 0;
		rst = 0;
		#(4*t);
		rst = 1;
		#(4*t);
	end
endmodule 