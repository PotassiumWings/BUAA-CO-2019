`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:24:04 11/19/2019 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [2:0]sel,
    output [31:0] out
    );
	 assign out=	sel==0?	A+B:
						sel==1?	A-B:
						sel==2?	A&B:
						sel==3?	A|B:
					/*	sel==4?*/A^B;

endmodule
