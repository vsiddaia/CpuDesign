`ifndef INCLUDE_PARAMETERS
	`include "Parameters.v"
`endif

//32 bit registers - 32 Nos.

module RegisterFile(
	input wire clk,    // Clock
	input wire [`REG_ADDR_LEN - 1:0] regA_addr,
	input wire [`REG_ADDR_LEN - 1:0] regB_addr,
	output wire [`WIDTH - 1:0] dataA,
	output wire [`WIDTH - 1:0] dataB,
	output reg st_A,	// output strobe
	output reg st_B,	// output strobe
	input wire r_en_A,
	input wire r_en_B,
	input wire [`REG_ADDR_LEN - 1:0] regC_addr,
	input wire [`WIDTH -1 :0] dataC,
	input wire w_en,
	input wire [1:0] w_mode, //w_mode: 0-word, 1-halfword, 2-byte
	input wire halt
);

	reg [`WIDTH - 1:0] regFile [`NUM_REGS - 1:0];

//	assign dataA = (st_A == 1) ? ((regA_addr!=0) ? regFile[regA_addr]:0) : 32'bz;
//	assign dataB = (st_B == 1) ? ((regB_addr!=0) ? regFile[regB_addr]:0) : 32'bz;

	//assign dataA = (r_en_A == 1) ? regFile[regA_addr] : 32'bz;
	//assign dataB = (r_en_B == 1) ? regFile[regB_addr] : 32'bz;
    assign dataA = regFile[regA_addr];
    assign dataB = regFile[regB_addr];

	//always @(posedge clk) begin
	always @(w_en, dataC) begin
		if (w_en) begin
			//krc
			//if(regC_addr != 0) begin
			    $display("Writing Register with data: %x\n", dataC);
				case(w_mode) 
					0:	regFile[regC_addr] <= dataC;
					1:	regFile[regC_addr] <= {16'b0, dataC[15:0]};
					2:	regFile[regC_addr] <= {24'b0, dataC[7:0]};
				endcase
				
			//end
		end
	end

	always @(negedge clk) begin
			st_A = 0;
		if (r_en_A) begin
			// if(regA_addr != 0)
			//dataA = regFile[regA_addr];
			// else 
			// 	dataA = 'd0;
			st_A = 1;
			//st_A = 0;
		end
	end

	always @(negedge clk) begin
			st_B = 0;
		if (r_en_B) begin
			// if(regB_addr != 0)
			 //	dataB = regFile[regB_addr];
			// else 
			// 	dataB = 'd0;
			st_B = 1;
			//st_B = 0;
		end
	end

`ifdef TRACE_REG
	integer i,j,k;
	//always @(posedge clk) begin
	always @(dataC, halt) begin 
		k=0;
		for(i=0;i<32;i=i+4)
		begin
			//$write("R[%d] = ", k);
			for(j=0;j<4;j=j+1)
				begin
					$write("R[%02d] = %h\t", k, regFile[k]);
					k = k + 1;
				end
			$write("\n");
		end
	end
`endif

endmodule