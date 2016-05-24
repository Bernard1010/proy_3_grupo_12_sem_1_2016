`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ricardo Martinez Vallejos
// 
// Create Date:    18:22:19 05/19/2016 
// Design Name: 
// Module Name:    ControlRTC 
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
module ControlRTC(clk_i,aumenta_i,cambio_i,reset_i,AD_o,btn_cambiomaq,pulsoprogramo,salient,RD,WR,chipselecc_o,state,regseg,regmin,reghora,regdate,regmes,regano,regThora,regTmin,regTseg);

input wire clk_i;	
//input wire [2:0]swt; 
input aumenta_i,reset_i;
input btn_cambiomaq;
input wire pulsoprogramo;
input wire [3:0]cambio_i;
//input wire [1:0]estado_i;//1 escribe,0 lee

output wire [3:0]state;
output wire AD_o;
output wire [7:0] regseg,regmin,reghora,regdate,regmes,regano,regThora,regTmin,regTseg;
output wire RD;
output wire WR;
output wire chipselecc_o;

output wire [7:0] salient;	 

wire [2:0]enables;
reg [2:0]swt;
reg [12:0]conta=12'b000000000000;
reg cambiomaq=1'b0;
always @(posedge clk_i)
begin
if (reset_i)
	begin
	swt=3'b100;
	conta=12'b000000000000;
	end
else 
	begin
		if(conta==13'd486)
			begin
			if(cambiomaq)
				begin
				swt=3'b010;
				end
			else   
				begin
				swt=3'b001;
				end
			end
		if(conta<13'd486)
			begin
			swt=3'b100;
			conta=conta+1'b1;
			end
	end
	
end

always@(posedge btn_cambiomaq)
begin
	cambiomaq=~cambiomaq;
end

maquinaglobal maquinas(clk_i,aumenta_i,cambio_i,reset_i,AD_o,enables,pulsoprogramo,salient,RD,WR,chipselecc_o,state,regseg,regmin,reghora,regdate,regmes,regano,regThora,regTmin,regTseg);
Controlpicoblaze pico(clk_i,swt,enables);

endmodule
