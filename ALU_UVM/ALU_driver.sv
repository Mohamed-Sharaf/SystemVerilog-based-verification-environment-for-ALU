class ALU_driver extends uvm_driver #(ALU_transaction);
    
//----------------------------Factory Registeration---------------------------
`uvm_component_utils(ALU_driver)
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
function new(string name="",uvm_component parent);
    super.new(name,parent);
endfunction
//---------------------------------------------------------------------------- 

//--------------------------  virtual interface handel -----------------------  
virtual intf vif;
//----------------------------------------------------------------------------


//-------------------------  get interface handel from top -------------------
function void build_phase(uvm_phase phase);
super.build_phase(phase);
  if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif))) begin
    `uvm_fatal(get_type_name(),"unable to get interface");
  end
endfunction
//----------------------------------------------------------------------------


//---------------------------- run task --------------------------------------
task run_phase(uvm_phase phase);

ALU_transaction trans;
forever begin

  `uvm_info("DRIVER",$sformatf("waiting for data from sequencer"),UVM_MEDIUM)

  seq_item_port.get_next_item(trans);
  @(negedge vif.clk);  
  vif.A       <= trans.A;
  vif.B       <= trans.B;
  vif.op      <= trans.op;
  vif.reset_n <= trans.reset_n;
  vif.start   <= trans.start;

  seq_item_port.item_done();    
end
endtask
//----------------------------------------------------------------------------

endclass : ALU_driver
