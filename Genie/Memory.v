`ifndef INCLUDE_PARAMETERS
	`include "Parameters.v"
`endif

`ifndef INCLUDE_DATA_MEMORY
	`include "DataMemory.v"
`endif

`ifndef INCLUDE_INSTRUCTION_SET
	`include "InstructionSet.v"
`endif

module DataMemoryCntrl(
	input wire clk,    	// Clock
	input wire rst_n,		// reset

	// pipeline inputs
	input wire [`WIDTH - 1:0] instruction_in,
	input wire [`WIDTH - 3:0] progcounter_in,
	input wire [`WIDTH - 1:0] dataC_in,
	input wire [`WIDTH - 1:0] datamem_addr,

	// pipeline outputs
	output wire [`WIDTH - 1:0] instruction_out,
	output wire [`WIDTH - 3:0] progcounter_out,
	output wire [`WIDTH - 1:0] dataC_out

	// mem trace
`ifdef TRACE_MEM
	,input wire Print
`endif
);

	wire [5:0] opcode;
	assign opcode = instruction_in[31:26];

	reg [`WIDTH - 1:0] addr;
	wire [`WIDTH - 1:0] data;
	reg [`WIDTH - 1:0] data_reg;
	reg data_valid;
	reg wr;
	reg rd;
	wire rd_st;
	reg [1:0] mode;

	reg [`WIDTH - 1:0] dataC_reg;

	assign data = (data_valid == 1)? data_reg : 32'hZ;
	assign progcounter_out = progcounter_in;
	assign instruction_out = instruction_in;
	//krc
	assign dataC_out = dataC_in;
	//krc: assign dataC_out = (rd_st == 1)? data : dataC_in;

	DataMemory DataMem(.rst_n(rst_n), .dmem_addr(addr), .dmem_data(data), .wr(wr), .rd(rd), .rd_st(rd_st), .data_mode(mode)
`ifdef TRACE_MEM
	, .Print(Print)
`endif
	);

	always @(instruction_in or progcounter_in) begin
		rd = 0;
		wr = 0;
		data_valid = 0;
		case(opcode)
			`LW: begin
				mode = 0;
				ReadMem();
			end
			`LH: begin
				mode = 1;
				ReadMem();
			end
			`LD: begin
				mode = 2;
				ReadMem();
			end
			`SW:begin
				mode = 0;
				WriteMem();
			end
			`SH: begin
				mode = 1;
				WriteMem();
			end
			`SD: begin
				mode = 2;
				WriteMem();
			end
		endcase
	end

	// always @(posedge rd_st) begin
	// 	dataC_reg = data;
	// end

	task ReadMem();
		begin
			addr = datamem_addr;
			rd = 1;
		end
	endtask

	task WriteMem();
		begin
			data_reg = dataC_in;
			data_valid = 1;
			addr = datamem_addr;
			wr = 1;
		end
	endtask


endmodule