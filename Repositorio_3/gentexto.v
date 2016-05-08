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
   wire [10:0] rom_addr;//direccion de ROM
		
	//signal de direccion de caracter en memoria ROM de objetos
   reg [6:0] char_addr,char_addr_obj;
	
   reg [3:0] row_addr;//direccion de fila en la memoria ROM 
	
   //signals de direcciode fila en la ROM de objetos	
   wire [3:0] row_addr_obj;
	
   reg [2:0] bit_addr;//direccion de bit en fila de ROM
	
	//direccion de bit de en memoria ROM de objetos	
   wire [2:0] bit_addr_obj;
	
   wire [7:0] font_word;//Salida de datos en memoria ROM
	
	//signals de activacion de objetos
   wire font_bit, obj_on;
	
   	

   // instantiate font ROM
   font_rom font_unit
      (.addr(rom_addr), .data(font_word),.clk(clk_i));
		
		
   //-------------------------------------------
   // Tablero de Fecha literal
	//-----------------------------------------
   assign obj_on = (pix_y[9:6]==0) &&(0<=pix_x[9:5]) && (pix_x[9:5]<=13);
   assign row_addr_obj = pix_y[5:2];
   assign bit_addr_obj = pix_x[4:2];
	always @*
      case(pix_x[8:5])
			4'h0: char_addr_obj = 7'h00; //  
         4'h1: char_addr_obj = 7'h46; // F
         4'h2: char_addr_obj = 7'h45; // E
         4'h3: char_addr_obj = 7'h43; // C
			4'h4: char_addr_obj = 7'h48; // H
			4'h5: char_addr_obj = 7'h41; // A
         4'h6: char_addr_obj = 7'h00; // 
         4'h7: char_addr_obj = 7'h4d; // M
			4'h8: char_addr_obj = 7'h45; // E
         4'h9: char_addr_obj = 7'h53; // S
         4'ha: char_addr_obj = 7'h00; //  
			4'hb: char_addr_obj = 7'h41; // A
			4'hc: char_addr_obj = 7'h40; // @
			default: char_addr_obj = 7'h4f; // O
			
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
					text_rgb=3'b010;
      end
		
		
		
				 
   end

   
   //-------------------------------------------
   // font rom interface
   //-------------------------------------------
   assign rom_addr = {char_addr, row_addr};
   assign font_bit = font_word[~bit_addr];
	
	
endmodule