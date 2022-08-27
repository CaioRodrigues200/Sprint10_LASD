module EthernetMod(
	 
    input clk, rst,                                    // Clock & Reset
    input [1:0] mode,                                  // Modes: 00 -> Disabled, 01 -> Reading & Saving, 10 -> Generate & send               
    input [7:0] dataRcv,                               // Data receive & Data load
	 input [47:0] macAdress,
    output reg [7:0] dataStore, dataSend, dtSize ,     // Data store , Data send & Data size
	 output reg flag
    );

    parameter IDLE = 4'h0;
    parameter HEARING = 4'h1;
    parameter READINGMAC = 4'h2;
	 parameter READINGSIZE = 4'h3;
	 parameter READINGDATA = 4'h4;
	 parameter VERIFY = 4'h5;
	 parameter SENDING = 4'h6;
	 parameter SENDINGMAC = 4'h7;
	 parameter SENDINGSIZE = 4'h8;
	 parameter SENDINGDATA = 4'h9;
	 
	 parameter MACTARGET = 48'h4A6F8A7FAA8F;
	 parameter DATASIZE  = 8'h08;
	 parameter DATA      = 8'hAB;

    reg [3:0] current_state, next_state;
    reg [3:0] pbleCount, waitClk;                // Preamble counter and Pause
	 reg [2:0] macCount;
    reg [7:0] buffer, dataSize;                  // Module buffer and data size holding
    reg cancelPble, cancelMAC;                   // Protocol abortation flag

    always @(current_state) begin
        case(current_state)
            IDLE:
                begin
						  flag = 0;
						  macCount = 3'h0;
                    pbleCount = 4'h0;
                    cancelPble = 0;
						  cancelMAC = 0;
//						  if(waitClk > 0) begin
//								waitClk = waitClk - 1'd1;
//								next_state <= IDLE;
//						  end
						  if(mode == 2'b01)
                        next_state <= HEARING;
						  else if(mode == 2'b10)
                        next_state <= SENDING;
                end 

            HEARING:
                begin
                    if(mode == 2'b01) begin
                        if(dataRcv == 8'b10101010)
									 pbleCount = pbleCount + 1'd1;
                        else begin
                            cancelPble = 1;
									 flag = 1;
								end

                        if(cancelPble == 1) begin
									
                            next_state = IDLE;
								end 
                        if(pbleCount >= 4'd8) 
                            next_state <= READINGMAC;
                    end
                end

            READINGMAC:
                begin
                    buffer = dataRcv;
						  case(macCount)
								3'd0: begin
									if(buffer == macAdress[7:0])
										macCount = macCount + 1'd1;
									else
										macCount = 3'd7;
								end
								3'd1: begin
									if(buffer == macAdress[15:8])
										macCount = macCount + 1'd1;
									else
										macCount = 3'd7;
								end
								3'd2: begin
									if(buffer == macAdress[23:16])
										macCount = macCount + 1'd1;
									else
										macCount = 3'd7;
								end
								3'd3: begin
									if(buffer == macAdress[31:24])
										macCount = macCount + 1'd1;
									else
										macCount = 3'd7;
								end
								3'd4: begin
									if(buffer == macAdress[39:32])
										macCount = macCount + 1'd1;
									else
										macCount = 3'd7;
								end
								3'd5: begin
									if(buffer == macAdress[47:40])
										macCount = macCount + 1'd1;
									else
										macCount = 3'd7;
								end
								3'd6:
									next_state <= READINGSIZE;
								default:
									next_state <= IDLE;
						  endcase
                end
					 
				READINGSIZE:
					begin
						dataSize = dataRcv;
						buffer   = dataSize;
						next_state <= READINGDATA;
					end
					
				READINGDATA:
					begin
						if(buffer > 0) begin
							buffer = buffer - 1'd1;
							dataStore = dataRcv;
						end
						else 
							next_state <= VERIFY;
					end
					
				VERIFY:
					begin
						next_state <= IDLE;
					end
					
				SENDING:
					begin
						buffer = 8'b10101010;
						dataSend = buffer;
						pbleCount = pbleCount + 1'd1;
						if(pbleCount >= 4'd8)
							next_state <= SENDINGMAC;
					end
					
				SENDINGMAC:
					begin
						  case(macCount)
								3'd0: begin
										dataSend = MACTARGET[7:0];
										macCount = macCount + 1'd1;
								end
								3'd1: begin
										dataSend = MACTARGET[15:7];
										macCount = macCount + 1'd1;
								end
								3'd2: begin
										dataSend = MACTARGET[23:16];
										macCount = macCount + 1'd1;
								end
								3'd3: begin
										dataSend = MACTARGET[31:24];
										macCount = macCount + 1'd1;
								end
								3'd4: begin
										dataSend = MACTARGET[39:32];
										macCount = macCount + 1'd1;
								end
								3'd5: begin
										dataSend = MACTARGET[47:40];
										macCount = macCount + 1'd1;
								end
								3'd6:
									next_state <= SENDINGSIZE;
								default:
									next_state <= IDLE;
						  endcase
					end
					
				SENDINGSIZE:
					begin
						dataSend = DATASIZE;
						next_state <= SENDINGDATA;
					end
					
				SENDINGDATA:
					begin
						dataSend = DATA;
						next_state <= IDLE;
					end
					
        endcase
    end

    always @(posedge clk) begin
        if(rst) begin
           current_state <= IDLE;
		  end
	     else
           current_state <= next_state;
    end

endmodule