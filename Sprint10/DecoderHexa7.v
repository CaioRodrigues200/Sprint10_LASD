module DecoderHexa7 (input [3:0] num, output reg [0:6] seg7);

	always @(*) begin 
		case(num)
			4'd0: seg7 = ~(7'b1111110);
			4'd1: seg7 = ~(7'b0110000);
			4'd2: seg7 = ~(7'b1101101);
			4'd3: seg7 = ~(7'b1111001);
			4'd4: seg7 = ~(7'b0110011);
			4'd5: seg7 = ~(7'b1011011);
			4'd6: seg7 = ~(7'b1011111);
			4'd7: seg7 = ~(7'b1110000);
			4'd8: seg7 = ~(7'b1111111);
			4'd9: seg7 = ~(7'b1111011);
			4'd10: seg7 = ~(7'b1110111);
			4'd11: seg7 = ~(7'b0011111);
			4'd12: seg7 = ~(7'b1001110);
			4'd13: seg7 = ~(7'b0111101);
			4'd14: seg7 = ~(7'b1001111);
			4'd15: seg7 = ~(7'b1000111);
		
		endcase
	end

endmodule