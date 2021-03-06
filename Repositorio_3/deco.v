`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bernardo Rodriguez Hall 
// 
// Create Date:    13:29:27 05/16/2016 
// Design Name: 
// Module Name:    deco 
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
module Decodificador(clk,code_i, code_o);

	input wire [7:0] code_i;
	input clk;
   output reg [3:0] code_o;
   reg [3:0] code_m;
	reg clko=1'b0;
	reg [21:0] cont=23'b0;
   
//Decodificador de teclas combinacional
always @*
begin
	
		case (code_i)
				8'h1c   : code_m <= 4'b0001;
				8'h1b   : code_m <= 4'b0010;
				8'h23   : code_m <= 4'b0100;
				8'h2b   : code_m <= 4'b1000;
				default : code_m <= 4'b0000;
		endcase
	
		
		
		
		
end			
				


//divisor de reloj para generar un clock mas lento
always@(posedge clk)
begin
	if(cont==22'd2499999)
	begin
		cont=22'd0;
		clko=~clko;
		
		end
	else
		cont=cont+1'd1;


end

				
//Actualizacion de salida respecto a un reloj mas lento				
always@(posedge clko)
begin

code_o <= code_m;

end





endmodule
