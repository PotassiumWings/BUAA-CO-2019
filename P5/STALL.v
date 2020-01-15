`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:17 11/20/2019 
// Design Name: 
// Module Name:    STALL 
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
module STALL(
    input [31:0] instrD,
    input [31:0] instrE,
    input [31:0] instrM,
    input [31:0] instrW,
    output stall
    ); 
	 
	 wire cal_r_D,cal_i_D,load_D,store_D,jal_D,jr_D,b_D;
	 assign cal_r_D =(instrD[`op]==`adduop&&instrD[`func]==`addufunc)||(instrD[`op]==`subuop&&instrD[`op]==`subufunc);
	 assign cal_i_D =(instrD[`op]==`oriop)||(instrD[`op]==`luiop);
	 assign load_D =(instrD[`op]==`lwop);
	 assign store_D = (instrD[`op]==`swop);
	 assign jal_D = (instrD[`op]==`jalop);
	 assign jr_D = (instrD[`op]==`jrop&&instrD[`func]==`jrfunc);
	 assign b_D = (instrD[`op]==`beqop);
	 
	 wire cal_r_E,cal_i_E,load_E,store_E,jal_E,jr_E,b_E;
	 assign cal_r_E =(instrE[`op]==`adduop&&instrE[`func]==`addufunc)||(instrE[`op]==`subuop&&instrE[`op]==`subufunc);
	 assign cal_i_E =(instrE[`op]==`oriop)||(instrE[`op]==`luiop);
	 assign load_E =(instrE[`op]==`lwop);
	 assign store_E = (instrE[`op]==`swop);
	 assign jal_E = (instrE[`op]==`jalop);
	 assign jr_E = (instrE[`op]==`jrop&&instrE[`func]==`jrfunc);
	 assign b_E = (instrE[`op]==`beqop);

	 wire cal_r_M,cal_i_M,load_M,store_M,jal_M,jr_M,b_M;
	 assign cal_r_M =(instrM[`op]==`adduop&&instrM[`func]==`addufunc)||(instrM[`op]==`subuop&&instrM[`op]==`subufunc);
	 assign cal_i_M =(instrM[`op]==`oriop)||(instrM[`op]==`luiop);
	 assign load_M =(instrM[`op]==`lwop);
	 assign store_M = (instrM[`op]==`swop);
	 assign jal_M = (instrM[`op]==`jalop);
	 assign jr_M = (instrM[`op]==`jrop&&instrM[`func]==`jrfunc);
	 assign b_M = (instrM[`op]==`beqop);

	 wire cal_r_W,cal_i_W,load_W,store_W,jal_W,jr_W,b_W;
	 assign cal_r_W =(instrW[`op]==`adduop&&instrW[`func]==`addufunc)||(instrW[`op]==`subuop&&instrW[`op]==`subufunc);
	 assign cal_i_W =(instrW[`op]==`oriop)||(instrW[`op]==`luiop);
	 assign load_W =(instrW[`op]==`lwop);
	 assign store_W = (instrW[`op]==`swop);
	 assign jal_W = (instrW[`op]==`jalop);
	 assign jr_W = (instrW[`op]==`jrop&&instrW[`func]==`jrfunc);
	 assign b_W = (instrW[`op]==`beqop);
	 
	 wire stall_b,stall_r,stall_i,stall_l,stall_s,stall_jr;
	 assign stall_b=	b_D &&
							(
								(cal_r_E && (instrE[`rd]==instrD[`rs]||instrE[`rd]==instrD[`rt]))||
								(cal_i_E && (instrE[`rt]==instrD[`rs]||instrE[`rt]==instrD[`rt]))||
								(load_E && (instrE[`rt]==instrD[`rs]||instrE[`rt]==instrD[`rt]))||
								(load_M && (instrM[`rt]==instrD[`rs]||instrM[`rt]==instrD[`rt]))
							);
							
	 assign stall_r=  cal_r_D &&
							(
								(load_E && (instrE[`rt]==instrD[`rs]||instrE[`rt]==instrD[`rt]))
							);
							
	 assign stall_i=  cal_i_D &&
							(
								(load_E && instrE[`rt]==instrD[`rs])
							);
							
	 assign stall_l=  load_D &&
							(
								(load_E && instrE[`rt]==instrD[`rs])
							);
							
	 assign stall_s=  store_D &&
							(
								(load_E && instrE[`rt]==instrD[`rs])
							);
							
	 assign stall_jr=	jr_D &&
							(
								(cal_r_E && instrE[`rd]==instrD[`rs])||
								(cal_i_E && instrE[`rt]==instrD[`rs])||
								(load_E && instrE[`rt]==instrD[`rs])||
								(load_M && instrM[`rt]==instrD[`rs])
							);
						
	 assign stall=stall_b|stall_r|stall_i|stall_l|stall_s|stall_jr;


endmodule
