//  Class: ALU_scoreboard
//
class ALU_scoreboard extends uvm_scoreboard;
    
`uvm_component_utils(ALU_scoreboard)
  

uvm_analysis_export #(ALU_transaction, ALU_scoreboard) export_mon;

uvm_tlm_analysis_fifo #(ALU_transaction) fifo;

ALU_transaction transaction;

int VECT_CNT, PASS_CNT, ERROR_CNT;


function new(string name="ALU_scoreboard",uvm_component parent);
  super.new(name,parent);
  transaction = new("transaction");
endfunction
  
function void build_phase(uvm_phase phase);
super.build_phase(phase);
  export_mon = new("aport_mon", this);
  fifo= new("fifo",this);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
    export_mon.connect(fifo.analysis_export);
endfunction


virtual function void write(ALU_transaction trans);
    `uvm_info(get_type_name(),$sformatf(" Value of ALU sequence item in Scoreboard \n"),UVM_LOW)
    trans.print(); 
endfunction:write


task run_phase(uvm_phase phase);

forever begin
    `uvm_info("scoreboard run task","WAITING for expected output", UVM_DEBUG)
    fifo.get(transaction);
   
    if (transaction.start)
	case(transaction.op)
		`no_op  : begin
            if (transaction.done == 1'b0) begin
                PASS();
            `uvm_info ("PASS ",transaction.convert2string() , UVM_MEDIUM)
            end
            else begin
            ERROR();
                               
                `uvm_warning("ERROR",transaction.convert2string())
            end
			// done = 1'b0;
		end

		`add_op : begin 
            if ((transaction.result == transaction.A + transaction.B) && (transaction.done == 1'b1)) begin
                PASS();
            `uvm_info ("PASS ",transaction.convert2string() , UVM_MEDIUM)
            end
            else begin
            ERROR();
                               
                `uvm_warning("ERROR",transaction.convert2string())
            end
			//  result = transaction.A + transaction.B;
			//  done = 1'b1;
		end	
		
        `and_op : begin
            if ((transaction.result == transaction.A & transaction.B) && (transaction.done == 1'b1)) begin
                PASS();
            `uvm_info ("PASS ",transaction.convert2string() , UVM_MEDIUM)
            end
            else begin
            ERROR();
                               
                `uvm_warning("ERROR",transaction.convert2string())
            end
			// result = transaction.A & transaction.B;
			// done = 1'b1;
		end
		
        `xor_op : begin     
            if ((transaction.result == transaction.A ^ transaction.B) && (transaction.done == 1'b1)) begin
                PASS();
            `uvm_info ("PASS ",transaction.convert2string() , UVM_MEDIUM)
            end        
            else begin
            ERROR();
                               
                `uvm_warning("ERROR",transaction.convert2string())
            end     
			// result = transaction.A ^ transaction.B;
			// done = 1'b1;
		end	
		
        `mul_op : begin 
            if ((transaction.result == transaction.A * transaction.B) && (transaction.done == 1'b1)) begin
                PASS();
            `uvm_info ("PASS ",transaction.convert2string() , UVM_MEDIUM)
            end 
            else begin
            ERROR();
                               
                `uvm_warning("ERROR",transaction.convert2string())
            end
			// result = transaction.A * transaction.B; 
			// done = 1'b1;
		end	
		
        default : begin
            if (transaction.done == 1'b0) begin
                PASS();
            `uvm_info ("PASS ",transaction.convert2string() , UVM_MEDIUM)
            end 
            else begin
            ERROR();
                               
                `uvm_warning("ERROR",transaction.convert2string())
            end
			// result = result;		 	
			// done = 1'b0;
		end
	endcase

    else begin
        if (transaction.done == 1'b0) begin
            PASS();
        `uvm_info ("PASS ",transaction.convert2string() , UVM_MEDIUM)
        end 
        // done=1'b0;
        // result = result;
    end
  end
endtask

function void PASS();
    VECT_CNT++;
    PASS_CNT++;
endfunction

function void ERROR();
    VECT_CNT++;
    ERROR_CNT++;
endfunction

endclass: ALU_scoreboard
