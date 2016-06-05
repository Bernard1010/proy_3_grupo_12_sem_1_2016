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
module ControlRTC(clk_i,aumenta_i,aum_cambio,reset_i,AD_o,btn_cambiomaq1,btn_cambiomaq2,pulsoprogramo,estado,salient,RD,WR,chipselecc_o,state,regseg,regmin,reghora,regdate,regmes,regano,regThora,regTmin,regTseg);

input wire clk_i;	
//input wire [2:0]swt; 
input wire aumenta_i,reset_i;
input wire btn_cambiomaq1;
input wire btn_cambiomaq2;
input wire pulsoprogramo;
input wire aum_cambio;

//input wire [1:0]estado_i;//1 escribe,0 lee
output reg [2:0]estado;
output wire [3:0]state;
output wire AD_o;
output wire [7:0] regseg,regmin,reghora,regdate,regmes,regano,regThora,regTmin,regTseg;
output wire RD;
output wire WR;
output wire chipselecc_o;

inout wire [7:0] salient;	 

wire [2:0]enables;
wire [3:0]cambio_i;
reg [2:0]swt=3'b000;
reg [12:0]conta=12'b000000000000;
reg cambiomaquina=1'b1;
reg clkinterno=1'b0;
reg [12:0]conta1=12'b000000000000;

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
			if(cambiomaquina)
				begin
				swt=3'b010;
				estado='b010;
				end
			else   
				begin
				swt=3'b001;
				estado='b001;
				end
			end
		if(conta<13'd486)
			begin
			swt=3'b100;
			estado=3'b100;
			conta=conta+1'b1;
			end
	end
//estado=enables;	
end

	
always@(posedge clk_i)
begin
	if(btn_cambiomaq1)
		begin
		cambiomaquina=1'b1;
		end
	else if (btn_cambiomaq2)
		begin
		cambiomaquina=1'b0;
		end
end

controlcambio cambiando(clk_i,aum_cambio,cambio_i);
maquinaglobal maquinas(clk_i,aumenta_i,cambio_i,reset_i,AD_o,enables,pulsoprogramo,salient,RD,WR,chipselecc_o,state,regseg,regmin,reghora,regdate,regmes,regano,regThora,regTmin,regTseg);
Controlpicoblaze pico(clk_i,swt,enables);

endmodule
