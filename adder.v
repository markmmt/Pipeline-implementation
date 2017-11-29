
`timescale 1 ns / 1 ps


module adder (A,B,C);
	
	input wire [31:0] A ,B ;
	output wire [31:0] C ;
	assign C = A+B ;

endmodule
