
`timescale 1 ns / 1 ps

module SLL (A,B);

	input wire [31:0] A ; 
	output wire [31:0] B ;
	assign B = A<<2 ;
	
endmodule

module tb_SLL ();
	
	reg [31:0] A ;
	wire [31:0] B ;
	
SLL mysll (A,B);	
initial
	begin
		$monitor("%b,%b",A,B);
		#5
		A<=5;
	end	
	
endmodule 	
	