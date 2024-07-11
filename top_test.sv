`include "test.sv"
`include "intf.sv"

module top_test ;

bit clk, reset;

intf intf (clk,reset);
test test (intf);

alu dut(
  .A(intf.A),
  .B(intf.B),
  .op(intf.op),
  .clk(intf.clk),
  .reset_n(intf.reset),
  .start(intf.start),
  .result(intf.result),
  .done(intf.done));
 
initial begin
	clk = 1'b0;
	reset = 1'b0;
	#5 reset = 1'b1;
end

always #5 clk = ~clk;

endmodule	