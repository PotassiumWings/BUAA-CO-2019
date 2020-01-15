`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:16 11/19/2019 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
    input [31:0] PCBranch,
    input [31:0] PCJ,
    input [31:0] PCJr,
    input [31:0] PC,
	 
	 input [31:0]EPC,
	 
    input j,
    input jal,
    input jr,
	 input jalr,
    input b,
	 
	 input eret,
	 input req,
	 
    output [31:0] NPC
    );
	 assign NPC=req?		32'h4180:
					eret?		EPC:
					b?			PCBranch:
				   j|jal?	PCJ:
				   jr|jalr?	PCJr:
								PC+4;


endmodule
