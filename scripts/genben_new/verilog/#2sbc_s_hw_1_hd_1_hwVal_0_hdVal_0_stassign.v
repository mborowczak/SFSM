	parameter  st_taken =  4'b1001;
	parameter  st_st3_n =  4'b0100;
	parameter  st_staken_n =  4'b0011;
	parameter  st_st2 =  4'b0010;
	parameter  st_nottaken =  4'b0101;
	parameter  st_notstalen =  4'b1000;
	parameter  st_staken =  4'b1010;
	parameter  st_st3 =  4'b0001;
	reg[3:0] State;
	reg[3:0] NextState;
