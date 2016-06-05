`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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
module deco(clk,code_i, code_o);

	input wire [7:0] code_i;
	input clk;
   output reg [5:0] code_o;
   reg [5:0] code_m;
	reg clko=1'b0;
	reg [19:0] cont=19'b0;
   

always @*
begin
	
		case (code_i)
				8'h24   : code_m <= 6'b000001;
				8'h4b   : code_m <= 6'b000010;
				8'h2d   : code_m <= 6'b000100;
				8'h5a   : code_m <= 6'b001000;
				8'h23   : code_m <= 6'b010000;
				8'h1d   : code_m <= 6'b100000;
				
				default : code_m <= 6'b0;
		endcase
	
		
		
		
		
end			
				



always@(posedge clk)
begin
	if(cont==20'd999999)
	begin
		cont=20'd0;
		clko=~clko;
		
		end
	else
		cont=cont+1'd1;


end

				
				
always@(posedge clko)
begin

code_o <= code_m;

end





endmodule
