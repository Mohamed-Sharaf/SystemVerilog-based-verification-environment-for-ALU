`ifndef Test_pkg
`define Test_pkg

`include "uvm_macros.svh"
package Test_pkg;
 import uvm_pkg::*;
 
 `include "macro.sv"        // macros
 `include "ALU_config.sv"        // configuration class
 `include "ALU_transaction.sv"        // transaction class
 `include "ALU_sequence.sv"             // sequence class
 `include "ALU_sequencer.sv"            // sequencer class
 `include "ALU_driver.sv"               // driver class
 `include "ALU_monitor.sv"
 `include "ALU_agent.sv"                // agent class  
 `include "ALU_coverage.sv"             // coverage class
 `include "ALU_scoreboard.sv"           // scoreboard class
 `include "ALU_env.sv"                  // environment class

 `include "ALU_test.sv"                 // test

endpackage

`endif 