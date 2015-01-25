/*module DFlipFlop(q, qBar, D, clk, rst);
	input D, clk, rst;
	output q, qBar;
	reg q;
	not n1 (qBar, q);
		always@ (negedge rst or posedge clk)
		begin
			if(!rst)
				q = 0;
			else
				q = D;
	end
endmodule
*/
// andOr0.v
// Compute the logical AND and OR of inputs A and B.
module AndOr(AandB, AorB, A, B);
 output [1:0] AandB, AorB;
 input [1:0] A, B;
 and myAnd [1:0] (AandB[1:0], A[1:0], B[1:0]);
 or myOr [1:0] (AorB[1:0], A[1:0], B[1:0]);
endmodule 