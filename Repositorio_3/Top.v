`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:43 05/16/2016 
// Design Name: 
// Module Name:    TOP 
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
module TOP(clk, 
           ps2c, 
           ps2d, 
           rx_en, 
           code);

    input clk;
    input ps2c;
    input ps2d;
    input rx_en;
   output [3:0] code;
   reg [23:0]cont=24'b0;
	reg reset= 1'b0;
   
   wire [7:0] XLXN_8;
	
	
   
   ps2_rx  XLXI_1 (.clk(clk), 
                  .ps2c(ps2c), 
                  .ps2d(ps2d), 
                  .reset(reset), 
                  .rx_en(rx_en), 
                  .dout(XLXN_8[7:0]), 
                  .rx_done_tick());
   deco  XLXI_2 (.clk(clk), 	
                .code_i(XLXN_8[7:0]),  
                .code_o(code[3:0]));
					 
					 
always@(posedge clk)
begin
	if(cont==24'd12499999)
	begin
		cont=24'd0;
		reset=~reset;
		
		end
	else
		cont=cont+1'd1;


end					 
					 
					 
endmodule

