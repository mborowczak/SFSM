module 2sbc (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [1:0] ptext;
	output[2:0] rtext;
	reg [2:0] rtext;
//STATE ASSIGNMENTS
	`include "2sbc_stassign.v";
   //process modeling state register
   always @ (posedge RST or posedge CLK) begin
      if( RST == 1) begin
	 State <= st_st1;
      end
      else
	State <= NextState;
   end
   always @ (State or ptext) begin
      case ( State )
	  st_st: begin
		if(ptext[0] == 1 )
 		  NextState <= st_st;
		else if(ptext[1] == 1 )
 		  NextState <= st_wt;
		rtext <= 'b010;
	  end
	  st_wt: begin
		if(ptext[0] == 1 )
 		  NextState <= st_st;
		else if(ptext[1] == 1 )
 		  NextState <= st_wnt;
		rtext <= 'b100;
	  end
	  st_wnt: begin
		if(ptext[0] == 1 )
 		  NextState <= st_wt;
		else if(ptext[0] == 1 )
 		  NextState <= st_snt;
		rtext <= 'b110;
	  end
	  st_snt: begin
		if(ptext[1] == 1 )
 		  NextState <= st_wnt;
		else if(ptext[0] == 1 )
 		  NextState <= st_snt;
		rtext <= 'b111;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
