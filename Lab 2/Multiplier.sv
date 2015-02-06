`include "fullAdder.sv"

module Multiplier (X4register, Y4register, Out8Register);
	input [3:0] X4register, Y4register;
	output [7:0] Out8Register;

	wire [3:0] xny0, xny1, xny2, xny3;
	wire [4:0] sum1, sum2, sumc1, sumc2;
	

	assign xny0[0] = X4register[0] & Y4register[0];
	assign xny0[1] = X4register[1] & Y4register[0];
	assign xny0[2] = X4register[2] & Y4register[0];
	assign xny0[3] = X4register[3] & Y4register[0];
	assign xny1[0] = X4register[0] & Y4register[1];
	assign xny1[1] = X4register[1] & Y4register[1];
	assign xny1[2] = X4register[2] & Y4register[1];
	assign xny1[3] = X4register[3] & Y4register[1];
	assign xny2[0] = X4register[0] & Y4register[2];
	assign xny2[1] = X4register[1] & Y4register[2];
	assign xny2[2] = X4register[2] & Y4register[2];
	assign xny2[3] = X4register[3] & Y4register[2];
	assign xny3[0] = X4register[0] & Y4register[3];
	assign xny3[1] = X4register[1] & Y4register[3];
	assign xny3[2] = X4register[2] & Y4register[3];
	assign xny3[3] = X4register[3] & Y4register[3];


	fullAdder fa01 (.A(xny0[1]),	.B(xny1[0]), .C(1'b0), .sum(Out8Register[1]), .co(sumc1[0]));
	fullAdder fa02 (.A(xny0[2]), .B(xny1[1]), .C(xny2[0]), .sum(sum1[0]), .co(sumc1[1]));
	fullAdder fa03 (.A(xny0[3]), .B(xny1[2]), .C(xny2[1]), .sum(sum1[1]), .co(sumc1[2]));
	fullAdder fa04 (.A(xny1[3]), .B(xny2[2]), .C(xny3[1]), .sum(sum1[2]), .co(sumc1[3]));
	fullAdder fa05 (.A(1'b0), 	.B(xny2[3]), .C(xny3[2]), .sum(sum1[3]), 	   .co(sumc1[4]));
	assign sum1[4] = xny3[3];
	
	fullAdder fa10 (.A(sum1[0]), .B(sumc1[0]), .C(1'b0), .sum(Out8Register[2]), .co(sumc2[0]));
	fullAdder fa11 (.A(sum1[1]), .B(sumc1[1]), .C(xny3[0]), .sum(sum2[0]), .co(sumc2[1]));
	fullAdder fa12 (.A(sum1[2]), .B(sumc1[2]), .C(1'b0), .sum(sum2[1]), .co(sumc2[2]));
	fullAdder fa13 (.A(sum1[3]), .B(sumc1[3]), .C(1'b0), .sum(sum2[2]), .co(sumc2[3]));
	fullAdder fa14 (.A(sum1[4]), .B(sumc1[4]), .C(1'b0), .sum(sum2[3]), .co(sumc2[4]));
	assign sum2[4] = 0;

	assign Out8Register[0] = xny0[0];
	
	wire co0, co1, co2, co3, co4;
	fullAdder fa20 (sum2[0], sumc2[0], 0,   Out8Register[3], co0);
	fullAdder fa21 (sum2[1], sumc2[1], co0, Out8Register[4], co1);
	fullAdder fa22 (sum2[2], sumc2[2], co1, Out8Register[5], co2);
	fullAdder fa23 (sum2[3], sumc2[3], co2, Out8Register[6], co3);
	fullAdder fa24 (sum2[4], sumc2[4], co3, Out8Register[7], co4);
	//assign Out8Register[7] = sumc2[4];

endmodule

module Multiplier_testbench();
	reg [3:0] X4register, Y4register;
	wire [7:0] Out8Register;

	Multiplier test (X4register, Y4register, Out8Register);
	
	initial begin
		X4register = 4'b1101;
		Y4register = 4'b1011;
		#4;
		X4register = 4'b0010;
		Y4register = 4'b0010;
		#4;
		X4register = 4'b0000;
		Y4register = 4'b0010;
		#4;
		X4register = 4'b1111;
		Y4register = 4'b1111;
		#4;
	end

	 initial begin
		$dumpfile("Multiplier.vcd");
		$dumpvars(1,test);
	end

endmodule
