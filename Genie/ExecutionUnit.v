`ifndef INCLUDE_PARAMETERS
	`include "Parameters.v"
`endif

`ifndef INCLUDE_INSTRUCTION_SET
	`include "InstructionSet.v"
`endif

module InstructionExecution(
	input wire clk,    // Clock
	
	// pipeline inputs
	input wire [`WIDTH - 1:0] instruction_in,
	input wire [`WIDTH - 3:0] progcounter_in,
	input wire [`WIDTH - 1:0] dataA,
	input wire [`WIDTH - 1:0] dataB,

	// pipeline outputs
	output wire [`WIDTH - 1:0] instruction_out,
	output wire [`WIDTH - 3:0] progcounter_out,
	output reg [`WIDTH - 1:0] dataC,
	output reg [`WIDTH - 1:0] addr,

	input wire IsStall,
	output wire IsBranch,
	output reg [`WIDTH - 3:0] BranchAddr,
	
	//conditions
	output reg FC,	//Carry Flag
	output reg FV,	//Overflow flag
	output reg FZ,	//Zero Flag
	output reg FN	//Negative Flag
);

	wire [5:0] OpCode;
	wire [4:0] Shamt;
	wire [15:0] Imm;
	reg IsBranch_reg;
	
	assign OpCode = instruction_in[31:26];
	assign Shamt = instruction_in[10:6];
	assign Imm = instruction_in[15:0];
	//assign Tgt = instruction_in[25:0];

	assign instruction_out = (IsStall === 1)?instruction_out:instruction_in;
	assign progcounter_out = (IsStall === 1)?progcounter_out:progcounter_in;
	assign IsBranch = (IsBranch_reg == 1)?1:0; 

	reg [`WIDTH:0] res;

	always @(instruction_in) begin
		if (IsStall) begin
			
		end
		else begin
			IsBranch_reg = 0;
			//instruction_out = instruction_in;
			//progcounter_out = progcounter_in;
			case(OpCode)
				`ADD, `ADDI: 	begin
					res = $unsigned(dataA + dataB);
					dataC = res;
					setc(dataA, dataB, res, 0);
				end
				`SUB:	begin
					res = dataA - dataB;
					dataC = res;
					setc(dataA, dataB, res, 1);
				end
				`AND, `ANDI:	begin
					res = dataA & dataB;
					dataC = res;
					FZ = ~|res;
				end
				`OR, `ORI:	begin
					res = dataA | dataB;
					dataC = res;
					FZ = ~|res;
				end
				`XOR:	begin
					res = dataA ^ dataB;
					dataC = res;
					FZ = ~|res;
				end
				`SLL:	begin
					res = dataA << Shamt;
					dataC = res;
					FC = dataA[`WIDTH - Shamt - 1];
					FZ = ~|res;
				end
				`SRL: begin
					res = dataA >> Shamt;
					dataC = res;
					FC = dataA[Shamt];
					FZ = ~|res;
				end
				`SRA: begin
					res = dataA >> 1;
					res = {dataA[`WIDTH-1], res[15:0]};
					dataC = res;
					FC = dataA[0];
					FZ = ~|res;
				end
				`SLLV: begin
					res = dataA << dataB;
					dataC = res;
					FC = dataA[`WIDTH - dataB - 1];
					FZ = ~|res;
				end
				`SRLV: begin
					res = dataA >> dataB;
					dataC = res;
					FC = dataA[dataB];
					FZ = ~|res;
				end
				`LUI: begin
					dataC = Imm << 16;
				end
				`LDI: begin
					dataC = Imm;
				end
				`LW, `LH, `LD: begin 
					addr = dataA + dataB;
				end

				`SW, `SH, `SD: begin
					addr = dataB + sext16(Imm);
					dataC = dataA;
				end

				// Branches
				`BEQ: begin
					if(dataA == 0)
						BranchTaken(progcounter_in + $signed(dataB));
				end
				`BNE: begin
					if(dataA != 0)
						BranchTaken(progcounter_in + $signed(dataB));
				end
				`BGTZ: begin
					if($signed(dataA) > 0)
						BranchTaken(progcounter_in + $signed(dataB));
				end
				`BLTZ: begin
					if($signed(dataA) < 0)
						BranchTaken(progcounter_in + $signed(dataB));
				end
				`BLEZ: begin
					if($signed(dataA) <= 0)
						BranchTaken(progcounter_in + $signed(dataB));
				end
				`BGEZ: begin
					if($signed(dataA) >= 0)
						BranchTaken(progcounter_in + $signed(dataB));
				end

				//J Type
				`J:	begin
					BranchTaken(dataA);
				end
				`JAL: begin
					BranchTaken(dataA);
					dataC = dataA;
				end
				`JR: begin
					BranchTaken($signed(progcounter_in + dataB));
				end
				`JALR: begin
					dataC = dataA + dataB;
					BranchTaken(dataC);
				end

				`NOP, `HALT: begin
					
				end
				default: begin
					if(OpCode !== 6'bxxxxxx)
						$display("Unknown OpCode");
				end
			endcase
		end
	end

	task BranchTaken(input [`WIDTH-1:0] addr);
		begin
			IsBranch_reg = 1;
			BranchAddr = addr;
		end
	endtask

	task setc(
		input [`WIDTH-1:0] op1, op2,
		input [`WIDTH:0] res,
		input subt);
		begin
			FC = res[`WIDTH];
			FZ = ~|res;
			FN = res[`WIDTH-1];
			FV = ( res[`WIDTH-1] & op1[`WIDTH-1] & ~(subt ^ op2[`WIDTH-1])) | (~res[`WIDTH-1] & op1[`WIDTH-1] & (subt ^ op2[`WIDTH-1]));
		end
	endtask

	function [`WIDTH-1:0] sext16(
		input [15:0] d_in);
		begin
			sext16[`WIDTH-1:0] = {{(`WIDTH-16){d_in[15]}}, d_in};
		end
	endfunction

endmodule