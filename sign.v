
`timescale 1 ns / 1 ps
			  
module sign_extend (immediate,address);	
	
	input wire [15:0] immediate ;
	output reg [31:0] address ;
	always @ (immediate)
	begin
		if (immediate[15]==0)
			begin address <={{16{1'b0}},immediate}; end
		else if (immediate[15]==1)
			begin address <={{16{1'b1}},immediate}; end
		else
			begin address<=32'bx; end
	end

endmodule 


module tb_sign_extend ();

	reg [15:0] immediate ;
	wire [31:0] address ;

sign_extend mysignextend (immediate,address) ;

initial 
	begin
	$monitor ($time ,, "%b,%b",immediate,address);
	#5
	immediate=-4;
	#5
	immediate=5;
end

endmodule
