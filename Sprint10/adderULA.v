module adderULA (input [17:0] sw, output reg [17:0] ledr);

always @(*) begin 
	if (sw[17:16] == 2'b00)       // add
		ledr[3:0] = sw[3:0] + sw[7:4];
	else if (sw[17:16] == 2'b01)  // sub
		ledr[3:0] = sw[3:0] - sw[7:4];
	else if (sw[17:16] == 2'b10)  // AND 
		ledr[3:0] = sw[3:0] & sw[7:4];
	else if (sw[17:16] == 2'b11)  // OR
		ledr[3:0] = sw[3:0] | sw[7:4];
end

endmodule	