`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:50 03/29/2016 
// Design Name: 
// Module Name:    topVGA 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module topVGA(reloj,
				  reset,
              Hsync, 
              rgb_o, 
              Vsync);

    input wire reloj;
	 input wire reset;
    
   output Hsync;
   output [2:0] rgb_o;
   output Vsync;
   
   wire [9:0] XLXN_15;//
   wire [9:0] XLXN_36;//
   wire XLXN_78;//
   
   DMHz  Divisor (.clk_i(reloj),.clk_o(XLXN_78));
	
   vga_sync  vgasync (.clk(XLXN_78), 
               .reset(reset), 
               .hsync(Hsync), 
               .pixel_x(XLXN_15[9:0]), 
               .pixel_y(XLXN_36[9:0]), 
               .vsync(Vsync));
					
   gentexto  Genarador (.clk_i(reloj),
							 .pix_x(XLXN_15[9:0]), 
                      .pix_y(XLXN_36[9:0]), 
                      .text_rgb(rgb_o[2:0]));
							 
   
					  
endmodule

