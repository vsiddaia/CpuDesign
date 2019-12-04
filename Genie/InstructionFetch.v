`ifndef INCLUDE_PARAMETERS
	`include "Parameters.v"
`endif

`ifndef INCLUDE_INSTRUCTION_MEMORY
	`include "InstructionMemory.v"
`endif

module InstructionFetch(
	input wire clk,    	// Clock
	input wire rst_n,
	
	// pipeline output
	output wire [`WIDTH - 3:0] progcounter, // Program Counter
	output wire [`WIDTH - 1:0] instruction_reg, // instruction

	input wire IsStall,
	input wire IsBranch,
	input wire [`WIDTH - 3:0] BranchAddr
	);

	reg [`WIDTH - 3:0] progcounter_reg;	
	wire [`WIDTH - 1:0] Ins_in;
	//reg [`WIDTH - 1:0] Ins_reg;
	InstructionMemory imemory(.rst_n(rst_n), .data(Ins_in), .addr(progcounter));

	assign progcounter = (IsBranch === 1)? BranchAddr : progcounter_reg;
	assign instruction_reg = (IsBranch === 1)? 32'b0 : Ins_in;

	always @(negedge rst_n) begin
		progcounter_reg = 0;
		//instruction_reg = Ins_in;
	end

	always @(posedge clk) begin
		if(IsStall === 1) begin
			 
		end else if(IsBranch === 1) begin
			progcounter_reg = BranchAddr;
		//	instruction_reg = Ins_in;
		end else begin
			progcounter_reg = progcounter_reg + 1;
		//	instruction_reg = Ins_in;
		end
	end
endmodule