`include "Parameters.v"
module PipelineWriteback2Chip(
	input clk,    // Clock
	// pipeline inputs
	input wire [`WIDTH - 1:0] instruction_in,
	input wire [`WIDTH - 3:0] progcounter_in,
	// pipeline outputs
	output reg [`WIDTH - 1:0] instruction_out,
	output reg [`WIDTH - 3:0] progcounter_out
);
	
	always @(posedge clk) begin
		instruction_out <= instruction_in;
		progcounter_out <= progcounter_in;
	end

endmodule