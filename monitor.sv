`include "transaction.sv"

class monitor;

virtual intf intf;
mailbox mon2scb;


  function new (mailbox mon2scb, virtual intf intf);
	this.intf = intf;
	this.mon2scb = mon2scb;
endfunction

task main ;
  forever begin
	transaction trans;
  	trans = new();
	@ (posedge intf.clk);
	trans.A <= intf.A;
	trans.B <= intf.B;
	trans.op <= intf.op;
	trans.start <= intf.start;
	trans.done <= intf.done;
	trans.result <= intf.result;

	@ (posedge intf.clk);
	mon2scb.put(trans);
// 	trans.display("monitor");
  end
endtask
endclass	








