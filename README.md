# ALU Verification Environment

## Overview
This repository contains a SystemVerilog-based verification environment for an Arithmetic Logic Unit (ALU). The environment includes various components such as a driver, monitor, scoreboard, generator, and coverage, integrated to form a comprehensive verification setup.

## Directory Structure
- [macro.sv](/macro.sv) : Defines macros for ALU operations.
- [alu.v](/alu.v) : ALU design module.
- [intf.sv](/intf.sv) : Defines the interface for communication between testbench components.
- [transaction.sv](/transaction.sv) : Defines the transaction class for data transfer.
- [driver.sv](/driver.sv) : Drives transactions to the ALU.
- `monitor.sv`: Monitors and captures transactions from the ALU.
- `generator.sv`: Generates random transactions.
- `environment.sv`: Instantiates and connects all components.
- `coverage.sv`: Defines coverage points.
- `scoreboard.sv`: Verifies the correctness of ALU operations.
- `test.sv`: Test program to run the verification environment.
- `top_test.sv`: Top-level module for the testbench.
- `run_c.do`: Script for running the simulation.

## Components

### macro.sv
Defines the following macros for ALU operations:
- `no_op`: No operation
- `add_op`: Addition operation
- `and_op`: AND operation
- `xor_op`: XOR operation
- `mul_op`: Multiplication operation

### intf.sv
Defines the interface for ALU signals:
- `A`, `B`: Input operands
- `op`: Operation selector
- `start`: Start signal
- `done`: Done signal
- `result`: Result output

### transaction.sv
Defines the transaction class with randomized fields and constraints.

### driver.sv
Drives transactions to the ALU based on the inputs received from the generator.

### monitor.sv
Captures transactions from the ALU and forwards them to the scoreboard for verification.

### generator.sv
Generates random transactions and sends them to the driver.

### environment.sv
Instantiates and connects the generator, driver, monitor, and scoreboard.

### coverage.sv
Defines coverage points for the verification.

### scoreboard.sv
Compares the captured transactions against expected results and reports any discrepancies.

### test.sv
Runs the verification environment by instantiating and initializing the environment.

### top_test.sv
Top-level module that includes the ALU DUT, interface, and test program.

### run_c.do
Script for compiling and running the simulation:
1. Deletes and recreates the `work` library.
2. Compiles all source files.
3. Runs the simulation.
4. Opens necessary views and logs results.

## Running the Simulation

1. Ensure that you have a compatible simulation tool installed (e.g., ModelSim or QuestaSim).
2. Navigate to the directory containing the `run_c.do` script.
3. Run the simulation using the following command:
   ```bash
   do run_c.do
   ```

`Note: The script will compile all source files, run the simulation, and log the results to testbench_result1.txt. Also, Coverage report to final_report.txt`

## Customization
- To change the number of transactions generated, modify the repeat_count in test.sv.
- To use a specific random seed, uncomment and modify the -sv_seed line in run_c.do.
