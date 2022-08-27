module frequencyDivider (input clock50M, input [25:0] divider, output reg clock1);

	reg[25:0] count = 26'd0; // 26 bits = 67.108.864 in decimal

	always @ (posedge clock50M) begin
		count <= count + 26'd1;
		clock1 = (count > (divider/2)) ? 1'b0 : 1'b1;

		if(count > (divider-1))
			count <= 26'd0;
	end

endmodule
