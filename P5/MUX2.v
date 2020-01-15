`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:37:32 11/19/2019 
// Design Name: 
// Module Name:    MUX2 
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
module MUX2(
    input [31:0] A,
    input [31:0] B,
    input sel,
    output [31:0] out
    );
	 assign out=sel?B:A;


endmodule
