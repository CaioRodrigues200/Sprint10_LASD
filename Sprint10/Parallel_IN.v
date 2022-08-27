module Parallel_IN (input[7:0] MemData, Address, DataIn, output[7:0] RegData);

	assign RegData = (Address == 8'hff) ? DataIn : MemData;

endmodule
