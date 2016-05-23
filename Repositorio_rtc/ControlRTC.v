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
module ControlRTC(clk_i,aumenta_i,cambio_i,reset_i,AD_o,graba_i,swt,pulsoprogramo,salient,RD,WR,chipselecc_o,state,regseg,regmin,reghora,regdate,regmes,regano,regThora,regTmin,regTseg);

input wire clk_i;
input wire[2:0]swt;	 
input aumenta_i,reset_i;
input wire pulsoprogramo;
input wire graba_i;
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

maquinaglobal maquinas(clk_i,aumenta_i,cambio_i,reset_i,AD_o,graba_i,enables,pulsoprogramo,salient,RD,WR,chipselecc_o,state,regseg,regmin,reghora,regdate,regmes,regano,regThora,regTmin,regTseg);
Controlpicoblaze pico(clk_i,swt,enables);

endmodule
