`ifndef INCLUDE_PARAMETERS
	`include "Parameters.v"
`endif

// Data Memory
module InstructionMemory(
	input wire rst_n,
	input wire [`WIDTH - 3:0] addr, // For Aligned Memory Access, last 2 bits are always 0
	output reg [`WIDTH - 1:0] data
	);

	reg [7:0] load_memory [`IMEM_LEN - 1:0];

	// load instructions on reset
	always @(negedge rst_n) begin
		$display("Begin Reading from File to Memory\n");
		$readmemh("LoadMemory.hex", load_memory, 0, 71);									//For reading hex values from test files
		$display("Done Reading from File to Memory\n");
	end

	reg [`WIDTH - 1:0] extended_addr;

	always @(addr, rst_n) begin
	   if(rst_n == 1'b1) begin
		// extend last 2 bits of address
		  extended_addr <= {addr, 1'b0, 1'b0};
		  data <= {load_memory[extended_addr], load_memory[extended_addr+1], load_memory[extended_addr+2], load_memory[extended_addr+3]};
	   end else begin
	       data <= 32'h00000000;
	   end
	end
endmodule