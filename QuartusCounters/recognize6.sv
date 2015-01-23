module recognize6 (LEDvalue, SW3, SW2, SW1, SW0);
	input SW3, SW2, SW1, SW0;
	output LEDvalue;
	
	assign LEDvalue = SW2*SW1*(~SW3)*(~SW0);
endmodule

module recognize6_testbench();
	reg SW3, SW2, SW1, SW0;
	wire LEDvalue;
	
	recognize6 dut (.LEDvalue, .SW3, .SW2, .SW1, .SW0);
	
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
