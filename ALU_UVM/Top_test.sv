`include "intf.sv"
`include "Test_pkg.sv"

module Top_test;
  import uvm_pkg::*;
  import Test_pkg::*;
  
  bit clk; // external signal declaration

  //----------------------------------------------------------------------------
  intf vif(clk);
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  alu DUT  (.A(vif.A),
            .B(vif.B),
            .op(vif.op),
            .clk(vif.clk),
            .reset_n(vif.reset_n),
            .start(vif.start),
            .result(vif.result),
            .done(vif.done)
            );
  //----------------------------------------------------------------------------               
  
  always #5 clk=~clk;

  initial begin
    clk<=0;
  end
  
  //----------------------------------------------------------------------------
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars;
  end
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  initial begin
    //Registers the Interface in the configuration block so that other
		//blocks can use it
    uvm_config_db#(virtual intf)::set(uvm_root::get(),"","vif",vif);
  end
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  initial begin
    // run_test("ALU_test");
    run_test();
  end
  //----------------------------------------------------------------------------
endmodule
