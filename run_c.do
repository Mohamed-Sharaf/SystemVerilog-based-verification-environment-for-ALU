vdel -all -lib work
vlib work

# vlog macro.sv alu.v transaction.sv driver.sv environment.sv generator.sv intf.sv monitor.sv coverage.sv scoreboard.sv test.sv top_test.sv
# vsim work.top_test

vlog +cover macro.sv alu.v transaction.sv driver.sv environment.sv generator.sv intf.sv monitor.sv coverage.sv scoreboard.sv test.sv top_test.sv
vsim -t 10ns -voptargs=+acc -coverage  work.top_test

# vsim work.top_test -sv_seed 15   // to use seed

#view objects
#view wave

#add wave sim:/top_test/*
#do wave.do

transcript file testbench_result1.txt

run -all

transcript off

#coverage report -detail

coverage report -detail -output final_report.txt -srcfile=* -option -cvg

vsim -cvgperinstance -do "coverage report -file final_report.txt -byfile -detail -noannotate -option -cvg"
