`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:22:34 11/19/2019 
// Design Name: 
// Module Name:    CMP 
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
module CMP(
    input [31:0] data1,
    input [31:0] data2,
    output equal,
    output greater,
    output less
    );
	 assign equal=		data1==data2;
	 assign greater=	data1>data2;
	 assign less=		data1<data2;

endmodule
