module RegisterFile (input [7:0] wd3, input [3:0] wa3,         	     // Write data & Write adress 
							 input we3, CLK,                  			  // Write enable, Clock & Write link
							 input [3:0] ra1, ra2,                            // Register Adress
                             output [7:0] rd1, rd2,  // Register Data
                             output [71:0] LCD_exit          	        // Exibit registers data
                     );           
							 
	wire [7:0] decod_out;
	wire [71:0] reg_out;
							 
	decoder_octo dcd (.data_in(wa3), .out_port(decod_out));

	register rg1 (.d_in(8'b0), .d_out(reg_out[7:0]),   .enable(we3 & decod_out[0]), .clk(CLK));  // $0
	register rg2 (.d_in(wd3),  .d_out(reg_out[15:8]),  .enable(we3 & decod_out[1]), .clk(CLK));  // $1
	register rg3 (.d_in(wd3),  .d_out(reg_out[23:16]), .enable(we3 & decod_out[2]), .clk(CLK));  // $2
	register rg4 (.d_in(wd3),  .d_out(reg_out[31:24]), .enable(we3 & decod_out[3]), .clk(CLK));  // $3
	register rg5 (.d_in(wd3),  .d_out(reg_out[39:32]), .enable(we3 & decod_out[4]), .clk(CLK));  // $4
	register rg6 (.d_in(wd3),  .d_out(reg_out[47:40]), .enable(we3 & decod_out[5]), .clk(CLK));  // $5
	register rg7 (.d_in(wd3),  .d_out(reg_out[55:48]), .enable(we3 & decod_out[6]), .clk(CLK));  // $6
	register rg8 (.d_in(wd3),  .d_out(reg_out[63:56]), .enable(we3 & decod_out[7]), .clk(CLK));  // $7
	
	register ra (.d_in(wd3), .d_out(reg_out[71:64]),   .enable(we3 & wa3 == 4'h8), .clk(CLK));
	
	demux8_8b demux1 (.data_in(reg_out), .sel(ra1), .data_out(rd1));
	demux8_8b demux2 (.data_in(reg_out), .sel(ra2), .data_out(rd2));
  
   assign LCD_exit = reg_out[71:0];
							 
endmodule