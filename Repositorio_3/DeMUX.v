`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:41 03/29/2016 
// Design Name: 
// Module Name:    DeMUX 
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

//Demultiplexor de decenas

module DeMUX(clk_i,data,sel,sal_0,sal_1,sal_2,sal_3,sal_4,sal_5,sal_6,sal_7,sal_8);

input clk_i;
input [3:0] sel,data;
output reg[3:0] sal_0,sal_1,sal_2,sal_3,sal_4,sal_5,sal_6,sal_7,sal_8;
reg [22:0]cont = 23'b0;
reg clko=1'b0;


always @(posedge clk_i)
		begin
			if(cont == 23'd5555554) 
				begin
					cont = 23'b0;
					clko=~clko;
			end
			else
		cont=cont+1'b1; 
		end	

always@(posedge clko)
	begin
		case(sel)
		4'd0: sal_0=data;
		4'd1: sal_1=data;
		4'd2: sal_2=data;
		4'd3: sal_3=data;
		4'd4: sal_4=data;
		4'd5: sal_5=data;
		4'd6: sal_6=data;
		4'd7: sal_7=data;
		4'd8: sal_8=data;
		endcase

	end

endmodule
