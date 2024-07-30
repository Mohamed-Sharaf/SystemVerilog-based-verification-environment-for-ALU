if [file exists "work"] {vdel -all}
vlib work

# SystemVerilog DUT
vlog alu.v

vlog Test_pkg.sv intf.sv Top_test.sv

vsim  -coverage -t 10ns -novopt -suppress 12110 work.Top_test +UVM_TESTNAME=ALU_test

set NoQuitOnFinish 1
onbreak {resume}
log /* -r

run -a









