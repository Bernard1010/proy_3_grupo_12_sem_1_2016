`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:56 03/29/2016 
// Design Name: 
// Module Name:    gentexto 
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
module gentexto(
    input wire [9:0] pix_x, pix_y,
	 input clk_i,
    output reg [2:0] text_rgb
   );
	
	

	
   // signal declaration
   wire [12:0] rom_addr;//direccion de ROM/ 13 bits
		
	//signal de direccion de caracter en memoria ROM de objetos
   reg [6:0] char_addr,char_addr_obj;
	
   reg [5:0] row_addr;//direccion de fila en la memoria ROM /6 bits
	
   //signals de direcciode fila en la ROM de objetos	
   wire [5:0] row_addr_obj;// 6 bits
	
   reg [4:0] bit_addr;//direccion de bit en fila de ROM/ 5 bits
	
	//direccion de bit de en memoria ROM de objetos	
   wire [4:0] bit_addr_obj;//5 bits
	
   wire [31:0] font_word;//Salida de datos en memoria ROM/32 bits
	
	//signals de activacion de objetos
   wire font_bit, obj_on;
	
   	

   // instantiate font ROM
   font_rom font_unit
      (.addr(rom_addr), .data(font_word),.clk(clk_i));
		
		
   //-------------------------------------------
   // Tablero de Fecha literal
	//-----------------------------------------
   assign obj_on = (pix_y[9:6]==0) &&(1<=pix_x[9:5]) && (pix_x[9:5]<=19);
   assign row_addr_obj = pix_y[5:0];
   assign bit_addr_obj = pix_x[4:0];
	always @*
      case(pix_x[9:5])
			5'h01: char_addr_obj = 7'h30; // 
			5'h02: char_addr_obj = 7'h31; // 
			5'h03: char_addr_obj = 7'h32; // 
			5'h04: char_addr_obj = 7'h33; // 
			5'h05: char_addr_obj = 7'h34; // 
			5'h06: char_addr_obj = 7'h35; // 
			5'h07: char_addr_obj = 7'h36; // 
			5'h08: char_addr_obj = 7'h37; // 
			5'h09: char_addr_obj = 7'h38; // 
			5'h0a: char_addr_obj = 7'h39; // 
			5'h0b: char_addr_obj = 7'h40; // 
			5'h0c: char_addr_obj = 7'h41; // 
			5'h0d: char_addr_obj = 7'h42; // 
			5'h0e: char_addr_obj = 7'h43; // 
			5'h0f: char_addr_obj = 7'h44; // 
			5'h10: char_addr_obj = 7'h45; // 
			5'h11: char_addr_obj = 7'h46; // 
			5'h12: char_addr_obj = 7'h47; // 
			default: char_addr_obj = 7'h48; // 
			
      endcase
		
			

		
		
		
			


		
/////////////////////////////////

	//-------------------------------------------
   // mux for font ROM addresses and rgb
   //-------------------------------------------
   always @(posedge clk_i)
	begin
      text_rgb = 3'b000;
		
		//Objeto fecha literal 
      if (obj_on)
         begin
            char_addr = char_addr_obj;
				row_addr = row_addr_obj;
            bit_addr = bit_addr_obj;
            if (font_bit)
               text_rgb = 3'b001;
				else 
					text_rgb=3'b000;
      end
		
		
		
				 
   end

   
   //-------------------------------------------
   // font rom interface
   //-------------------------------------------
   assign rom_addr = {char_addr, row_addr};
   assign font_bit = font_word[~bit_addr];
	
	
endmodule