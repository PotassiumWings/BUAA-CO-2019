`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:06:45 12/11/2019 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset,
    input interrupt,
    output [31:0] addr
    );
	 
	 wire [5:0]HWInt;
	 wire prWE;
	 wire [31:0]prWD,prRD;
	 wire [31:2]prAddr;
	 
	 wire [31:0]PCM;
	 
	 CPU CPU(
		.clk(clk),
		.reset(reset),
		.prRD(prRD),
		.prWE(prWE),
		.HWInt(HWInt),
		.prAddr(prAddr),
		.prWD(prWD),
		.PC_M(PCM)
	 );
	 
	 wire [31:0]inTC,outTC1,outTC2;
	 wire WETC1,WETC2,IRQTC1,IRQTC2;
	 
	 assign HWInt={3'b0,interrupt,IRQTC2,IRQTC1};
	 
	 assign WETC1=({prAddr,2'b0}<=32'h7f0b)&&prWE;
	 assign WETC2=({prAddr,2'b0}>=32'h7f10)&&prWE;
	 
	 assign inTC=prWD;
	 assign prRD=WETC1?	outTC1:
								outTC2;
	 
	 
	 TC TC1(
		.clk(clk),
		.reset(reset),
		.Addr(prAddr),
		.WE(WETC1),
		.Din(inTC),
		.Dout(outTC1),
		.IRQ(IRQTC1),
		.PCM(PCM)
	 );
	 
	 TC TC2(
		.clk(clk),
		.reset(reset),
		.Addr(prAddr),
		.WE(WETC2),
		.Din(inTC),
		.Dout(outTC2),
		.IRQ(IRQTC2),
		.PCM(PCM)
	 );


endmodule
