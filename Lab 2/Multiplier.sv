module MULTIPLY (X4register, Y4register, Out8register);
	input [3:0] X4register, Y4register;
	output [7:0] Out8Register;

	reg [3:0] xny0, xny1, xny2, xny3;
	reg [4:0] sum1, sum2, sumc1, sumc2;
	

	xny0 = X4Register & Y4register[0];
	xny1 = X4Register & Y4register[1];
	xny2 = X4Register & Y4register[2];
	xny3 = X4Register & Y4register[3];

	fullAdder fa01 (xny0[1],	xny1[0], 0, 	  Out8Register[1], sumc1[0]);
	fullAdder fa02 (xny0[2], xny1[1], xny2[0], sum1[0], 	   sumc1[1]);
	fullAdder fa03 (xny0[3], xny1[2], xny2[1], sum1[1], 	   sumc1[2]);
	fullAdder fa04 (xny1[3], xny2[2], xny3[1], sum1[2], 	   sumc1[3]);
	fullAdder fa05 (0, 	xny2[3], xny3[2], sum1[3], 	   sumc1[4]);
	sum1[4] = xny3[3];
	
	fullAdder fa10 (sum1[0], sumc1[0], 0, Out8Register[2], sumc2[0]);
	fullAdder fa11 (sum1[1], sumc1[1], xny3[0], sum2[0], sumc2[1]);
	fullAdder fa12 (sum1[2], sumc1[2], 0, sum2[1], sumc2[2]);
	fullAdder fa13 (sum1[3], sumc1[3], 0, sum2[2], sumc2[3]);
	fullAdder fa14 (sum1[4], sumc1[4], 0, sum2[3], sumc2[4]);
	sum2[4] = 0;

	
	
	

	Out8Register[0] = xny0[0];
	//Out8Register[1] = xny0[1] & xny1[0];

endmodule


fullAdder(A, B, C, sum, co);
