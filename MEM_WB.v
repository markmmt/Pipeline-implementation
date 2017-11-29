
`timescale 1 ns / 1 ps

module MEM_WB_PipelineReg (clk,ALU_output,readDataFromMemory,rt_or_rd,write_reg,write_back,o_write_reg,o_write_back,o_ALU_output,o_readDataFromMemory,
	o_rt_or_rd); 
	
	input wire clk ;

	input wire [31:0] ALU_output ;
	input wire [31:0] readDataFromMemory ; 
	input wire [4:0] rt_or_rd ;	
	
	// control signals 
	input wire write_reg;
	input wire write_back;
	
	output reg o_write_reg;
	output reg o_write_back;
	output reg [31:0] o_ALU_output,o_readDataFromMemory;
	output reg [4:0] o_rt_or_rd;  
	
	always @ (posedge clk)
		begin
			o_ALU_output<=ALU_output;
			o_readDataFromMemory<=readDataFromMemory;
			o_rt_or_rd<=rt_or_rd;
			o_write_reg<=write_reg;
			o_write_back<=write_reg;
		end	

endmodule
