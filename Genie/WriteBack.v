`ifndef INCLUDE_PARAMETERS
	`include "Parameters.v"
`endif

`ifndef INCLUDE_INSTRUCTION_SET
	`include "InstructionSet.v"
`endif

module WriteBack(
	input clk,    // Clock
	
	// pipeline in
	input wire [`WIDTH - 1:0] instruction_in,
	input wire [`WIDTH - 3:0] progcounter_in,
	input wire [`WIDTH - 1:0] dataC_in,

	// processor output
	output reg Halt,

`ifdef TRACE_PIPELINE
	// debug output
	output wire [`WIDTH - 1:0] instruction_out,
	output wire [`WIDTH - 3:0] progcounter_out,
`endif

	// reg
	output reg [`REG_ADDR_LEN - 1:0] addr,		
	output reg [`WIDTH - 1:0] data,
	output reg wr_en,
	output reg [1:0] w_mode //w_mode: 0-word, 1-halfword, 2-byte
);

	wire [5:0] opcode;
	wire [4:0] reg_dst;

	assign opcode = instruction_in[31:26];
	assign reg_dst = instruction_in[25:21];

`ifdef TRACE_PIPELINE
	assign instruction_out = instruction_in;
	assign progcounter_out = progcounter_in;
`endif

	always @(instruction_in) begin
		Halt = 0;
		w_mode = 0;
		wr_en = 0;
		case(opcode)
			`LW: begin
				//addr = reg_dst;
				//data = dataC_in;
				WriteReg(reg_dst, dataC_in, 0);
			end
			`LH: begin
				//w_mode = 1;
				//addr = reg_dst;
				//data = dataC_in;
				WriteReg(reg_dst, dataC_in, 1);
			end
			`LD: begin
				//w_mode = 1;
				//addr = reg_dst;
				//data = dataC_in;
				WriteReg(reg_dst, dataC_in, 1);
			end
			`R_TYPE, `I_TYPE: begin
				//addr = reg_dst;
				//data = dataC_in;
				WriteReg(reg_dst, dataC_in, 0);
			end
			`JAL, `JALR: begin
				//addr = 31;
				//data = dataC_in;
				WriteReg(reg_dst, dataC_in, 0);
			end
			//`HALT: Halt = 1;
		endcase
	end

	always @(posedge clk) begin
		if(opcode == `HALT)
			Halt = 1;
	end

	task WriteReg(input [`REG_ADDR_LEN - 1:0] Addr_in,
		input [`WIDTH - 1:0] Data_in,
		input [1:0] w_mode_in);
		begin
			w_mode = w_mode_in;
			data = Data_in;
			addr = Addr_in;
			wr_en = 1;
		end
	endtask

endmodule