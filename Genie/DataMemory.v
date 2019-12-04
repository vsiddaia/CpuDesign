`ifndef INCLUDE_PARAMETERS
	`include "Parameters.v"
`endif

//Data Memory
module DataMemory(
	input wire rst_n,
	input wire [`WIDTH - 1:0] dmem_addr,
	inout wire [`WIDTH - 1:0] dmem_data,
	input wire wr,
	input wire rd,
	output reg rd_st,
	input wire [1:0] data_mode //data_mode: 0-word, 1-halfword, 2-byte
	// mem trace
`ifdef TRACE_MEM
	,input wire Print
`endif
);

	reg [7:0] dmem [0:`WIDTH - 1];
	reg [`WIDTH - 1:0] data_r;

	assign dmem_data = (rd == 1)? data_r : 32'bZ;

	always @(posedge wr) begin
		case (data_mode)
			0: begin // word
				{dmem[dmem_addr], dmem[dmem_addr+1], dmem[dmem_addr+2], dmem[dmem_addr+3]} = dmem_data;
			end
			1: begin // half-word
				{dmem[dmem_addr], dmem[dmem_addr+1]} = dmem_data[15:0];
			end
			2: begin // byte
				dmem[dmem_addr] = dmem_data[7:0];
			end
		endcase
	end

	always @(posedge rd) begin
		rd_st = 0;
		case (data_mode)
			0: begin // word
				data_r = {dmem[dmem_addr], dmem[dmem_addr+1], dmem[dmem_addr+2], dmem[dmem_addr+3]};
				rd_st = 1;
			end
			1: begin // half-word
				data_r = {16'b0 ,dmem[dmem_addr], dmem[dmem_addr+1]};
				rd_st = 1;
			end
			2: begin // byte
				data_r = {24'b0, dmem[dmem_addr]};
				rd_st = 1;
			end
		endcase
	end

	always @(negedge rst_n) begin
		$readmemh("dmem_data.hex", dmem, 0, 20);
	end

`ifdef TRACE_MEM
	always @(posedge Print) begin
		$writememh("data_out.hex", dmem, 0, 20);
	end
`endif
endmodule