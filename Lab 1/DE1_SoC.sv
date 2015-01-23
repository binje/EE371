// Top-level module that defines the I/Os for the DE-1 SoC board
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, CLOCK_50);
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output [9:0] LEDR;
	input [3:0] KEY;
	input [9:0] SW;
	input CLOCK_50;
	
	wire rst = ~SW[9];

	// Default values, turns off the HEX displays
	assign HEX0 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	
	
	// Generate clk off of CLOCK_50, whichClock picks rate.
	wire [31:0] clk;
	parameter whichClock = 25;
	clock_divider cdiv (CLOCK_50, clk);
	
	
	//Johnson counter
	reg [3:0] outJ;
	johnson jCount(.clk(clk[whichClock]), .rst, .out(outJ));
	
	//ripple up counter
	reg [3:0] outR;
	rippleUp rCount(.clk(clk[whichClock]), .rst, .out(outR));
	
	//synchronous down counter
	reg[3:0] outSynch;
	syncDown sCount(.clk(clk[whichClock]), .rst, .out(outSynch));
	
	//which counter is being displayed is based on SW[2:0]
	//assumes that there will never be more than one SW 
	//on at a time
	always @(*) begin
		if(SW[0] == 1'b1)begin
			LEDR[0] = outJ[0];
			LEDR[1] = outJ[1];
			LEDR[2] = outJ[2];
			LEDR[3] = outJ[3];
		end else if (SW[1] == 1'b1) begin
			LEDR[0] = outR[0];
			LEDR[1] = outR[1];
			LEDR[2] = outR[2];
			LEDR[3] = outR[3];
		end else if (SW[2] == 1'b1) begin
			LEDR[0] = outSynch[0];
			LEDR[1] = outSynch[1];
			LEDR[2] = outSynch[2];
			LEDR[3] = outSynch[3];
		end else begin
			LEDR[0] = 1'b0;
			LEDR[1] = 1'b0;
			LEDR[2] = 1'b0;
			LEDR[3] = 1'b0;
		end
	end
	
	
endmodule


//this clock divider was provided in EE 271
// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz,[25] = 0.75Hz, ...
module clock_divider (clock, divided_clocks);
	input clock;
	output [31:0] divided_clocks;
	reg [31:0] divided_clocks;
	
	initial
		divided_clocks = 0;
	always @(posedge clock)
		divided_clocks = divided_clocks + 1;
endmodule


module DE1_SoC_testbench();
	wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire [9:0] LEDR;
	reg [3:0] KEY;
	reg [9:0] SW;
	
	DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR,.SW);

	// Try all combinations of inputs.
	integer i;
	initial begin
		SW[9] = 1'b0;
		SW[8] = 1'b0;
		
		for(i = 0; i <256; i++) begin
			SW[7:0] = i; #10;
		end
	end
endmodule
