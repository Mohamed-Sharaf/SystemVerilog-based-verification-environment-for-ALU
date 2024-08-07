//-------------------------------------------------------------------------------------------------
//
//                                 ALU VERIFICATION
//
//-------------------------------------------------------------------------------------------------
// CREATOR    : Mohamed Sharaf
// PROJECT    : ALU UVM TEST BENCH
//-------------------------------------------------------------------------------------------------
// TITLE      : ALU TOP 
// DESCRIPTION: THIS TOP MODULE THAT INHERITS THE ALL TESTBENCH COMPONENT AND CONNECT THEM TO DUT.
//              ALSO INCLUDES THE CLOCK GENERATION MECHANISM.
//-------------------------------------------------------------------------------------------------
// LOG DETAILS
//-------------
// VERSION          NAME            DATE        DESCRIPTION
//    1         Mohamed Sharaf    07082024     FILE CREATION
//-------------------------------------------------------------------------------------------------

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
