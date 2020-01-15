`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:08:08 12/09/2019 
// Design Name: 
// Module Name:    CP0 
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
module CP0(
    input [4:0] A1,//READ REG
    input [4:0] A2,//WRITE REG
	 input bdIn,//branch delay exception
    input [31:0] dataIn,//WRITEDATA
    input [31:2] PC,//affected instruction PC
    input [4:0] excCode,//interrupt/except code
    input [5:0] hwInt,//hardware interrupt
    input WE,//WRITE
    input exlClr,//eret -> set 0
    input clk,
    input reset,
    output req,//interrupt (based on hwInt&IM,IE,!EXL) | exception
    output [31:0] EPC,//EPC
    output [31:0] dataOut//READDATA
    );
	 
	 //规范:只有PC,EPC,epcReg,epc是[31:2],其余均为[x:0]
	 //PC:		受害指令PC 	EPC:	output EPC
	 //epcReg:	reg			epc:	combinatorial logic epc
	 
	 //SR
	 reg [31:0]SR=0;
	 wire [5:0]IM=SR[15:10];
	 wire EXL=SR[1],IE=SR[0];
	 //Cause
	 reg [31:0]Cause=0;
	 wire BD=Cause[31];
	 wire [5:0]hwint_pend=Cause[15:10];
	 wire [4:0]ExcCode=Cause[6:2];
	 //EPC
	 reg [31:2]epcReg=0;
	 //PrID
	 reg [31:0]PrID=32'h18373019;
	 
	 wire intReq=(|(hwInt[5:0]&IM[5:0]))&IE&!EXL;
	 wire excReq=(|excCode)&!EXL;
	 assign req=intReq|excReq;
	 
	 wire [31:2]epc	=	(req&&bdIn)?	(PC[31:2]-1):
								(req&&!bdIn)?	(PC[31:2]):
													epcReg;
	 
	 assign EPC={epc,2'b0};
	 
	 //mfc0
	 assign dataOut=	(A1==12)?	SR:
							(A1==13)?	Cause:
							(A1==14)?	EPC:
							(A1==15)?	PrID:
											0;
	 
	 always@(posedge clk or posedge reset)begin
	     if(reset)begin
		      SR<=0;
				Cause<=0;
				epcReg<=0;
				PrID<=0;
		  end
		  else begin
				
				//exit interrupt/exception (eret) exl->0
				if(exlClr)begin
				    SR[1]<=0;//sr[1]:exl
				end
				
				//interrupt/exception, set BD, set epcReg
				if(req)begin
					 if(intReq)Cause[6:2]<=5'b0;//interrupt, excCode=0
					 else Cause[6:2]<=excCode;
					 SR[1]<=1;//exl set 1
					 
					 //$display("epc changed: to %h",epc);
					 epcReg<=epc;
					 
				    if(bdIn)Cause[31]<=1'b1;
					 else Cause[31]<=1'b0;
				end
				//mtc0 but not interrupt/exception
				else if(WE)begin
				    if(A2==12)SR<=dataIn;
					 else if(A2==14)begin
					     epcReg<=dataIn[31:2];
						  //$display("epc changed: to %h",dataIn[31:2]);
					 end
					 else $display("bad input");
				end
				
				Cause[15:10]<=hwInt;
		  end
	 end


endmodule
