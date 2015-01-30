module seg7 (bcd, leds);
	input [3:0] bcd;
	output reg [6:0] leds;

	always @(*)
		case (bcd)
			// Light: 6543210
			0: leds = 7'b1000000;
			1: leds = 7'b1111001;
			2: leds = 7'b0100100;
			3: leds = 7'b0110000;
			4: leds = 7'b0011001;
			5: leds = 7'b0010010;
			6: leds = 7'b0000010;
			7: leds = 7'b1111000;
			8: leds = 7'b0000000;
			9: leds = 7'b0010000;
			default: leds = 7'bX;
		endcase
endmodule