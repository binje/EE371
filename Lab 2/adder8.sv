module adder8(Output, op1, op2, control);
	parameter WIDTH = 8;
	
	input [(WIDTH-1):0] op1, op2;
	input control;
	output [(WIDTH-1):0] Output;

	wire [(WIDTH-1):0] notOp2, selectedOp2, carryOuts;
	
	// compute the inversion of op2
	genvar j;
	generate
		for (j=0; j<WIDTH; j++) begin : eachNot
			not notNum (notOp2[j], op2[j]);
		end
	endgenerate 
	
	// Edge Case: LSB of adder has carry in of 0
	// Must also use a mux to decide whether in subtract or add mode
	mux2_1 mux1 (.out(selectedOp2[0]), .in({notOp2[0], op2[0]}), .sel(control));
	fullAdder adder (.A(op1[0]), .B(selectedOp2[0]), .C(control), .sum(Output[0]), .co(carryOuts[0]));
	
	genvar i;
	generate
		for(i=1; i<WIDTH; i++) begin : eachAdder
			mux2_1 muxNum (.out(selectedOp2[i]), .in({notOp2[i], op2[i]}), .sel(control));
			fullAdder adderNum (.A(op1[i]), .B(selectedOp2[i]), .C(carryOuts[i-1]), .sum(Output[i]), .co(carryOuts[i]));
		end
	endgenerate
endmodule 

module adder8_testbench();
	parameter t = 10;
	parameter WIDTH = 8;
	
	reg [(WIDTH-1):0] op1, op2;
	reg control;
	wire [(WIDTH-1):0] Output;
	wire overflow, CarryOut;
	
	adder32 adder (.op1, .op2, .control, .Output, .overflow, .CarryOut);
	
	initial begin
		op1 = WIDTH'h00000000;
		op2 = WIDTH'h00000001;
		control = 0;
		assert (Output == 1);
		#t;
		op1 = WIDTH'h00000001;
		#t;
		control = 1;
		#t;
		op1 = WIDTH'h00000008;
		#t;
		op2 = WIDTH'h00000004;
		#t;
		control = 0;
		#t;
		op1 = WIDTH'h00000000;
		control = 1;
		#t;
	end
endmodule 