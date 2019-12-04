`timescale 1ns/100ps
// Trace
`define TRACE_REG
`define TRACE_PIPELINE
`define TRACE_MEM
`include "CpuTop.v"

module tb_CpuTop ();

	reg clk;
	reg rst_n;
	reg print;
	reg count;
	wire halt;

	always
		#5 clk = ~clk;

	CpuTop CpuTop(.clk(clk), .rst_n(rst_n), .halt(halt), .Print(print));

	initial begin
		clk = 0;
		count = 0;
		$display("Starting Sim");
		print = 1;
	#5	rst_n = 0;
	#5	rst_n = 1;	// negedge to reset
	end

	always @(posedge clk, halt) begin
		if(halt == 1 && count != 3) begin
		  count = count + 1;
		end else if(count == 3) begin
		  $display($time ," End of sim");
`ifdef TRACE_MEM
		  print = 1;
`endif
		   $stop;
		end 
	end

endmodule