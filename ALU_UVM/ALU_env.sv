//  Class: ALU_env
//
class ALU_env extends uvm_env;
    //---------------------------------------------------------------------------
    `uvm_component_utils(ALU_env)
    //---------------------------------------------------------------------------
    
    //-------------------- class handles -----------------------------------------
    ALU_agent      agent_h;
    ALU_coverage   coverage_h;
    ALU_scoreboard scoreboard_h;
    //----------------------------------------------------------------------------
    //  Group: Functions

    //  Constructor: new
    //----------------------------------------------------------------------------
    function new(string name="ALU_env",uvm_component parent);
        super.new(name,parent);
    endfunction
    //----------------------------------------------------------------------------
    
    //---------------------- build phase -----------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent_h      = ALU_agent::type_id::create("agent_h",this);
        coverage_h   = ALU_coverage::type_id::create("coverage_h",this);
        scoreboard_h = ALU_scoreboard::type_id::create("scoreboard_h",this);
    endfunction
    //----------------------------------------------------------------------------

    //-------------------------- connect phase -----------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        // agent_h.monitor_h.alu_mon.connect(coverage_h.analysis_export);
        agent_h.agent_ap.connect(coverage_h.analysis_export);

        agent_h.agent_ap.connect(scoreboard_h.export_mon);
    endfunction
    //----------------------------------------------------------------------------

endclass: ALU_env
