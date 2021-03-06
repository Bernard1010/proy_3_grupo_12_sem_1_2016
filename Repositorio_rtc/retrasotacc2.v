`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ricardo Martinez Vallejos
// 
// Create Date:    00:15:50 04/18/2016 
// Design Name: 
// Module Name:    retrasotacc2 
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
module retrasotacc2(clk_i,enableretrasotaac,pulso,pulsoretrasado);

input clk_i;
input enableretrasotaac;
input wire pulso;
output reg pulsoretrasado=1'b1;

reg [1:0]pulsoaux=2'b00;
reg [1:0]pasotacc=2'b00;
reg [2:0]conta=3'b000;
reg [2:0]conta1=3'b000;

always@(posedge clk_i)
begin
if(enableretrasotaac==1'b1)
begin
	if(pulso==1'b0 && pulsoaux==2'b00)
		begin
		pulsoaux=2'b11;
		end
	else if(pasotacc==2'b00 && pulsoaux==2'b11)
		begin
		if(conta==3'b011)
			begin
			pasotacc=2'b11;
			pulsoretrasado=1'b0;
			conta=3'b000;
			end
		else
			begin
			conta=conta+1'b1;
			end
		end
	else if(pasotacc==2'b11 && pulsoaux==2'b11)
		begin
		if (conta1==3'b110)
			begin
			pulsoaux=2'b00;
			pulsoretrasado=1'b1;
			conta1=3'b000;
			pasotacc=2'b00;
			end
		else
			begin
			conta1=conta1+1'b1;
			end
		end

end
end
endmodule


