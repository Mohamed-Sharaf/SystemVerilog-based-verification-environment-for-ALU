> # ALU Verification Environment

## Overview
This repository contains a UVM verification environment for an Arithmetic Logic Unit (ALU). The environment includes various components integrated to form a comprehensive verification setup.

## Directory Structure
- [macro.sv](./macro.sv) : Defines macros for ALU operations.
- [alu.v](./alu.v) : ALU design module.
- [intf.sv](./intf.sv) : Defines the interface for communication between testbench components.
- [ALU_config.sv](./ALU_config.sv) : Configuration database to store different configuration settings.
- [ALU_transaction.sv](./ALU_transaction.sv) : Generates stimulus with randomized fields and constraints.
- [ALU_sequence.sv](./ALU_sequence.sv) : holds data items that are sent to or received from the driver via the sequencer.
- [ALU_sequencer.sv](./ALU_sequencer.sv) : establishes a connection between sequence and driver.
- [ALU_driver.sv](./ALU_driver.sv) : Drives transactions to the ALU.
- [ALU_monitor.sv](./ALU_monitor.sv) : Monitors and captures transactions from the ALU.
- [ALU_agent.sv](./ALU_agent.sv): Instantiates and connects the driver, monitor, and sequencer instances.
- [ALU_coverage.sv](./ALU_coverage.sv) : Defines coverage points.
- [ALU_scoreboard.sv](./ALU_scoreboard.sv) : Verifies the correctness of ALU operations.
- [ALU_env.sv](./ALU_env.sv) : Instantiates and connects the subscriber, agent, and scoreboard.
- [ALU_test.sv](./ALU_test.sv) : UVM Test to run the verification environment.
- [Test_pkg.sv](./Test_pkg.sv) : Container that holds all file names.
- [Top_test.sv](./Top_test.sv) : Top-level module for the testbench.
- [run.do](./run.do) : Script for running the simulation.

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

### ALU_config.sv
Configuration database to store different configuration settings. 

### ALU_transaction.sv
Extended from the uvm_sequence_item class as it leverages generating stimulus with randomized fields and constraints.

### ALU_sequence.sv
Holds data items (uvm_sequence_items) which are sent to the driver via the sequencer.

### ALU_sequencer.sv
The sequencer is a mediator who establishes a connection between sequence and driver. Ultimately, it passes transactions or sequence items to the driver so that they can be driven to the DUT.

### ALU_driver.sv
The driver interacts with DUT. It drives randomized transactions or sequence items to DUT as a pin-level activity using an interface. he transaction or sequence items are retrieved from the sequencer and the driver drives them to the design using the interface handle. An interface handle can be retrieved from the configuration database which was already set in the top-level hierarchy.

### ALU_monitor.sv
A UVM monitor is a passive component used to capture DUT signals using a virtual interface and translate them into a sequence item format. These sequence items or transactions are broadcasted to other components like the UVM scoreboard, coverage collector, etc. It uses a TLM analysis port to broadcast transactions.

### ALU_agent.sv
Holds and connects the driver, monitor, and sequencer instances.

### ALU_coverage.sv
Defines coverage points for the verification.

### ALU_scoreboard.sv
Compares the captured transactions against expected results and reports any discrepancies. It receives transactions from the monitor using the analysis export for checking purposes.

### ALU_env.sv
Instantiates and connects the subscriber, agent, and scoreboard.

### ALU_test.sv
Runs the UVM verification environment by instantiating the environment component construction. It is also responsible for the testbench configuration and stimulus generation process.

### Top_test.sv
UVM testbench Top-level module that  has an instantiation of DUT and interfaces. The interface instance connects with DUT signals in the testbench top. The clock is generated and applied to the DUT. It is also passed to the interface handle. An interface is stored in the uvm_config_db using the set method and it can be retrieved down the hierarchy using the get method. UVM testbench top is also used to trigger a test using run_test() call.

### run.do
Script for compiling and running the simulation:
1. Deletes and recreates the `work` library.
2. Compiles all source files.
3. Runs the simulation.
4. Opens necessary views and logs results.

## Running the Simulation

1. Ensure that you have a compatible simulation tool installed (e.g., ModelSim or QuestaSim).
2. Navigate to the directory containing the `run.do` script.
3. Run the simulation using the following command:
   ```bash
   do run.do
   ```

> Note: The script will compile all source files, run the simulation, and log the results to [LOG_FILE.log](./LOG_FILE.log)

## Customization
- To change the number of transactions generated, modify the loop_count for the required sequence in [ALU_test.sv](./ALU_test.sv).
- To use a specific random seed, uncomment and modify the -sv_seed line in [run.do](./run.do).

## Author:
- [Mohamed Sharaf](sharafm823@gmail.com)


