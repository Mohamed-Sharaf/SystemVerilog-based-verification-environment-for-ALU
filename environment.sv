`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "intf.sv"

class environment;

generator gen;
driver driv;
monitor mon;
scoreboard scb;

virtual intf vif;

mailbox gen2drive;
mailbox drive2scb;
mailbox mon2scb;

function new (virtual intf vif);

this.vif = vif;

gen2drive = new();
drive2scb = new();
mon2scb   = new();

gen = new(gen2drive);
driv = new(gen2drive, drive2scb, vif);
mon = new(mon2scb, vif);
scb = new(mon2scb, drive2scb);
  

endfunction


task pre_test;
$display(" %0d : Environment : start of pre_test() method",$time); 
driv.reset();
$display(" %0d : Environment : end of pre_test() method",$time);
endtask



task test;
	 $display(" %0d : Environment : start of test() method",$time); 
	fork
		gen.main();
		driv.main();
		mon.main();
		scb.main();
	join_any
	$display(" %0d : Environment : end of test() method",$time); 

endtask


task post_test;
$display(" %0d : Environment : start of post_test() method",$time); 
wait (gen.ended.triggered);
wait (gen.repeat_count == driv.no_trans);
wait (gen.repeat_count == scb.no_trans);
  
endtask

task run;
	pre_test();
	test();
	post_test();
	$finish;
endtask

endclass
