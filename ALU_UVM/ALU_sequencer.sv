//-------------------------------------------------------------------------------------------------
//
//                                 ALU VERIFICATION
//
//-------------------------------------------------------------------------------------------------
// CREATOR    : Mohamed Sharaf
// PROJECT    : ALU UVM TEST BENCH
//-------------------------------------------------------------------------------------------------
// TITLE      : ALU SEQUENCER  
// DESCRIPTION: THIS BLOCK ESTABLISHES A CONNECTION BETWEEN SEQUENCE AND DRIVER
//-------------------------------------------------------------------------------------------------
// LOG DETAILS
//-------------
// VERSION          NAME            DATE        DESCRIPTION
//    1         Mohamed Sharaf    07082024     FILE CREATION
//-------------------------------------------------------------------------------------------------

class ALU_sequencer extends uvm_sequencer#(ALU_transaction);
  //----------------------------------------------------------------------------
  `uvm_component_utils(ALU_sequencer)  
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="ALU_sequencer",uvm_component parent);  
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
endclass : ALU_sequencer
