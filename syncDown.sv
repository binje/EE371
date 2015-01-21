module syncDown(clk, rst, out);
	input clk, rst;
	output [3:0] out;
	
	wire d0, d1, d2, d3, qbar0, qbar1, qbar2, qbar3;
	
	// Data flow assignment
	assign d0 = ~out[0];
	assign d1 = ~(out[1] ^ out[0]);
	assign d2 = (out[2] & out[1]) | (out[2] & out[0]) | (~out[2] & ~out[1] & ~out[0]);
 	assign d3 = (~out[3] & ~out[2] & ~out[1] & ~out[0]) | (out[3] & out[2]) |
					(out[3] & out[0]) | (out[3] & out[1]);
	
	DFlipFlop bit0 (out[0], qbar0, d0, clk, rst);
	DFlipFlop bit1 (out[1], qbar1, d1, clk, rst);
	DFlipFlop bit2 (out[2], qbar2, d2, clk, rst);
	DFlipFlop bit3 (out[3], qbar3, d3, clk, rst);
endmodule 

module syncDown_testbench();
	reg clk, rst;
	wire [3:0] out;
	parameter t = 10;
	
	syncDown timer (.clk, .rst, .out);
	
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