module dataPath(input dataIn, input clk, input CountResetA, input CountResetB);
//DataIn only 1 bit as we are passsing quantized vector, only 1 bit per index


parameter INIT = 0,
			 COMPARE = 1,
			 RESULT = 2,
			 DONE = 3;
			 
			 
logic [3:0] cur_state;


logic [7:0]CountA, CountB;//8 bit allocation as our dimensions are currently 128, so we can encasulate the 128 values with 8 bits
//Number of count variables has to change if we have more class vectors


always_ff @(posedge clk)begin

		case(cur_state)














