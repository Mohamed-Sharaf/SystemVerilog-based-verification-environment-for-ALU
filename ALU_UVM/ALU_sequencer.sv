class ALU_sequencer extends uvm_sequencer#(ALU_transaction);
  //----------------------------------------------------------------------------
  `uvm_component_utils(ALU_sequencer)  
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="",uvm_component parent);  
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
endclass : ALU_sequencer