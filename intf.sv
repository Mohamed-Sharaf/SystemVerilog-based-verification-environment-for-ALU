`ifndef Guard_INTF
`define Guard_INTF

interface intf (input bit clk, reset);
  logic [7:0] A, B;
  logic [2:0] op;
  logic start;
  logic done;
  logic [15:0] result;
endinterface

`endif // Guard_INTF