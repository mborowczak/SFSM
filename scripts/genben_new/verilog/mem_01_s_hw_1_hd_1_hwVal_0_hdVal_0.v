module mem_01_s (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [1:0] ptext;
	output[2:0] rtext;
	reg [2:0] rtext;
//STATE ASSIGNMENTS
	`include "mem_01_s_stassign.v";
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
	  st_st0: begin
		if(ptext[0] == 1 )
 		  NextState <= st_st0_n;
		else if(ptext[1] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1 )
 		  NextState <= st_st2;
		rtext <= 'b000;
	  end
	  st_st0_n: begin
		if(ptext[0] == 1 )
 		  NextState <= st_st0;
		else if(ptext[1] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1 )
 		  NextState <= st_st2;
		rtext <= 'b011;
	  end
	  st_st1: begin
		if(ptext[1] == 1 )
 		  NextState <= st_st1_n;
		else if(ptext[0] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1 )
 		  NextState <= st_st2;
		rtext <= 'b011;
	  end
	  st_st1_n: begin
		if(ptext[1] == 1 )
 		  NextState <= st_st1;
		else if(ptext[0] == 1 )
 		  NextState <= st_st0;
		else if(ptext[0] == 1 )
 		  NextState <= st_st2;
		rtext <= 'b110;
	  end
	  st_st2: begin
		if(ptext[1] == 1 )
 		  NextState <= st_st2_n;
		else if(ptext[0] == 1 )
 		  NextState <= st_st0;
		else if(ptext[1] == 1 )
 		  NextState <= st_st1;
		rtext <= 'b110;
	  end
	  st_st2_n: begin
		if(ptext[1] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1 )
 		  NextState <= st_st0;
		else if(ptext[1] == 1 )
 		  NextState <= st_st1;
		rtext <= 'b111;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
