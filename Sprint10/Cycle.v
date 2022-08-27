module Cycle (input clock, output reg [0:6] seg7);

	reg [2:0] count = 3'd0;

	always @(posedge clock) begin 
		
		count <= count + 3'd1;
		if(count >= 3'd5)
			count <= 3'd0;
		
		case(count)
			3'b000: seg7 = ~(7'b1000000);
			3'b001: seg7 = ~(7'b0100000);
			3'b010: seg7 = ~(7'b0010000);
			3'b011: seg7 = ~(7'b0001000);
			3'b100: seg7 = ~(7'b0000100);
			3'b101: seg7 = ~(7'b0000010);
		endcase
	end

endmodule 