//  Class: ALU_monitor
//
class ALU_monitor extends uvm_monitor;

    `uvm_component_utils(ALU_monitor)


    //------------------------ analysis port -------------------------------------
    uvm_analysis_port#(ALU_transaction) alu_mon;
    //----------------------------------------------------------------------------

    //--------------------------  virtual interface handel -----------------------  
    virtual intf vif;
    //----------------------------------------------------------------------------

    // ALU_transaction trans;

    //  Group: Functions

    //------------------- constructor --------------------------------------------
    function new(string name="ALU_monitor",uvm_component parent);
        super.new(name,parent);
    endfunction
    //----------------------------------------------------------------------------


    //-------------------------  get interface handel from top -------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif))) begin
            `uvm_fatal(get_type_name(),"unable to get interface");
        end
        
        alu_mon=new(.name("alu_mon"),.parent(this));
        // trans=ALU_transaction::type_id::create("trans",this);
        
    endfunction
    //----------------------------------------------------------------------------
    

    //---------------------------- run task --------------------------------------
    task run_phase(uvm_phase phase);
    
    ALU_transaction trans;

    trans = ALU_transaction::type_id::create
			(.name("trans"), .contxt(get_full_name()));

        forever begin
            wait(vif.reset_n);
            @(negedge vif.clk);  
                trans.A       <= vif.A;
                trans.B       <= vif.B;
                trans.op      <= vif.op;
                trans.reset_n <= vif.reset_n;
                trans.start   <= vif.start;

                trans.done    <= vif.done;
                trans.result  <= vif.result;

            alu_mon.write(trans);    
        end
    endtask
    //----------------------------------------------------------------------------

endclass: ALU_monitor
