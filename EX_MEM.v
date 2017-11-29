
`timescale 1 ns / 1 ps

module EX_MEM_PipelineReg (clk,branch,write_back,mem_read,mem_write,write_reg,ALU_output,readData2,next,rt_or_rd,ALU_zero_flag,o_mem_read,o_mem_write,
	o_write_reg,o_write_back,o_ALU_output,o_ALU_zero_flag,o_branch,o_next,o_readData2,o_rt_or_rd);
	
	input wire clk ;
	
	// control signals coming from control unit
	
	input wire branch ;
	input wire write_back ;	
	input wire mem_read ;
	input wire mem_write ;
	input wire write_reg ; 
	
	input wire [31:0] ALU_output; 
	input wire [31:0] readData2; // 2nd alu input 
	input wire [31:0] next ; // ( PC + 4 ) + imm. shifted by 2 bits 
	input wire [4:0] rt_or_rd ;// depends on the control signal of RegDst whether we will write in "rt" or "rd"
	input wire ALU_zero_flag ; 	// output of the adder 
	
	// output control signals 
	
	output reg o_mem_read;
	output reg o_mem_write;
	output reg o_write_reg ;
	output reg o_write_back ;
	output reg o_branch ;
	
	output reg [31:0] o_next ; 	// (PC+4) + imm. shifted by 2 bits 
	output reg [31:0] o_ALU_output ;
	output reg o_ALU_zero_flag ;
	output reg [31:0] o_readData2;
	output reg [31:0] o_rt_or_rd;
	
	always @ (posedge clk)
		begin 
			o_mem_read<=mem_read;
			o_mem_write<=mem_write;
			o_write_reg<=write_reg;
			o_write_back<=write_back;
			o_branch<=branch;
			o_ALU_output<=ALU_output;
			o_ALU_zero_flag<=ALU_zero_flag;	 
			o_next<=next;
			o_readData2<=readData2;
			o_rt_or_rd<=rt_or_rd;
		end
endmodule
