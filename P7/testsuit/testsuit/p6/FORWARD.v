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
    output flagM,
    output [4:0] addrM,
    output [2:0] dataM,			//0:from ALUOutM	1:from PCM+8	2:from extimmM	3:from mulOut 4:from CP0Data
    output flagE,
    output [4:0] addrE,
    output [1:0] dataE			//0:from PCE+8		1:from extimmE
    );
	 
	 wire mfc0_E,mfc0_M,mfc0_W,mtc0_E,mtc0_M,mtc0_W;
	 
	 wire cal_r_E,shiftS_E,cal_i_E,b_E,load_E,store_E,jalr_E,jr_E,mt_E,mf_E,muldiv_E,lui_E;
	 interpreter InterpreterFE(
		 .instr(instrE),
		 .store(store_E),.load(load_E),
		 .cal_rExceptMuldiv(cal_r_E),.cal_iExceptLui(cal_i_E),
		 .jalr(jalr_E),.jr(jr_E),.b(b_E),
		 .shiftS(shiftS_E),
		 .mt(mt_E),.mf(mf_E),
		 .jal(jal_E),
		 .muldiv(muldiv_E),
		 .lui(lui_E),
		 .mfc0(mfc0_E),
		 .mtc0(mtc0_E)
	 );
	 
	 wire cal_r_M,shiftS_M,cal_i_M,b_M,load_M,store_M,jalr_M,jr_M,mt_M,mf_M,muldiv_M,lui_M;
	 interpreter InterpreterFM(
		 .instr(instrM),
		 .store(store_M),.load(load_M),
		 .cal_rExceptMuldiv(cal_r_M),.cal_iExceptLui(cal_i_M),
		 .jalr(jalr_M),.jr(jr_M),.b(b_M),.shiftS(shiftS_M),.mt(mt_M),.mf(mf_M),.muldiv(muldiv_M),
		 .lui(lui_M),
		 .jal(jal_M),
		 .mfc0(mfc0_M),
		 .mtc0(mtc0_M)
	 );
	 
	  wire cal_r_W,shiftS_W,cal_i_W,b_W,load_W,store_W,jalr_W,jr_W,mt_W,mf_W,muldiv_W,lui_W;
	  interpreter InterpreterFW(
		  .instr(instrW),
		  .store(store_W),.load(load_W),
		  .cal_rExceptMuldiv(cal_r_W),.cal_iExceptLui(cal_i_W),
		  .jalr(jalr_W),.jr(jr_W),.b(b_W),.shiftS(shiftS_W),.mt(mt_W),.mf(mf_W),.muldiv(muldiv_W),
		  .lui(lui_W),
		  .jal(jal_W),
		  .mfc0(mfc0_W),
		  .mtc0(mtc0_W)
	  );
	 
	 assign flagE=	jal_E||jalr_E||lui_E;
						
	 assign flagM=	jal_M||jalr_M||cal_i_M||cal_r_M||shiftS_M||mf_M||lui_M;
						
	 assign flagW=	jal_W||jalr_W||cal_i_W||cal_r_W||shiftS_W||mf_W||load_W||lui_W||mfc0_W;
	 
	 //calculated, ready to be forwarded
	 assign addrE=	(jal_E)?	5'd31:
						(lui_E)?	instrE[`rt]:
						(jalr_E)?instrE[`rd]:
									5'd0;
	 
	 assign addrM=	(jal_M)?										5'd31:
						(cal_i_M||lui_M)?							instrM[`rt]:
						(cal_r_M||shiftS_M||mf_M||jalr_M)?	instrM[`rd]:
																		5'd0;
														
														
	 assign dataE= (jal_E||jalr_E)?	2'd0:
						(lui_E)?				2'd1:
												2'd0;
														
	 assign dataM= (jal_M||jalr_M)?	2'd1:
						(lui_M)?				2'd2:
						(mf_M)?				2'd3:
												2'd0;


endmodule
