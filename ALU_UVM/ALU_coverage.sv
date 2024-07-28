//  Class: ALU_coverage
//
class ALU_coverage extends uvm_subscriber #(ALU_transaction);;

//----------------------------------------------------------------------------
`uvm_component_utils(ALU_coverage)
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
function new(string name="ALU_coverage",uvm_component parent);
  super.new(name,parent);
  alu_coverage=new();
endfunction
//----------------------------------------------------------------------------


ALU_transaction trans;
real cov;

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


endgroup: alu_coverage


//---------------------  write method ----------------------------------------
function void write(ALU_transaction t);
trans=t;
alu_coverage.sample();
endfunction
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
function void extract_phase(uvm_phase phase);
super.extract_phase(phase);
cov=alu_coverage.get_coverage();
endfunction
//----------------------------------------------------------------------------


//----------------------------------------------------------------------------
function void report_phase(uvm_phase phase);
super.report_phase(phase);
`uvm_info(get_type_name(),$sformatf("Coverage is %f",cov),UVM_MEDIUM)
endfunction
//----------------------------------------------------------------------------

endclass: ALU_coverage

`endif