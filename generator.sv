`include "transaction.sv"

class generator;

mailbox gen2drive;

rand transaction trans;
event ended;
int repeat_count;


function  new(mailbox gen2drive);
	this.gen2drive = gen2drive;
endfunction 


task main ();
	repeat (repeat_count) begin
		
	trans = new ();
	if (!trans.randomize()) $fatal ("OMG transaction class is not randomized !!");
   
	trans.display ("generator");
	gen2drive.put (trans);

end
  
-> ended;
endtask
endclass 	
