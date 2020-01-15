`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:47:13 11/20/2019 
// Design Name: 
// Module Name:    FORWARD 
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
`define op 31:26
`define func 5:0
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define adduop 	6'b000000
`define addufunc 	6'b100001
`define subuop 	6'b000000
`define subufunc 	6'b100011
`define oriop 		6'b001101
`define luiop 		6'b001111
`define lwop		6'b100011
`define swop		6'b101011
`define jalop		6'b000011
`define jrop		6'b000000
`define jrfunc		6'b001000
`define beqop		6'b000100
module FORWARD(
	 input clk,
    input [31:0] instrD,
    input [31:0] instrE,
    input [31:0] instrM,
    input [31:0] instrW,
    output flagW,
    //output [4:0] addrW,
    //output [1:0] dataW,			//0:from ReadDMW	1:from ALUOutW	2:from PCW+8	3:from extimmW
    output flagM,
    output [4:0] addrM,
    output [1:0] dataM,			//0:from ALUOutM	1:from PCM+8	2:from extimmM
    output flagE,
    output [4:0] addrE,
    output [1:0] dataE			//0:from PCE+8		1:from extimmE
    );
	 assign flagE=	(instrE[`op]==`jalop)||
						(instrE[`op]==`luiop);
						
	 assign flagM=	(instrM[`op]==`jalop)||
						(instrM[`op]==`luiop)||
						(instrM[`op]==`adduop&&instrM[`func]==`addufunc)||
						(instrM[`op]==`subuop&&instrM[`func]==`subufunc)||
						(instrM[`op]==`oriop);
						
	 assign flagW=	(instrW[`op]==`jalop)||
						(instrW[`op]==`luiop)||
						(instrW[`op]==`adduop&&instrW[`func]==`addufunc)||
						(instrW[`op]==`subuop&&instrW[`func]==`subufunc)||
						(instrW[`op]==`oriop)||
						(instrW[`op]==`lwop);
	 
	 //calculated, ready to be forwarded
	 assign addrE=	(instrE[`op]==`jalop)?	5'd31:
						(instrE[`op]==`luiop)?	instrE[`rt]:
														5'd0;
	 
	 assign addrM=	(instrM[`op]==`jalop)?	5'd31:
						(instrM[`op]==`luiop)?	instrM[`rt]:
						(instrM[`op]==`adduop&&instrM[`func]==`addufunc)?	instrM[`rd]:
						(instrM[`op]==`subuop&&instrM[`func]==`subufunc)?	instrM[`rd]:
						(instrM[`op]==`oriop)?	instrM[`rt]:
														5'd0;
														
	 /*assign addrW=	(instrW[`op]==`jalop)?	5'd31:
						(instrW[`op]==`luiop)?	instrW[`rt]:
						(instrW[`op]==`adduop&&instrW[`func]==`addufunc)?	instrW[`rd]:
						(instrW[`op]==`subuop&&instrW[`func]==`subufunc)?	instrW[`rd]:
						(instrW[`op]==`oriop)?	instrW[`rt]:
						(instrW[`op]==`lwop)?	instrW[`rt]:
														5'd0;*/
														
	 assign dataE= (instrE[`op]==`jalop)?										2'd0:
						(instrE[`op]==`luiop)?										2'd1:
																							2'd0;
														
	 assign dataM= (instrM[`op]==`jalop)?										2'd1:
						(instrM[`op]==`luiop)?										2'd2:
						(instrM[`op]==`adduop&&instrM[`func]==`addufunc)?	2'd0:
						(instrM[`op]==`subuop&&instrM[`func]==`subufunc)?	2'd0:
						(instrM[`op]==`oriop)?										2'd0:
																							2'd0;
																							
	 /*assign dataW= (instrW[`op]==`jalop)?										2'd2:
						(instrW[`op]==`luiop)?										2'd3:
						(instrW[`op]==`adduop&&instrW[`func]==`addufunc)?	2'd1:
						(instrW[`op]==`subuop&&instrW[`func]==`subufunc)?	2'd1:
						(instrW[`op]==`oriop)?										2'd1:
						(instrW[`op]==`lwop)?										2'd0:
																							2'd0;*/

endmodule
