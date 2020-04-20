	parameter  st_RD =  3'b001;
	parameter  st_WR =  3'b100;
	parameter  st_ID =  3'b010;
	reg[2:0] State;
	reg[2:0] NextState;
