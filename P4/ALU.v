`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:53:41 11/09/2019 
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
    input [1:0]op,
    output [31:0] out
    );
	 assign out=op==0?	A+B:
					op==1?	A-B:
					op==2?	A&B:
								A|B;
//always@*$display("ALU:%h A:%h B:%h",out,A,B);

endmodule
