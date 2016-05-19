`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:59:20 05/17/2016
// Design Name:   ps2_rx
// Module Name:   C:/Users/Ferencz/Desktop/Proyecto_3/keyboard/testbench_ps2_rx.v
// Project Name:  keyboard
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ps2_rx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_ps2_rx;

	// Inputs
	reg clk;
	reg reset;
	reg ps2d;
	reg ps2c;
	reg rx_en;

	// Outputs
	wire rx_done_tick;
	wire [7:0] dout;

	// Instantiate the Unit Under Test (UUT)
	ps2_rx uut (
		.clk(clk), 
		.reset(reset), 
		.ps2d(ps2d), 
		.ps2c(ps2c), 
		.rx_en(rx_en), 
		.rx_done_tick(rx_done_tick), 
		.dout(dout)
	);

	always	
	begin	
	#10 clk=~clk;
	end
	
	always	
	begin	
	#1000 ps2c=~ps2c;
	end
	
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		ps2d = 0;
		ps2c = 0;
		rx_en = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		ps2d = 0;
		//ps2c = 0;
		rx_en = 1;
		reset = 1;
		#10
		
		ps2d = 0;
		//ps2c = 0;
		rx_en = 1;
		reset = 0;
		#10
		
		ps2d = 1;
		//ps2c = 0;
		rx_en = 1;
		reset = 0;
		#10
		
		ps2d = 0;
		//ps2c = 0;
		rx_en = 1;
		reset = 0;
		#10
		
		ps2d = 1;
		//ps2c = 0;
		rx_en = 1;
		reset = 0;
		#10
		
		ps2d = 1;
		//ps2c = 0;
		rx_en = 1;
		reset = 0;
		#10
		
		ps2d = 0;
		//ps2c = 0;
		rx_en = 1;
		reset = 0;
		#10
		
		ps2d = 0;
		//ps2c = 0;
		rx_en = 1;
		reset = 0;
		#10
		
		ps2d = 0;
		//ps2c = 0;
		rx_en = 1;
		reset = 0;
		#10
		
		ps2d = 0;
		//ps2c = 0;
		rx_en = 1;
		reset = 0;
		#10
		
		ps2d = 1;
		//ps2c = 0;
		rx_en = 1;
		reset = 0;
		#10
		
		
		
		
		
		
		#25000
		$stop;
	
	end
      
endmodule

