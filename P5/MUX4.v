`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:52 11/19/2019 
// Design Name: 
// Module Name:    MUX4 
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
module MUX4(
    input [31:0] A,
    input [31:0] B,
    input [31:0] C,
    input [31:0] D,
    input [1:0] sel,
    output [31:0] out
    );
	 assign out=
			  sel==0?A:
			  sel==1?B:
			  sel==2?C:
						D;


endmodule
