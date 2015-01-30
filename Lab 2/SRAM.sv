module SRAM (ReadData, ReadRegister, WriteRegister, WriteData, WriteEnable);
	parameter WIDTH = 128;
	parameter WORD_BIT_SIZE = 8;
	
	input [6:0] ReadRegister, WriteRegister, WriteData;
	input WriteEnable;
	output [(WORD_BIT_SIZE-1):0] ReadData;
	
	// initialize registers of selected depth and word size
	reg [(WORD_BIT_SIZE-1):0] SRAM [(WIDTH-1):0];
	
	// enable activated write to selected register
	always @ (*)
   if (WriteEnable) begin
		SRAM[WriteRegister] = WriteData;
   end  
	
	// Hardwire read value to selected read register
	assign ReadData = SRAM[ReadRegister];
endmodule

module SRAM_testbench();
	reg [6:0] ReadRegister, WriteRegister, WriteData;
	reg WriteEnable;
	wire [7:0] ReadData;
	
	parameter t = 10;
	
	SRAM ram (.ReadData, .ReadRegister, .WriteRegister, .WriteData, .WriteEnable);
		
	initial begin
		// Write all 0s to reg 0
		ReadRegister = 7'b0000000;
		WriteRegister = 7'b0000000;
		WriteData = 8'b0000000;
		WriteEnable = 1;
		#(20*t);
		
		// Read register 1, should be unknown
		ReadRegister = 7'b0000001;
		#(20*t);
		
		// write all 1s to reg 1, read value should be all 1s now
		WriteRegister = 7'b0000001;
		WriteData = 8'b1111111;
		#(20*t);
		
		// disable write, try to write 1010s.. to reg 1, read value shouldn't change
		WriteEnable = 0;
		WriteData = 8'b1010101;
		#(20*t);
		
		// enable write, read value should change to 101010
		WriteEnable = 1;
		#(20*t);
	end
endmodule 