`ifndef INCLUDE_PARAMETERS
	`include "Parameters.v"
`endif
// Intermediate Register between ID and MEM
module PipelineIdecode2Exec(
	input clk,    // Clock
	// pipeline in
	input wire [`WIDTH - 1:0] instruction_in,
	input wire [`WIDTH - 3:0] progcounter_in,
	input wire [`WIDTH - 1:0] dataA_in,
	input wire [`WIDTH - 1:0] dataB_in,
	// pipeline out
	output reg [`WIDTH - 1:0] instruction_out,
	output reg [`WIDTH - 3:0] progcounter_out,
	output reg [`WIDTH - 1:0] dataA_out,
	output reg [`WIDTH - 1:0] dataB_out
);

    //assign dataA_out = dataA_in;
    //assign dataB_out = dataB_in;

	always @(posedge clk) begin
		instruction_out <= instruction_in;
		progcounter_out <= progcounter_in;
		dataA_out <= dataA_in;
		dataB_out <= dataB_in;
	end

endmodule