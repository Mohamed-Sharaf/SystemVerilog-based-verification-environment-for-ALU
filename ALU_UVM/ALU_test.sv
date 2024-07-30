//  Class: ALU_test
//
class ALU_test extends uvm_test;
    
    //--------------------------------------------------------------------------
    `uvm_component_utils(ALU_test)
    //--------------------------------------------------------------------------

    ALU_env env_h; // environment handle
    int file_h;

    ALU_sequence    seq;
    ALU_zero_A      seq_A_0;
    ALU_zero_B      seq_B_0;
    ALU_F           seq_AB_1;
    reset           rst;

    //  Group: Functions

    //  Constructor: new

    //--------------------------------------------------------------------------
    function new(string name="ALU_test",uvm_component parent);
      super.new(name,parent);
    endfunction
    //--------------------------------------------------------------------------
    

    //--------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env_h = ALU_env::type_id::create("env_h",this);

      seq = ALU_sequence::type_id::create("seq");
      seq_A_0 = ALU_zero_A::type_id::create("seq_A_0");
      seq_B_0 = ALU_zero_B::type_id::create("seq_B_0");
      seq_AB_1 = ALU_F::type_id::create("seq_AB_1");
      rst = reset::type_id::create("rst");
      
    endfunction
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    function void start_of_simulation_phase(uvm_phase phase);
      //super.start_of_simulation_phase(phase);
      $display("start_of_simulation_phase");
      file_h=$fopen("LOG_FILE.log","w");
      set_report_default_file_hier(file_h);
      set_report_severity_action_hier(UVM_INFO,UVM_DISPLAY+UVM_LOG);
      env_h.set_report_verbosity_level_hier(UVM_MEDIUM);
      seq.loop_count=100; // change value from here
    endfunction
    //--------------------------------------------------------------------------


    //--------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);

            rst.start(env_h.agent_h.sequencer_h);
            seq.start(env_h.agent_h.sequencer_h);
            seq_A_0.start(env_h.agent_h.sequencer_h);
            seq_B_0.start(env_h.agent_h.sequencer_h);
            seq_AB_1.start(env_h.agent_h.sequencer_h);
            
            #10;
        phase.drop_objection(this);
    endtask
    //--------------------------------------------------------------------------

endclass: ALU_test
