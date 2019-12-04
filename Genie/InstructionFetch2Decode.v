`ifndef INCLUDE_PARAMETERS
	`include "Parameters.v"
`endif

module PipelineIfetch2Idecode(
	input clk,    // Clock
	input [`WIDTH - 3:0] progcounter_in,
	input [`WIDTH - 1:0] instruction_in,
	output reg [`WIDTH - 3:0] progcounter_out,
	output reg [`WIDTH - 1:0] instruction_out	
);
	always @(posedge clk) begin
		progcounter_out = progcounter_in;
		instruction_out = instruction_in;
	end

endmodule