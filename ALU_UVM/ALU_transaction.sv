//  Class: ALU_transaction
//
class ALU_transaction extends uvm_sequence_item;
    
    `uvm_object_utils(ALU_transaction);

    //  Group: Variables
    rand bit [7:0] A, B;
    rand bit [2:0] op;
    rand bit reset_n;
    rand bit start;
    bit done;
    bit [15:0] result;

    //  Group: Constraints
    constraint op_codes {
        op dist{[3'b000:3'b100] := 90,[3'b101:3'b111] := 10};
    }
    
    constraint start_reset {
                    start dist{1'b1 := 90 ,1'b0:= 10}; // start = 1 weight 90/100 start = 0 10/100
                    reset_n dist{1'b1 :=90 , 1'b0:= 10}; // reset = 1 weight 90/100 reset = 0 10/100
    }

    //  Group: Functions

    //  Constructor: new
    function new(string name = "ALU_transaction");
        super.new(name);
    endfunction: new

    //  Function: do_copy
    // extern function void do_copy(uvm_object rhs);
    //  Function: do_compare
    // extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    //  Function: convert2string
    // extern function string convert2string();
    //  Function: do_print
    // extern function void do_print(uvm_printer printer);
    //  Function: do_record
    // extern function void do_record(uvm_recorder recorder);
    //  Function: do_pack
    // extern function void do_pack();
    //  Function: do_unpack
    // extern function void do_unpack();
    
endclass: ALU_transaction

