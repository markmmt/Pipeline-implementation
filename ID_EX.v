
`timescale 1 ns / 1 ps 

// Note : o_anything ----> output 

module ID_EX_PipelineReg (clk,read_data_1,read_data_2,next,immediate_value,ALU_OP,ALU_Src,RegDst,rd_to_RegDstMux,rt_to_RegDstMux,rt_to_fowradingUnit,
	rs_to_fowradingUnit,branch,write_back,mem_read,mem_write,write_reg,o_branch,o_write_back,o_mem_read,o_mem_write,o_write_reg,
	o_immediate_value,next_address,o_rd_to_RegDstMux,o_rt_to_RegDstMux,o_rs_to_fowradingUnit,o_rt_to_fowradingUnit,o_data1,o_data2);
	
	input wire clk ;
	input wire [31:0] read_data_1 ;
	input wire [31:0] read_data_2 ;
	input wire [31:0] next ; // PC+4 comes from IF/ID stage	        
	input wire [31:0] immediate_value ;	
	
	// signals used in Ex stage only ,comes from control unit
	input wire [1:0] ALU_OP	;  // the two signals that decides : add , sub , and ..etc
	input wire ALU_Src ;
	input wire RegDst ;
	
	input wire [4:0] rd_to_RegDstMux ;
	input wire [4:0] rt_to_RegDstMux ;
	input wire [4:0] rt_to_fowradingUnit ;
	input wire [4:0] rs_to_fowradingUnit ; 
	
	// rest of the signals comes from control unit 
	input wire branch ;
	input wire write_back ;	
	input wire mem_read ;
	input wire mem_write ;
	input wire write_reg ; 
	
	output reg o_branch ;
	output reg o_write_back ;	
	output reg o_mem_read ;
	output reg o_mem_write ;
	output reg o_write_reg ; 
	output reg [31:0] o_immediate_value ;
	output reg [31:0] next_address ; 			// PC+4
	output reg [4:0] o_rd_to_RegDstMux ; 		// input to RegDst mux for R-format
	output reg [4:0] o_rt_to_RegDstMux ;		// input for RegDst mux for I-format
	output reg [4:0] o_rs_to_fowradingUnit ;	// input to forwarding unit
	output reg [4:0] o_rt_to_fowradingUnit ;	// input to forwarding unit
	output reg [31:0] o_data1,o_data2 ;
	
	always @ (posedge clk )
		begin
			o_data1<=read_data_1;
			o_data2<=read_data_2;
			o_immediate_value<=immediate_value;
			next_address<=next;
			o_rt_to_RegDstMux<=rt_to_RegDstMux;
			o_rd_to_RegDstMux<=rd_to_RegDstMux;
			o_rs_to_fowradingUnit<=rs_to_fowradingUnit;
			o_rt_to_fowradingUnit<=rt_to_fowradingUnit;
		    o_branch<=branch ;
			o_write_back<=o_write_back ;	
			o_mem_read<=mem_read ;
			o_mem_write<=mem_write ;
			o_write_reg<=write_reg ; 
		end	
											   
endmodule
