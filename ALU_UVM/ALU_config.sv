//-------------------------------------------------------------------------------------------------
//
//                                 ALU VERIFICATION
//
//-------------------------------------------------------------------------------------------------
// CREATOR    : Mohamed Sharaf
// PROJECT    : ALU UVM TEST BENCH
//-------------------------------------------------------------------------------------------------
// TITLE      : ALU Configuration  
// DESCRIPTION: THIS BLOCK INCLUDES THE WHOLE ENVIRONMENT CONFIGURATIONS THAT ARE SET IN THE TEST
//-------------------------------------------------------------------------------------------------
// LOG DETAILS
//-------------
// VERSION          NAME            DATE        DESCRIPTION
//    1         Mohamed Sharaf    07082024     FILE CREATION
//-------------------------------------------------------------------------------------------------

class ALU_configuration extends uvm_object;
	`uvm_object_utils(ALU_configuration)

	function new(string name = "");
		super.new(name);
	endfunction: new
endclass: ALU_configuration
