module decoder_octo (input [2:0] data_in, output reg [7:0] out_port);
	
	always @ (data_in) begin
		case(data_in)
			3'd0: out_port = 8'b00000001;
			3'd1: out_port = 8'b00000010;
			3'd2: out_port = 8'b00000100;
			3'd3: out_port = 8'b00001000;
			3'd4: out_port = 8'b00010000;
			3'd5: out_port = 8'b00100000;
			3'd6: out_port = 8'b01000000;
			3'd7: out_port = 8'b10000000;
		endcase
	end

endmodule