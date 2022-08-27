module countM10 (input clock, reset, output reg [3:0] number);

	reg[3:0] count = 4'd0;

	always @ (posedge clock) begin
	
		count <= count + 4'd1;		
		if(count >= 4'd9 || reset == 0)
			count <= 4'd0;
			
		number = count;	
	end

endmodule 