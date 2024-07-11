`include "macro.sv"

module alu (A,B,op,clk,reset_n,result,start,done);
  input [7:0] A;
  input [7:0] B;
  input [2:0] op;
  input clk,reset_n,start;
  output [15:0] result;
  output done;
  reg [15:0] result;
  reg done;
  
  always @(posedge clk)
  begin
    if(reset_n)
      begin
        if(start)
          begin
            case (op)
				`no_op :
				        begin
						done <= 1'b0;
						end
				`add_op : 
				        begin
						result <= A + B;
						done <= 1'b1;
						end
				`and_op : 
					    begin
						result <= A & B;
						done <= 1'b1;
						end
				`xor_op :                   
				        begin
						result <= A ^ B;
						done <= 1'b1;
						end
				`mul_op : 
				        begin
						result <= A * B;
						done <= 1'b1;
						end
				default : 
				        begin
						done <= 1'b0;
						end
            endcase
          end
		else
		  begin
			done <= 1'b0;
		  end 
	  end
    else if (reset_n == 0)
      begin
		result <= 0; //when reset_n = 0
		done <= 1'b0;
      end //end of if start
  end //end always
endmodule
