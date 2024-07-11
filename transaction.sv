`ifndef Guard_TRANS
`define Guard_TRANS

class transaction;
  rand bit [7:0] A, B;
  randc bit [2:0] op;
  rand bit start;
  bit done;
  bit [15:0] result;
	
  constraint op_codes {
    op dist{[3'b000:3'b100] := 90,[3'b101:3'b111] := 10};
  }
  
  constraint str { start dist {1'b1 := 90, 1'b0:= 10}; }



function void display(string name);
    $display("-------------------------");
    $display("- %s ",name);
    $display("-------------------------");
    $display("- start = %b",start);
    $display("- a = %0d, b = %0d, op = %0d",A,B, op);
    $display("- done = %b, result = %0d",done, result);
    $display("-------------------------");
  endfunction

endclass 

`endif // Guard_TRANS