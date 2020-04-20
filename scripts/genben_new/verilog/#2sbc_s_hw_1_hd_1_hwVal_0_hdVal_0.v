module #2sbc_s (RST, CLK, ptext, rtext);
//user interface
	input RST, CLK;
	input [1:0] ptext;
	output[2:0] rtext;
	reg [2:0] rtext;
//STATE ASSIGNMENTS
	`include "#2sbc_s_stassign.v";
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
	  st_staken: begin
		if(ptext[0] == 1 )
 		  NextState <= st_staken_n;
		else if(ptext[1] == 1 )
 		  NextState <= st_taken;
		rtext <= 'b000;
	  end
	  st_staken_n: begin
		if(ptext[0] == 1 )
 		  NextState <= st_staken;
		else if(ptext[1] == 1 )
 		  NextState <= st_taken;
		rtext <= 'b010;
	  end
	  st_taken: begin
		if(ptext[0] == 1 )
 		  NextState <= st_staken;
		else if(ptext[1] == 1 )
 		  NextState <= st_nottaken;
		rtext <= 'b100;
	  end
	  st_nottaken: begin
		if(ptext[0] == 1 )
 		  NextState <= st_taken;
		rtext <= 'b101;
	  end
	  st_notstalen: begin
		if(ptext[0] == 1 )
 		  NextState <= st_st3;
		rtext <= 'b110;
	  end
	  st_st3: begin
		if(ptext[1] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1 )
 		  NextState <= st_st3_n;
		rtext <= 'b110;
	  end
	  st_st3_n: begin
		if(ptext[1] == 1 )
 		  NextState <= st_st2;
		else if(ptext[0] == 1 )
 		  NextState <= st_st3;
		rtext <= 'b111;
	  end
      endcase // case ( State )
   end // always @ (State or ptext)   
endmodule // fsm
