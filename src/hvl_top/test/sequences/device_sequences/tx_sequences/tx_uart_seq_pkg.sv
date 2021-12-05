`ifndef TX_UART_SEQ_PKG_INCLUDED_
`define TX_UART_SEQ_PKG_INCLUDED_

//-----------------------------------------------------------------------------------------
// Package: tx_uart_seq_pkg
// Description:
// Includes all the files written to run the simulation
//-------------------------------------------------------------------------------------------
package tx_uart_seq_pkg;
  
  //-------------------------------------------------------
  // Importing UVM Pkg
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import tx_pkg::*;

  //-------------------------------------------------------
  // Including required uart tx seq files
  //-------------------------------------------------------
  `include "tx_base_sequence.sv"
  `include "tx_uart_fd_8b_seq.sv"

endpackage : tx_uart_seq_pkg

`endif

