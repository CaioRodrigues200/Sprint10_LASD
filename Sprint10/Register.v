module register (input [7:0] d_in, input clk , enable, output reg [7:0] d_out);

	always @ (posedge clk) begin
		if(enable == 1)
			d_out = d_in;
	end

endmodule