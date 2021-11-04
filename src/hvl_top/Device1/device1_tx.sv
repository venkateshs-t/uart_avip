`ifndef DEVICE1_TX_INCLUDED_
`define DEVICE1_TX_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: device1_tx
// It's a transaction class that holds the UART data items for generating the stimulus
//--------------------------------------------------------------------------------------------
class device1_tx extends uvm_sequence_item;
  //register with factory so we can override with uvm method in future if necessary.
  `uvm_object_utils(device1_tx)
  
  //input signals
  rand bit [CHAR_LENGTH-1:0]tx;
  bit [CHAR_LENGTH-1:0]rx[$];

  //-------------------------------------------------------
  // constraints for uart
  //-------------------------------------------------------
  constraint length{CHAR_LENGTH>5 && CHAR_LENGTH<8;}
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "device1_tx");
  extern function void do_copy(uvm_object rhs);
  extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);

endclass : device1_tx

//--------------------------------------------------------------------------------------------
// Construct: new
// Constructs the device1_tx object
//  
//
// Parameters:
// name - device1_tx
//--------------------------------------------------------------------------------------------
function device1_tx::new(string name = "device1_tx");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// do_copy method
//--------------------------------------------------------------------------------------------

function void device1_tx::do_copy (uvm_object rhs);
  device1_tx rhs_;
  
  if(!$cast(rhs_,rhs)) begin
    `uvm_fatal("do_copy","cast of the rhs object failed")
  end
  super.do_copy(rhs);
  tx= rhs_.tx;
  rx=rhs_.rx;

endfunction : do_copy

//--------------------------------------------------------------------------------------------
// do_compare method
//--------------------------------------------------------------------------------------------
function bit  device1_tx::do_compare (uvm_object rhs,uvm_comparer comparer);
  device1_tx rhs_;
  
  if(!$cast(rhs_,rhs)) begin
    `uvm_fatal("FATAL_device1_tx_DO_COMPARE_FAILED","cast of the rhs object failed")
    return 0;
  end
  
  return super.do_compare(rhs,comparer) &&
  tx == rhs_.tx &&
  rx == rhs_.rx;
endfunction : do_compare

//--------------------------------------------------------------------------------------------
// Function: do_print method
// Print method can be added to display the data members values
//--------------------------------------------------------------------------------------------

function void device1_tx::do_print(uvm_printer printer);
  super.do_print(printer);
  printer.print_field( "tx", tx , $bits(tx),UVM_BIN);
  foreach(rx[i])begin
    printer.print_field( $sformatf("rx[%0d]",i), this.rx[i] , $bits(rx),UVM_BIN);
  end
endfunction : do_print

`endif
