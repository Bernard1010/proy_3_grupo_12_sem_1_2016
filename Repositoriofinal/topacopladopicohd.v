`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:19 05/23/2016 
// Design Name: 
// Module Name:    topacopladopicohd 
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
module topacopladopicohd( 
                  /*cambiomaq1,
						cambiomaq2,
						aum_cambio,*/
                  clk_nexys, 
                  /*direccion,*/ 
                  /*programa,*/ 
                  reset, 
                  rst_ring, 
                  A_D, 
                  CS, 
                  estado, 
                  Hsync, 
                  RD, 
                  txt_rgb, 
                  Vsync, 
                  WR,
						AD,
						ps2c,
						ps2d);

    
    //input cambiomaq1;
	 //input cambiomaq2;
	 //input aum_cambio;
    input clk_nexys,ps2d,ps2c;
    //input [3:0] direccion;
    //input programa;
    input reset;
    input rst_ring;
   output A_D;
   output CS;
   output [2:0] estado;
   output Hsync;
   output RD;
   output [2:0] txt_rgb;
   output Vsync;
   output WR;
	wire [5:0]code;
    inout wire[7:0] AD;
   
   wire [7:0] XLXN_15;
   wire [7:0] XLXN_16;
   wire [7:0] XLXN_17;
   wire [7:0] XLXN_18;
   wire [7:0] XLXN_19;
   wire [7:0] XLXN_20;
   wire [7:0] XLXN_21;
   wire [7:0] XLXN_22;
   wire [7:0] XLXN_23;
   wire [3:0] XLXN_30;
   
   AcplVGA  XLXI_1 (.ano(XLXN_20[7:0]), 
                   .clk(clk_nexys), 
                   .cursor(estado[0]), 
                   .date(XLXN_18[7:0]), 
                   .dirsel(XLXN_30[3:0]), 
                   .h_hora(XLXN_17[7:0]), 
                   .h_min(XLXN_16[7:0]), 
                   .h_seg(XLXN_15[7:0]), 
                   .mes(XLXN_19[7:0]), 
                   .reset(reset), 
                   .rst_ring(rst_ring), 
                   .t_hora(XLXN_21[7:0]), 
                   .t_min(XLXN_22[7:0]), 
                   .t_seg(XLXN_23[7:0]), 
                   .Hsync(Hsync), 
                   .txt_rgb(txt_rgb[2:0]), 
                   .Vsync(Vsync));
						 
   ControlRTC  XLXI_2 (.aumenta_i(code[5]), 
                      .btn_cambiomaq1(code[1]),
							 .btn_cambiomaq2(code[0]),
                      .aum_cambio(code[4]), 
                      .clk_i(clk_nexys), 
                      .pulsoprogramo(code[3]), 
                      .reset_i(code[2]), 
                      .AD_o(A_D), 
                      .chipselecc_o(CS), 
                      .estado(estado[2:0]), 
                      .RD(RD), 
                      .regano(XLXN_20[7:0]), 
                      .regdate(XLXN_18[7:0]), 
                      .reghora(XLXN_17[7:0]), 
                      .regmes(XLXN_19[7:0]), 
                      .regmin(XLXN_16[7:0]), 
                      .regseg(XLXN_15[7:0]), 
                      .regThora(XLXN_21[7:0]), 
                      .regTmin(XLXN_22[7:0]), 
                      .regTseg(XLXN_23[7:0]), 
                      .state(XLXN_30[3:0]), 
                      .WR(WR), 
                      .salient(AD[7:0]));
							 
 	TOP teclado(.clk(clk_nexys),.ps2c(ps2c),.ps2d(ps2d),.rx_en(1'b1),.code(code));							 
							 
							 
endmodule
