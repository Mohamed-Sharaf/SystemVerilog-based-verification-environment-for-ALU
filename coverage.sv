`ifndef Guard_Coverage
`define Guard_Coverage

`include "transaction.sv"
`include "macro.sv"

class coverage;

transaction trans;

covergroup alu_coverage; 

option.per_instance = 1;
type_option.comment = "Coverage model for ALU";

A: coverpoint trans.A {
bins all_zeros = {0};
bins all_ones = {8'hFF};
bins Others = {[8'h01:8'hFE]};
}

B: coverpoint trans.B {
bins all_zeros = {0};
bins all_ones = {8'hFF};
bins Others = {[8'h01:8'hFE]};
}

op: coverpoint trans.op {
    bins no_op  = {`no_op};
    bins add_op = {`add_op};
    bins and_op = {`and_op};
    bins xor_op = {`xor_op};
    bins mul_op = {`mul_op};
    bins op_seq[] = ([`no_op:`mul_op] => [`no_op:`mul_op]);
}

Start : coverpoint trans.start{
bins zeros = {0};
bins ones = {1};
bins trans_0_1 = (0 => 1);
bins trans_1_0 = (1 => 0);

} 


endgroup 

function new(); 
alu_coverage = new(); 
endfunction : new 

task sample(transaction trans); 
this.trans = trans; 
alu_coverage.sample(); 
endtask:sample 

endclass

`endif