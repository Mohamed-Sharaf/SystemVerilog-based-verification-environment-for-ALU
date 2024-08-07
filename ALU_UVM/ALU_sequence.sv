//-------------------------------------------------------------------------------------------------
//
//                                 ALU VERIFICATION
//
//-------------------------------------------------------------------------------------------------
// CREATOR    : Mohamed Sharaf
// PROJECT    : ALU UVM TEST BENCH
//-------------------------------------------------------------------------------------------------
// TITLE      : ALU SEQUENCE    
// DESCRIPTION: THIS FILE INCLUDES THE ALL SEQUENCES THAT WOULD BE FORCED INTO DUT. THE SEQUENCES 
//              MENTIONED BELOW IS IDENTIFIED IN THE MANNER RELATED TO THE VERIFICATION PLAN SECTION
//-------------------------------------------------------------------------------------------------
// LOG DETAILS
//-------------
// VERSION          NAME            DATE        DESCRIPTION
//    1         Mohamed Sharaf    07082024     FILE CREATION
//-------------------------------------------------------------------------------------------------

/***************************************************
** class name  : ALU_sequence
** description : generate random inputs
***************************************************/

class ALU_sequence extends uvm_sequence #(ALU_transaction);
    
    `uvm_object_utils(ALU_sequence);

    //  Group: Variables

    ALU_transaction trans;
    int loop_count = 20;


    //  Group: Functions

    //  Constructor: new
    function new(string name = "ALU_sequence");
        super.new(name);
    endfunction: new

    //  Task: pre_start
    //  This task is a user-definable callback that is called before the optional 
    //  execution of <pre_body>.
    // extern virtual task pre_start();

    //  Task: pre_body
    //  This task is a user-definable callback that is called before the execution 
    //  of <body> ~only~ when the sequence is started with <start>.
    //  If <start> is called with ~call_pre_post~ set to 0, ~pre_body~ is not called.
    // extern virtual task pre_body();

    //  Task: pre_do
    //  This task is a user-definable callback task that is called ~on the parent 
    //  sequence~, if any. The sequence has issued a wait_for_grant() call and after
    //  the sequencer has selected this sequence, and before the item is randomized.
    //
    //  Although pre_do is a task, consuming simulation cycles may result in unexpected
    //  behavior on the driver.
    // extern virtual task pre_do(bit is_item);

    //  Function: mid_do
    //  This function is a user-definable callback function that is called after the 
    //  sequence item has been randomized, and just before the item is sent to the 
    //  driver.
    // extern virtual function void mid_do(uvm_sequence_item this_item);

    //  Task: body
    //  This is the user-defined task where the main sequence code resides.
    //  extern virtual task body();

    virtual task body();
        repeat(loop_count)
        begin
            trans=ALU_transaction::type_id::create("trans");
            start_item(trans);
            assert(trans.randomize());
            finish_item(trans);
        end  
    endtask: body

    //  Function: post_do
    //  This function is a user-definable callback function that is called after the 
    //  driver has indicated that it has completed the item, using either this 
    //  item_done or put methods. 
    // extern virtual function void post_do(uvm_sequence_item this_item);

    //  Task: post_body
    //  This task is a user-definable callback task that is called after the execution 
    //  of <body> ~only~ when the sequence is started with <start>.
    //  If <start> is called with ~call_pre_post~ set to 0, ~post_body~ is not called.
    // extern virtual task post_body();

    //  Task: post_start
    //  This task is a user-definable callback that is called after the optional 
    //  execution of <post_body>.
    // extern virtual task post_start();
    
endclass: ALU_sequence;

/***************************************************
** class name  : ALU_zero_A
** description : input A = 0 
***************************************************/

class ALU_zero_A extends ALU_sequence;
    
    `uvm_object_utils(ALU_zero_A);


    ALU_transaction trans;
    int loop_count = 20;


    //  Constructor: new
    function new(string name = "ALU_zero_A");
        super.new(name);
    endfunction: new

    //----------------------------------------------------------------------------
    virtual task body();
        repeat(loop_count)
        begin
            trans=ALU_transaction::type_id::create("trans");
            start_item(trans);
            assert(trans.randomize() with {trans.A == 0;});
            finish_item(trans);
        end  
    endtask: body
    //----------------------------------------------------------------------------

endclass

/***************************************************
** class name  : ALU_zero_B
** description : input B = 0 
***************************************************/

class ALU_zero_B extends ALU_sequence;
    
    `uvm_object_utils(ALU_zero_B);


    ALU_transaction trans;
    int loop_count = 20;


    //  Constructor: new
    function new(string name = "ALU_zero_B");
        super.new(name);
    endfunction: new

    //----------------------------------------------------------------------------
    virtual task body();
        repeat(loop_count)
        begin
            trans=ALU_transaction::type_id::create("trans");
            start_item(trans);
            assert(trans.randomize() with {trans.B == 0;});
            finish_item(trans);
        end  
    endtask: body
    //----------------------------------------------------------------------------

endclass

/***************************************************
** class name  : ALU_all ones
** description : input A & B = ones 
***************************************************/

class ALU_F extends ALU_sequence;
    
    `uvm_object_utils(ALU_F);


    ALU_transaction trans;
    int loop_count = 20;


    //  Constructor: new
    function new(string name = "ALU_F");
        super.new(name);
    endfunction: new

    //----------------------------------------------------------------------------
    virtual task body();
        repeat(loop_count)
        begin
            trans=ALU_transaction::type_id::create("trans");
            start_item(trans);
            assert(trans.randomize() with {trans.A == '1; trans.B == '1;});
            finish_item(trans);
        end  
    endtask: body
    //----------------------------------------------------------------------------

endclass


/***************************************************
** class name  : ALU reset
** description : reset 
***************************************************/

class reset extends ALU_sequence;
    
    `uvm_object_utils(reset);


    ALU_transaction trans;
    int loop_count = 2;


    //  Constructor: new
    function new(string name = "reset");
        super.new(name);
    endfunction: new

    //----------------------------------------------------------------------------
    virtual task body();
        repeat(loop_count)
        begin
            trans=ALU_transaction::type_id::create("trans");
            start_item(trans);
            assert(trans.randomize() with {trans.reset_n == 0;});
            finish_item(trans);
        end  
    endtask: body
    //----------------------------------------------------------------------------

endclass
