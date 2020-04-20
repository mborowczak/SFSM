module mem_01 (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [1:0] ptext;
	output[2:0] rtext;
	reg [2:0] rtext;
//STATE ASSIGNMENTS
	`include "mem_01_stassign.v";
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
	  st_RD: begin
		if(ptext[0] == 1 )
 		  NextState <= st_RD;
		else if(ptext[1] == 1 )
 		  NextState <= st_ID;
		else if(ptext[0] == 1 )
 		  NextState <= st_WR;
		rtext <= 'b011;
	  end
	  st_ID: begin
		if(ptext[1] == 1 )
 		  NextState <= st_ID;
		else if(ptext[0] == 1 )
 		  NextState <= st_RD;
		else if(ptext[0] == 1 )
 		  NextState <= st_WR;
		rtext <= 'b110;
	  end
	  st_WR: begin
		if(ptext[1] == 1 )
 		  NextState <= st_WR;
		else if(ptext[0] == 1 )
 		  NextState <= st_RD;
		else if(ptext[1] == 1 )
 		  NextState <= st_ID;
		rtext <= 'b111;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
