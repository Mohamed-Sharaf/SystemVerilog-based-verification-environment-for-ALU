`include "transaction.sv"
`include "macro.sv"
`include "coverage.sv"

class scoreboard;

mailbox mon2scb, drive2scb;
int no_trans, errors, errors_done;

coverage cov = new();

function new (mailbox mon2scb, drive2scb );
	this.mon2scb = mon2scb;
	this.drive2scb = drive2scb;
endfunction 


task main;
 	transaction trans1, trans2;
	bit [15:0] result;
	logic done;
	forever
  begin

	
	mon2scb.get(trans1);
	drive2scb.get(trans2);
	cov.sample(trans1);

	if (trans2.start)
	case(trans2.op)
		`no_op  : begin
			done = 1'b0;
		end
		`add_op : begin 
			 result = trans2.A + trans2.B;
			 done = 1'b1;
		end	
		`and_op : begin
			result = trans2.A & trans2.B;
			done = 1'b1;
		end
		`xor_op : begin                  
			result = trans2.A ^ trans2.B;
			done = 1'b1;
		end	
		`mul_op : begin 
			result = trans2.A * trans2.B; 
			done = 1'b1;
		end	
		default : begin
          $display("default case");
			result = result;		 	
			done = 1'b0;
		end
	endcase

else begin
	done=1'b0;
	result = result;
end
	
trans1.display("scoreboard monitor values");
trans2.display("scoreboard driver values");

    if (trans1.result == result) begin 
	$display("tranaction %d : correct result", no_trans);
    $display("monitor result :  %d", trans1.result);
    $display("driver result  : %d", result);
    end
else begin
	$display("tranaction %d : incorrect result", no_trans);
  	$display("monitor result :  %d", trans1.result);
    $display("driver result  : %d", result);
	errors++;
end
 
    

if (trans1.done == done) 
	$display("tranaction %d : correct done signal", no_trans);
else begin
	$display("tranaction %d : error in done signal", no_trans);
	errors_done++;
end
 $display("result errors =  %d, done error = %d", errors, errors_done);
no_trans = no_trans+1;

end
endtask
endclass
