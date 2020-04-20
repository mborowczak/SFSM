	parameter  st_st =  4'b0100;
	parameter  st_wnt =  4'b1000;
	parameter  st_wt =  4'b0001;
	parameter  st_snt =  4'b0010;
	reg[3:0] State;
	reg[3:0] NextState;
