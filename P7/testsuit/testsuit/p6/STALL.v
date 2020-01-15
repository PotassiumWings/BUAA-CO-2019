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
module STALL(
	 input mulBusy,
    input [31:0] instrD,
    input [31:0] instrE,
    input [31:0] instrM,
    input [31:0] instrW,
    output stall
    ); 
	 
	 wire mfc0_E,mfc0_M;

	 wire cal_r_D,shiftS_D,cal_i_D,b_D,bgez_D,load_D,store_D,jalr_D,jr_D,mt_D,mf_D,muldiv_D;
	 interpreter InterpreterD(
		.instr(instrD),
		.store(store_D),.load(load_D),
		.cal_rExceptMuldiv(cal_r_D),.muldiv(muldiv_D),.shiftS(shiftS_D),//sll srl sra
		.cal_iExceptLui(cal_i_D),
		.jalr(jalr_D),.jr(jr_D),.b(b_D),.bgez(bgez_D),
		.mt(mt_D),.mf(mf_D)
	 );
	 
	 wire cal_r_E,cal_i_E,load_E,mf_E;//cal_r除去了muldiv
	 interpreter InterpreterE(
		.instr(instrE),
		.load(load_E),
		.cal_rExceptMuldiv(cal_r_E),.muldiv(muldiv_E),.shiftS(shiftS_E),
		.cal_iExceptLui(cal_i_E),
		.jalr(jalr_E),.jr(jr_E),.b(b_E),
		.mt(mt_E),.mf(mf_E),
		.mfc0(mfc0_E)
	 );
	 
	 wire load_M;
	 interpreter InterpreterM(
		.instr(instrM),
		.load(load_M),
		.mfc0(mfc0_M)
	 );
	 
	 wire stall_b,stall_r,stall_i,stall_l,stall_s,stall_jr,stall_mt;
	 
	 assign stall_r=  (	
								((cal_r_D&&!shiftS_D)||muldiv_D) &&
								(
									((load_E|mfc0_E) && instrE[`rt] && (instrE[`rt]==instrD[`rs]||instrE[`rt]==instrD[`rt]))
								)
							)	
							||
							(
								(shiftS_D)&&
								(
									((load_E|mfc0_E) && instrE[`rt] && (instrE[`rt]==instrD[`rt]))
								)
							);
							
	 assign stall_i=  cal_i_D &&
							(
								((load_E|mfc0_E) && instrE[`rt] && instrE[`rt]==instrD[`rs])
							);
							
	 
	 //特判bgez，无需转发1
	 wire [4:0] rt_D=	bgez_D?	0:
										instrD[`rt];
								
	 assign stall_b=	b_D &&
							(
								(cal_r_E && instrE[`rd] && (instrE[`rd]==instrD[`rs]||instrE[`rd]==rt_D))||
								(shiftS_E && instrE[`rd] && (instrE[`rd]==instrD[`rs]||instrE[`rd]==rt_D))||
								(cal_i_E && instrE[`rt] && (instrE[`rt]==instrD[`rs]||instrE[`rt]==rt_D))||
								((load_E|mfc0_E) && 	instrE[`rt] && (instrE[`rt]==instrD[`rs]||instrE[`rt]==rt_D))||
								((load_M|mfc0_M) && 	instrM[`rt] && (instrM[`rt]==instrD[`rs]||instrM[`rt]==rt_D))||
								(mf_E &&		instrE[`rd] && (instrE[`rd]==instrD[`rs]||instrE[`rd]==rt_D))
							);
							

	 assign stall_l=  load_D && instrD[`rs] &&
							(
								((load_E|mfc0_E) && instrE[`rt]==instrD[`rs])
							);
							
	 assign stall_s=  store_D && instrD[`rs] &&
							(
								((load_E|mfc0_E) && instrE[`rt]==instrD[`rs])
							);
							
	 assign stall_mt= mt_D && instrD[`rs] &&
							(
								((load_E|mfc0_E) && instrE[`rt]==instrD[`rs])
							);
							
	 assign stall_jr=	(jr_D|jalr_D) && instrD[`rs] && 
							(
								(cal_r_E && instrE[`rd]==instrD[`rs])||
								(shiftS_E && instrE[`rd]==instrD[`rs])||
								(cal_i_E && instrE[`rt]==instrD[`rs])||
								((load_E|mfc0_E) && instrE[`rt]==instrD[`rs])||
								((load_M|mfc0_M) && instrM[`rt]==instrD[`rs])||
								(mf_E && instrE[`rd]==instrD[`rs])
							);
			
	 wire stall_mul = mulBusy&&(muldiv_D||mf_D||mt_D);
	 
	 assign stall=stall_b|stall_r|stall_i|stall_l|stall_s|stall_jr|stall_mt|stall_mul;


endmodule
