`include "Parameters.v"
`define INCLUDE_PARAMETERS

`include "InstructionSet.v"
`define INCLUDE_INSTRUCTION_SET

// include modules
`include "InstructionMemory.v"
`define INCLUDE_INSTRUCTION_FETCH
`include "InstructionFetch.v"

`include "InstructionFetch2Decode.v"

`include "Register.v"

`define INCLUDE_INSTRUCTION_DECODE
`include "InstructionDecode.v"

`include "InstructionDecode2Execute.v"

`define INCLUDE_EXECUTION_UNIT
`include "ExecutionUnit.v"

`include "EXE_MEM.v"

`include "DataMemory.v"
`define INCLUDE_MEMORY
`include "Memory.v"

`include "MemoryWriteBack.v"

`define INCLUDE_WRITE_BACK
`include "WriteBack.v"

`include "WB_out.v"

module CpuTop (
	input clk,    	// Clock Input
	input rst_n,	// Active Low => Asynch Reset
	output reg halt
`ifdef TRACE_MEM
	,input wire Print
`endif
);

	// wires for IF to IF-ID
	wire [`WIDTH - 1:0] IR_IF_ID1;
	wire [`WIDTH - 3:0] PC_IF_ID1;

	// wires for ID to IF-ID
	wire [`WIDTH - 1:0] IR_IF_ID2;
	wire [`WIDTH - 3:0] PC_IF_ID2;

	// wires for IF
	wire IsBranch;
	wire [`WIDTH - 3:0] BranchAddr;

	InstructionFetch IFetch(.clk(clk), .rst_n(rst_n), .instruction_reg(IR_IF_ID1), .progcounter(PC_IF_ID1), .IsBranch(IsBranch), .BranchAddr(BranchAddr));
	PipelineIfetch2Idecode PipelineF2D(.clk(clk), .instruction_in(IR_IF_ID1), .progcounter_in(PC_IF_ID1), .instruction_out(IR_IF_ID2), .progcounter_out(PC_IF_ID2));

	// wires for Reg to ID - Read port 1
	wire [`WIDTH - 1:0] Rd1_data;
	wire [`REG_ADDR_LEN - 1:0] Rd1_addr;
	wire Rd1_en;
	wire Rd1_st;
	// Read port 2
	wire [`WIDTH - 1:0] Rd2_data;
	wire [`REG_ADDR_LEN - 1:0] Rd2_addr;
	wire Rd2_en;
	wire Rd2_st;
	// Write port
	wire [`WIDTH - 1:0] Wt_data;
	wire [`REG_ADDR_LEN - 1:0] Wt_addr;
	wire Wt_en;
	wire [1:0] w_mode;

	RegisterFile RegisterFile(.clk(clk), .regA_addr(Rd1_addr), .dataA(Rd1_data), .r_en_A(Rd1_en), .st_A(Rd1_st),
		.regB_addr(Rd2_addr), .dataB(Rd2_data), .r_en_B(Rd2_en), .st_B(Rd2_st),
		.regC_addr(Wt_addr), .dataC(Wt_data), .w_en(Wt_en), .w_mode(w_mode), .halt(halt));

	// wires for ID to ID-EXE
	wire [`WIDTH - 3:0] PC_ID_EXE1;
	wire [`WIDTH - 1:0] IR_ID_EXE1;
	wire [`WIDTH - 1:0] X_ID_EXE1;
	wire [`WIDTH - 1:0] Y_ID_EXE1;

	// wires for ID-EXE to EXE
	wire [`WIDTH - 3:0] PC_ID_EXE2;
	wire [`WIDTH - 1:0] IR_ID_EXE2;
	wire [`WIDTH - 1:0] X_ID_EXE2;
	wire [`WIDTH - 1:0] Y_ID_EXE2;

	InstructionDecode IDecode(.clk(clk), .rst_n(rst_n),.progcounter_in(PC_IF_ID2), .instruction_in(IR_IF_ID2), 								// pipeline in
		.reg_src1_addr(Rd1_addr), .reg_src1_data(Rd1_data), .reg_src1_en(Rd1_en), .reg_src1_st(Rd1_st),		// register ports
		.reg_src2_addr(Rd2_addr), .reg_src2_data(Rd2_data), .reg_src2_en(Rd2_en), .reg_src2_st(Rd2_st),
		.progcounter_out(PC_ID_EXE1), .instruction_out(IR_ID_EXE1), .dataA(X_ID_EXE1), .dataB(Y_ID_EXE1),
		.IsFlush(IsBranch));		// pipeline out


	PipelineIdecode2Exec PipelineD2E(.clk(clk), .progcounter_in(PC_ID_EXE1), .instruction_in(IR_ID_EXE1), .dataA_in(X_ID_EXE1), .dataB_in(Y_ID_EXE1),	//pipeline in
		.progcounter_out(PC_ID_EXE2), .instruction_out(IR_ID_EXE2), .dataA_out(X_ID_EXE2), .dataB_out(Y_ID_EXE2));	// pipeline out


	// wires for EXE to EXE-MEM
	wire [`WIDTH - 3:0] PC_EXE_MEM1;
	wire [`WIDTH - 1:0] IR_EXE_MEM1;
	wire [`WIDTH - 1:0] Z_EXE_MEM1;
	wire [`WIDTH - 1:0] Addr_EXE_MEM1;

	// wires for EXE-MEM to MEM
	wire [`WIDTH - 3:0] PC_EXE_MEM2;
	wire [`WIDTH - 1:0] IR_EXE_MEM2;
	wire [`WIDTH - 1:0] Z_EXE_MEM2;
	wire [`WIDTH - 1:0] Addr_EXE_MEM2;	

	InstructionExecution iExecute(.clk(clk), .progcounter_in(PC_ID_EXE2), .instruction_in(IR_ID_EXE2), .dataA(X_ID_EXE2), .dataB(Y_ID_EXE2), 	// pipeline in
		.progcounter_out(PC_EXE_MEM1), .instruction_out(IR_EXE_MEM1), .dataC(Z_EXE_MEM1), .addr(Addr_EXE_MEM1), 		// pipeline out
		.IsBranch(IsBranch), .BranchAddr(BranchAddr));


	PipelineIExec2Memory PipelineE2M(.clk(clk), .progcounter_in(PC_EXE_MEM1), .instruction_in(IR_EXE_MEM1), .dataC_in(Z_EXE_MEM1), .addr_in(Addr_EXE_MEM1), // pipeline in
		.progcounter_out(PC_EXE_MEM2), .instruction_out(IR_EXE_MEM2), .dataC_out(Z_EXE_MEM2), .addr_out(Addr_EXE_MEM2));	// pipeline in

	// wires for MEM to MEM-WB
	wire [`WIDTH - 3:0] PC_MEM_WB1;
	wire [`WIDTH - 1:0] IR_MEM_WB1;
	wire [`WIDTH - 1:0] Z_MEM_WB1;

	// wires for MEM to MEM-WB
	wire [`WIDTH - 3:0] PC_MEM_WB2;
	wire [`WIDTH - 1:0] IR_MEM_WB2;
	wire [`WIDTH - 1:0] Z_MEM_WB2;

	DataMemoryCntrl DataMemCntrl(.clk(clk), .rst_n(rst_n), .progcounter_in(PC_EXE_MEM2), .instruction_in(IR_EXE_MEM2), .dataC_in(Z_EXE_MEM2), .datamem_addr(Addr_EXE_MEM2), // pipeline in
		.progcounter_out(PC_MEM_WB1), .instruction_out(IR_MEM_WB1), .dataC_out(Z_MEM_WB1)		// pipeline out
`ifdef TRACE_MEM
		,.Print(Print)
`endif
	);
	

	PipelineMem2Writeback PipelineM2WB(.clk(clk), .progcounter_in(PC_MEM_WB1), .instruction_in(IR_MEM_WB1), .dataC_in(Z_MEM_WB1), // pipeline in
		.progcounter_out(PC_MEM_WB2), .instruction_out(IR_MEM_WB2), .dataC_out(Z_MEM_WB2));

	wire halt_out;


`ifdef TRACE_PIPELINE
	wire [`WIDTH - 3:0] PC_WB_OUT1;
	wire [`WIDTH - 1:0] IR_WB_OUT1;
	wire [`WIDTH - 3:0] PC_WB_OUT2;
	wire [`WIDTH - 1:0] IR_WB_OUT2;

	PipelineWriteback2Chip PipelineWB2C(.clk(clk), .progcounter_in(PC_WB_OUT1), .instruction_in(IR_WB_OUT1));
`endif
	
	WriteBack WBack(.clk(clk), .progcounter_in(PC_MEM_WB2), .instruction_in(IR_MEM_WB2), .dataC_in(Z_MEM_WB2), // pipeline in
		.addr(Wt_addr), .data(Wt_data), .wr_en(Wt_en), .w_mode(w_mode),	// register
		.Halt(halt_out)
`ifdef TRACE_PIPELINE
		,.instruction_out(IR_WB_OUT1), .progcounter_out(PC_WB_OUT1)
`endif
		);


	always @(halt_out) begin
		halt = halt_out;
	end

`ifdef TRACE_PIPELINE
	always @(posedge clk) begin
		/*$display($time, " IF IR=%h, PC=%h", IR_IF_ID1, PC_IF_ID1);
		$display($time, " ID IR=%h, PC=%h", IR_ID_EXE1, PC_ID_EXE1);
		$display($time, " EXE IR=%h, PC=%h", IR_EXE_MEM1, PC_EXE_MEM1);
		$display($time, " MEM IR=%h, PC=%h", IR_MEM_WB1, PC_MEM_WB1);*/
		$display($time, " %h \t %h \t %h \t %h \t %h", IR_IF_ID1, IR_ID_EXE1, IR_EXE_MEM1, IR_MEM_WB1, IR_WB_OUT1);
	end
`endif

endmodule