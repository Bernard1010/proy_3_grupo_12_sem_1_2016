`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:50 05/23/2016 
// Design Name: 
// Module Name:    controlcambio 
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
module controlcambio(clk_i,aumenta,out_o);

input aumenta,clk_i;

output reg[3:0]out_o;


reg clkinterno=1'b0;
reg [23:0]conta=24'b0;
reg [3:0] unidades=4'h1;


always@(posedge clk_i)
	begin
		out_o=unidades;
		if (conta==25'd4545453)//9999999
			begin
				conta=25'b0;
				clkinterno=~clkinterno;
			end
		else
			conta=conta+1'b1;
	end
	
	
always@(posedge clkinterno)//clkinterno
	begin
		
			
					if(aumenta && out_o<=4'd8)
						begin
						if (unidades==4'd6)
							begin
							unidades=unidades+4'h2;
							end
		
						else if(unidades==4'd8)
							begin
							unidades=4'h1;
							end
							
						else
							begin
							unidades=unidades+1'b1;
							end
						end			
				
	end	


endmodule
