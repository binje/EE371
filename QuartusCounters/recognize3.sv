module recognize3(LEDvalue, SW3, SW2, SW1, SW0);
	output LEDvalue;
	input SW3, SW2, SW1, SW0;
	
	assign LEDvalue = (~SW3)*(~SW2)*SW1*SW0;
endmodule

module recognize3_testbench();
	reg SW3, SW2, SW1, SW0;
	wire LEDvalue;
	
	recognize3 dut (.LEDvalue, .SW3, .SW2, .SW1, .SW0);
	
	initial begin
		SW3=0; SW2=0; SW1=0; SW0=0; #10;
		SW3=0; SW2=0; SW1=0; SW0=1; #10;
		SW3=0; SW2=0; SW1=1; SW0=0; #10;
		SW3=0; SW2=0; SW1=1; SW0=1; #10;
		SW3=0; SW2=1; SW1=0; SW0=0; #10;
		SW3=0; SW2=1; SW1=0; SW0=1; #10;
		SW3=0; SW2=1; SW1=1; SW0=0; #10;
		SW3=0; SW2=1; SW1=1; SW0=1; #10;
		SW3=1; SW2=0; SW1=0; SW0=0; #10;
		SW3=1; SW2=0; SW1=0; SW0=1; #10;
		SW3=1; SW2=0; SW1=1; SW0=0; #10;
		SW3=1; SW2=0; SW1=1; SW0=1; #10;
		SW3=1; SW2=1; SW1=0; SW0=0; #10;
		SW3=1; SW2=1; SW1=0; SW0=1; #10;
		SW3=1; SW2=1; SW1=1; SW0=0; #10;
		SW3=1; SW2=1; SW1=1; SW0=1; #10;
	end
endmodule
