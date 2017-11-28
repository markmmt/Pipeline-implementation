
`timescale 1 ns / 1 ps

module IF_ID_PipelineReg (hold,clk,input_instruction,input_next_address,output_instruction,output_next_address);
	input wire [31:0] input_instruction ;	
	input wire clk ;
	input wire [31:0] input_next_address ;
	input wire hold ; // output of hazard detection unit 
	output reg [31:0] output_instruction ;
	output reg [31:0] output_next_address ; 
	always @ (posedge clk)
		begin
			if (hold==0)
				begin
					output_instruction<=input_instruction;
					output_next_address<=input_next_address;
				end
			else
				begin
					output_instruction<=output_instruction;
					output_next_address<=output_next_address;	
				end
		end	
endmodule

module tb_IF_ID_PipelineReg ();
	reg [31:0] input_instruction ;
	reg [31:0] input_next_address ;
	reg hold ;	
	reg clk ;
	wire [31:0]	output_instruction ;
	wire [31:0] output_next_address ;
	
	IF_ID_PipelineReg my_IF_ID (hold,clk,input_instruction,input_next_address,output_instruction,output_next_address);
	
	initial
		begin 
			clk=0;
			$monitor ($time ,,"%b ,instruction = %b,PC+4 = %b",clk,output_instruction,output_next_address);	
			#4
			input_instruction<=8;
			input_next_address<=100;
			hold<=0;
			#5
			input_instruction<=7;
			input_next_address=500;
			hold<=0;
		end	
	always
		begin
			#5
			clk=~clk;
		end	
endmodule	