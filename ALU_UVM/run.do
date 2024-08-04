if [file exists "work"] {vdel -all}
vlib work

# SystemVerilog DUT
vlog +cover alu.v

vlog +cover Test_pkg.sv intf.sv Top_test.sv

vsim  -coverage -t 10ns -novopt -suppress 12110 work.Top_test +UVM_TESTNAME=ALU_test

set NoQuitOnFinish 1
onbreak {resume}
log /* -r

run -a

coverage report -detail -output final_report.txt -srcfile=* -option -cvg

vsim -cvgperinstance -do "coverage report -file final_report.txt -byfile -detail -noannotate -option -cvg"








