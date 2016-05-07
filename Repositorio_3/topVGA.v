`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:50 03/29/2016 
// Design Name: 
// Module Name:    topVGA 
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
module topVGA(reloj,cursor, 
                     decenas, 
                     direccion, 
                     reset,
							rsw,
                     unidades, 
                     Hsync, 
                     rgb_o, 
                     Vsync);

    input wire reloj,cursor;
    input wire[3:0] decenas;
    input wire[3:0] direccion;
    input wire reset;
    input wire [3:0] unidades;
	 input wire rsw;
   output Hsync;
   output [2:0] rgb_o;
   output Vsync;
   
   wire [9:0] XLXN_15;
   wire [9:0] XLXN_36;
   wire [3:0] XLXN_59;
   wire [3:0] XLXN_60;
   wire [3:0] XLXN_61;
   wire [3:0] XLXN_62;
   wire [3:0] XLXN_63;
   wire [3:0] XLXN_64;
   wire [3:0] XLXN_65;
   wire [3:0] XLXN_66;
   wire [3:0] XLXN_67;
   wire [3:0] XLXN_69;
   wire [3:0] XLXN_70;
   wire [3:0] XLXN_71;
   wire [3:0] XLXN_72;
   wire [3:0] XLXN_73;
   wire [3:0] XLXN_74;
   wire [3:0] XLXN_75;
   wire [3:0] XLXN_76;
   wire [3:0] XLXN_77;
   wire XLXN_78;
   
   DMHz  Divisor (.clk_i(reloj),.clk_o(XLXN_78));
	
   vga_sync  vgasync (.clk(XLXN_78), 
               .reset(reset), 
               .hsync(Hsync), 
               .pixel_x(XLXN_15[9:0]), 
               .pixel_y(XLXN_36[9:0]), 
               .vsync(Vsync));
					
   gentexto  Genarador (.ano_d(XLXN_63[3:0]), 
                      .ano_u(XLXN_64[3:0]), 
                      .clk_i(reloj),
							 .rsw(rsw),
							 .cursor(cursor),
							 .dir(direccion), 		
                      .fecha_d(XLXN_59[3:0]), 
                      .fecha_u(XLXN_60[3:0]), 
                      .H_hora_d(XLXN_65[3:0]), 
                      .H_hora_u(XLXN_66[3:0]), 
                      .H_min_d(XLXN_67[3:0]), 
                      .H_min_u(XLXN_69[3:0]), 
                      .H_seg_d(XLXN_70[3:0]), 
                      .H_seg_u(XLXN_71[3:0]), 
                      .mes_d(XLXN_61[3:0]), 
                      .mes_u(XLXN_62[3:0]), 
                      .pix_x(XLXN_15[9:0]), 
                      .pix_y(XLXN_36[9:0]), 
                      .T_hora_d(XLXN_72[3:0]), 
                      .T_hora_u(XLXN_73[3:0]), 
                      .T_min_d(XLXN_74[3:0]), 
                      .T_min_u(XLXN_75[3:0]), 
                      .T_seg_d(XLXN_76[3:0]), 
                      .T_seg_u(XLXN_77[3:0]), 
                      .text_rgb(rgb_o[2:0]));
							 
   DeMUX  Decenas (.clk_i(reloj), 
                 .data(decenas[3:0]), 
                 .sel(direccion[3:0]), 
                 .sal_0(XLXN_59[3:0]), 
                 .sal_1(XLXN_61[3:0]), 
                 .sal_2(XLXN_63[3:0]), 
                 .sal_3(XLXN_65[3:0]), 
                 .sal_4(XLXN_67[3:0]), 
                 .sal_5(XLXN_70[3:0]), 
                 .sal_6(XLXN_72[3:0]), 
                 .sal_7(XLXN_74[3:0]), 
                 .sal_8(XLXN_76[3:0]));
					  
   DeMUX  Unidades(.clk_i(reloj), 
                 .data(unidades[3:0]), 
                 .sel(direccion[3:0]), 
                 .sal_0(XLXN_60[3:0]), 
                 .sal_1(XLXN_62[3:0]), 
                 .sal_2(XLXN_64[3:0]), 
                 .sal_3(XLXN_66[3:0]), 
                 .sal_4(XLXN_69[3:0]), 
                 .sal_5(XLXN_71[3:0]), 
                 .sal_6(XLXN_73[3:0]), 
                 .sal_7(XLXN_75[3:0]), 
                 .sal_8(XLXN_77[3:0]));
					  
endmodule

