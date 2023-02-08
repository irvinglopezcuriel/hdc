module HLSM(output RE, output ReadAddr,output CountResetA, output CountResetB, input clk);


int D = 128; //Our dimension size variable, make sure everywhere matches

parameter INIT = 0,
			 COMPARE = 1,
			 RESULT = 2,
			 DONE = 3;
			 
logic [3:0] cur_state;

assign done = cur_state == DONE ? 1:0;


always_ff @(posedge clk)begin
	cur_state <= INIT;
	end
	
	always_ff @(posedge clk)begin
		
		case(cur_state)
		
		INIT : begin
			ReadAddr = 0;
			CountResetA = 1;
			CountResetB = 1;
			
			done = 0;
			
			if(RE == 1) next_state = COMPARE;
			else next_state = INIT;
		end
		
		COMPARE : begin
		
			CountResetA = 0;
			CountResetB = 0;
		
			ReadAddr = ReadAddr + 1;
			
			if(ReadAddr < D)next_state = COMPARE;
			else if (ReadAddr >= D)next_state = RESULT;
		
		end
		
		
		RESULT : begin
		
		
		
		end
		
		endcase
		
	end
endmodule
		
		
		
			
			
				