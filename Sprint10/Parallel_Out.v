module Parallel_OUT (input we, clk, input[7:0] RegData, Address, output wren, output reg[7:0] DataOut);

	wire fioA, fioB;
	
	assign fioA = (Address == 8'hff) ? 1 : 0;
	assign fioB = we & fioA;
	assign wren = we & ~(fioA);
	
	always @ (posedge clk) begin
		if(fioB == 1)
			DataOut = RegData;
	end

endmodule
