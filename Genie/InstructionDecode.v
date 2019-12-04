`ifndef INCLUDE_PARAMETERS
	`include "Parameters.v"
`endif

`ifndef INCLUDE_INSTRUCTION_SET
	`include "InstructionSet.v"
`endif

module InstructionDecode(
	input wire clk,    // Clock
	input wire rst_n,  // Asynchronous reset active low
	
	// pipeline in
	input wire [`WIDTH - 1:0] instruction_in,
	input wire [`WIDTH - 3:0] progcounter_in,
	
	// pipeline out
	output wire [`WIDTH - 1:0] instruction_out,
	output wire [`WIDTH - 3:0] progcounter_out,
	output wire [`WIDTH - 1:0] dataA,
	output wire [`WIDTH - 1:0] dataB,
	
	
	// Reg in/out
	output reg [`REG_ADDR_LEN - 1:0] reg_src1_addr,
	input wire [`WIDTH - 1:0] reg_src1_data,
	output reg reg_src1_en,
	input wire reg_src1_st,
	output reg [`REG_ADDR_LEN - 1:0] reg_src2_addr,
	input wire [`WIDTH - 1:0] reg_src2_data,
	output reg reg_src2_en,
	input wire reg_src2_st,

	input wire IsStall,
	input wire IsFlush
);
	
	wire [5:0] opcode;
	wire [4:0] reg_dest;
	wire [4:0] reg_src1;
	wire [4:0] reg_src2;
	wire [4:0] shamt;
	wire [15:0] imm_val;
	wire [25:0] target_addr;

	reg [`WIDTH-1:0] dataA_reg;
	reg [`WIDTH-1:0] dataB_reg;
	reg [1:0] op_type;
	

	assign opcode = instruction_in[31:26];
	assign reg_dest = instruction_in[25:21];
	assign reg_src1 = instruction_in[20:16];
	assign reg_src2 = instruction_in[15:11];
	assign shamt = instruction_in[10:6];
	assign imm_val = instruction_in[15:0];
	assign target_addr = instruction_in[25:0];

	assign instruction_out = (IsStall === 1)?instruction_out:((IsFlush === 1)?`NOP:instruction_in);
	assign progcounter_out = (IsStall === 1)?progcounter_out:((IsFlush === 1)?`NOP:progcounter_in);
	//assign dataA = (op_type == 2'b01)? reg_src1_data : target_addr;
	//assign dataB = (op_type == 2'b01)? reg_src2_data : sext16(imm_val);
    assign dataA = dataA_reg;
    assign dataB = dataB_reg;
  
      always @(reg_src1_st, reg_src2_st) begin  
//    always @(posedge clk, negedge rst_n) begin
//      always @(instruction_in) begin
        if(rst_n) begin
            casex(op_type)
                2'b00: begin
                    dataA_reg <= 32'h00000000;
                    dataB_reg <= 32'h00000000;
                end
                2'b01: begin
                    dataA_reg <= reg_src1_data;
                    dataB_reg <= reg_src2_data;
                end
                2'b1x: begin
                     dataA_reg <= target_addr;
                     dataB_reg <= sext16(imm_val);
                end
            endcase
 //       end else begin
           
        end
    end

	/*always @(negedge clk) begin
		if(IsStall) begin
			
		end else if(IsFlush) begin
			//instruction_out = `NOP;
		end else begin
			//instruction_out = instruction_in;
			//progcounter_out = progcounter_in;
		end
	end

*/


	always @(instruction_out or progcounter_out) begin
		reg_src1_en = 0;
		reg_src2_en = 0;
		op_type = 2'b00;
		case(opcode)
			`R_TYPE: begin
			    op_type = 2'b01;
				reg_src1_addr <= reg_src1;
				reg_src1_en <= 1;
				reg_src2_addr <= reg_src2;
				reg_src2_en <= 1;
			end
			`I_TYPE, `LW, `LH, `LD: begin
			    op_type = 2'b10;
				reg_src1_addr <= reg_src1;
				reg_src1_en <= 1;
				//dataB <= sext16(imm_val);
			end
			`Branch: begin
			    op_type = 2'b11;
				reg_src1_addr <= reg_dest;
				reg_src1_en <= 1;
				//dataB <= sext16(imm_val);
			end
			`SD, `SH, `SW: begin
			    op_type = 2'b01;
				reg_src1_addr <= reg_dest;
				reg_src1_en <= 1;
				reg_src2_addr <= reg_src1;
				reg_src2_en <= 1;
			end
			`J_TYPE: begin
			     op_type = 2'b11;
				//dataA <= target_addr;
			end
			`NOP:	begin
				
			end
			`HALT:	begin
				
			end
		endcase
	end

	always @(posedge reg_src1_st) begin
		//dataA = reg_src1_data;
		//reg_src1_en = 0;
	end

	always @(posedge reg_src2_st) begin
		//dataB = reg_src2_data;
		//reg_src2_en = 0;
	end

	function [`WIDTH-1:0] sext16(
	input [15:0] d_in);
	begin
		sext16[`WIDTH-1:0] = {{(`WIDTH-16){d_in[15]}}, d_in};
	end
	endfunction
endmodule