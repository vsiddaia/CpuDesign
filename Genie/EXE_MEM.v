`ifndef INCLUDE_PARAMETERS
	`include "Parameters.v"
`endif

module PipelineIExec2Memory(
	input clk,    // Clock
	
	// pipeline inputs
	input wire [`WIDTH - 1:0] instruction_in,
	input wire [`WIDTH - 3:0] progcounter_in,
	input wire [`WIDTH - 1:0] dataC_in,
	input wire [`WIDTH - 1:0] addr_in,
	
	// pipeline outputs
	output reg [`WIDTH - 1:0] instruction_out,
	output reg [`WIDTH - 3:0] progcounter_out,
	output reg [`WIDTH - 1:0] dataC_out,
	output reg [`WIDTH - 1:0] addr_out
);

	always @(posedge clk) begin 
		instruction_out <= instruction_in;
		progcounter_out <= progcounter_in;
		dataC_out <= dataC_in;
		addr_out <= addr_in;
	end

endmodule