module SRAM (ReadData, ReadRegister, WriteRegister, WriteData, WriteEnable);
	input [6:0] ReadRegister, WriteRegister, WriteData;
	input WriteEnable;
	output [6:0] ReadData;
	
	parameter WIDTH = 128;
	parameter WORD_BIT_SIZE = 7;
	
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
	wire [6:0] ReadData;
	
	parameter t = 10;
	
	SRAM ram (.ReadData, .ReadRegister, .WriteRegister, .WriteData, .WriteEnable);
		
	initial begin
		ReadRegister = 7'b0000000;
		WriteRegister = 7'b0000000;
		WriteData = 7'b0000000;
		WriteEnable = 1;
		#(20*t);
		ReadRegister = 7'b0000001;
		#(20*t);
		WriteRegister = 7'b0000001;
		WriteData = 7'b1111111;
		#(20*t);
		WriteEnable = 0;
		WriteData = 7'b1010101;
		#(20*t);
		WriteEnable = 1;
		#(20*t);
	end
endmodule 