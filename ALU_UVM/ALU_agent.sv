//-------------------------------------------------------------------------------------------------
//
//                                 ALU VERIFICATION
//
//-------------------------------------------------------------------------------------------------
// CREATOR    : Mohamed Sharaf
// PROJECT    : ALU UVM TEST BENCH
//-------------------------------------------------------------------------------------------------
// TITLE      : ALU AGENT 
// DESCRIPTION: THIS BLOCK Instantiates and connects the driver, monitor, and sequencer instances
//-------------------------------------------------------------------------------------------------
// LOG DETAILS
//-------------
// VERSION          NAME            DATE        DESCRIPTION
//    1         Mohamed Sharaf    07082024     FILE CREATION
//-------------------------------------------------------------------------------------------------

class ALU_agent extends uvm_agent;
    
//----------------------------------------------------------------------------
`uvm_component_utils(ALU_agent)
//----------------------------------------------------------------------------

uvm_analysis_port#(ALU_transaction) agent_ap;

//----------------------------------------------------------------------------
function new(string name="ALU_agent",uvm_component parent);
  super.new(name,parent);
endfunction
//----------------------------------------------------------------------------

//----------------- class handles --------------------------------------------
ALU_sequencer sequencer_h;
ALU_driver    driver_h;
ALU_monitor   monitor_h;
//----------------------------------------------------------------------------

//---------------------- build phase -----------------------------------------
function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  agent_ap    = new(.name("agent_ap"), .parent(this));

  driver_h    = ALU_driver::type_id::create("driver_h",this);
  sequencer_h = ALU_sequencer::type_id::create("sequencer_h",this);
  monitor_h   = ALU_monitor::type_id::create("monitor_h",this);
endfunction
//----------------------------------------------------------------------------

//----------------------- connect phase --------------------------------------
function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
  monitor_h.alu_mon.connect(agent_ap);
endfunction
//----------------------------------------------------------------------------

endclass: ALU_agent
