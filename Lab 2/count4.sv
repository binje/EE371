module count4(clk, rst, out);
	input clk, rst;
	output reg [2:0] out;
	
	reg [2:0] ps, ns;
	
	always @(*) begin
		case(ps)
			3'b100: ns = 3'b011;
			3'b011: ns = 3'b010;
			3'b010: ns = 3'b001;
			3'b001: ns = 3'b000;
			3'b000: ns = 3'b000;
			default ns = 3'bxxx;
		endcase
	end
	
	always @(posedge clk) begin
		if (rst)begin
			ps <= 3'b100;
		end else begin
			ps <= ns;
			out <= ps;
		end	
	end
endmodule


module count4_testbench();
	reg clk, rst;
	wire [2:0] out;
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	count4 dut(clk, rst, out);
	
	initial begin
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
		
	
	$stop;
	end
endmodule
