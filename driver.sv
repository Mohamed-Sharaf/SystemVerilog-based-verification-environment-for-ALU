`include "transaction.sv"

class driver;
	mailbox gen2drive, drive2scb;
	virtual intf vif;
 	int no_trans;

  function new (mailbox gen2drive, drive2scb, virtual intf vif);
	this.drive2scb = drive2scb;
	this.gen2drive = gen2drive;
	this.vif = vif;
  endfunction


task reset;

	transaction trans;
  	trans = new();
	//gen2drive.get(trans);
	wait (!vif.reset);
	$display("[ DRIVER ] ----- Reset Started -----");
	vif.A = 8'b0;
	vif.B = 8'b0;
	vif.op = 3'b0;
	vif.start = 1'b0;

	//reseting trans values also
	trans.A = 8'b0;
	trans.B = 8'b0;
	trans.op = 3'b0;
	trans.start = 1'b0;

	drive2scb.put(trans);

	wait (vif.reset);
	$display("[ DRIVER ] ----- Reset ended -----");
endtask



task main ();
	forever  begin
		transaction trans;

		gen2drive.get(trans);
		

		 @(posedge vif.clk); 
		 vif.A <= trans.A;
		 vif.B <= trans.B;
		 vif.op <= trans.op;
		 vif.start <= trans.start;

		 @(posedge vif.clk); 
      	 drive2scb.put(trans);
// 		 trans.display("driver");

		no_trans = no_trans+1;

	end
endtask
endclass 
