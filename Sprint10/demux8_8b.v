module demux8_8b (input [71:0] data_in, input [3:0] sel, output reg [7:0] data_out);

	always @ (data_in) begin
		case(sel)
			4'd0 : data_out = 8'd0;
			4'd1 : data_out = data_in[15:8];
			4'd2 : data_out = data_in[23:16];
			4'd3 : data_out = data_in[31:24];
			4'd4 : data_out = data_in[39:32];
			4'd5 : data_out = data_in[47:40];
			4'd6 : data_out = data_in[55:48];
			4'd7 : data_out = data_in[63:56];
			4'd8 : data_out = data_in[71:64];
		endcase
	end

endmodule