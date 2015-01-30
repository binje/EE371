module fullAdder(A, B, C, sum, co);
	input A, B, C;
	output sum, co;
	
	assign sum = A ^ B ^ C;
	
	assign co = B&C || A&C || A&B;
endmodule