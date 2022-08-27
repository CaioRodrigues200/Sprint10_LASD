module ULA (input [7:0] SrcA, SrcB, input [2:0] ULActrl, output reg Z, output reg [7:0] ULArslt);

	always @(*) begin 
		case(ULActrl)
			3'b000: ULArslt = SrcA & SrcB;
			3'b001: ULArslt = SrcA | SrcB;
			3'b010: ULArslt = SrcA + SrcB;
			3'b110: ULArslt = SrcA + ~SrcB + 1'b1;
			3'b111: ULArslt = SrcA < SrcB ? 8'b1 : 8'd0;
		endcase
		
		if(ULArslt == 8'd0)
			Z = 1'b1;
		else
			Z = 1'b0;
	end

endmodule	