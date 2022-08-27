module ControlUnit(
  input [5:0] OP, Funct,
  output reg RegWrite, RegDst, ULASrc, Branch, MemWrite, MemtoReg, Jump, Link, MemtoPC, Ethernet,
  output reg [2:0] ULAControl
	);
  
  always @ (*) begin
		Branch = 0;
		MemWrite = 0;
		MemtoReg = 0;
		Jump = 0;
		Ethernet = 0;
  
  
		// Type R instruction
		if(OP == 0 && Funct != 6'b001000) begin
			RegWrite = 1;
			RegDst = 1;
			ULASrc = 0;
			
			case(Funct)
			  6'b100000: ULAControl = 3'b010;
			  6'b100010: ULAControl = 3'b110;
			  6'b100100: ULAControl = 3'b000; 
			  6'b100101: ULAControl = 3'b001;
			  6'b101010: ULAControl = 3'b111;
			endcase
		end
		
		
		// Type I and J instructions
		else begin
			RegDst = 0;
			Link = 0;
			MemtoPC = 0;
		
			case(OP)
				6'b100011: begin
								 RegWrite = 1;
								 ULASrc = 1;
								 ULAControl = 3'b010;
								 MemtoReg = 1;
							  end		
				6'b101011: begin
								 RegWrite = 0;
								 ULASrc = 1;
								 ULAControl = 3'b010;
								 MemWrite = 1;
							  end
				6'b000100: begin
								 RegWrite = 0;
								 ULASrc = 0;
								 ULAControl = 3'b110;
								 Branch = 1;
							  end
				6'b001000: begin
								 RegWrite = 1;
								 ULASrc = 1;
								 ULAControl = 3'b010;
							  end
				6'b000010: begin
								 RegWrite = 0;
								 Jump = 1;
							  end
			    6'b000011: begin  // JAL (falta simular)
								 Link = 1;
								 Jump = 1;	
								 RegWrite = 1;
							  end
			    6'b000000: begin  // JR (falta simular)
								 MemtoPC = 1;
								 RegWrite = 1;
								 ULASrc = 0;
								 ULAControl = 3'b010;
								 MemtoReg = 0;
								 Jump = 1;
								end
				 6'b100000: begin  // Ethernet
								 Ethernet = 1;
								 RegWrite = 1;
								 ULASrc = 0;
								 ULAControl = 3'b010;
								 MemtoReg = 0;
								 Jump = 1;
							  end
				default:   begin
								 RegWrite = 0;
								 ULASrc = 0;
								 ULAControl = 3'b000;
								 Jump = 1;
							  end
			endcase
		end
		
  end
  
endmodule