`ifndef UART_ENV_PKG_INCLUDED_
`define UART_ENV_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package: uart_env_pkg
//  Includes all the files related to UART env
//--------------------------------------------------------------------------------------------
package uart_env_pkg;

  //-------------------------------------------------------
  // Import uvm package
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //-------------------------------------------------------
  // Importing the required packages
  //-------------------------------------------------------
  import uart_globals_pkg::*;
  import tx_pkg::*;
  import rx_pkg::*;
  import device_agent_pkg::*;

  //-------------------------------------------------------
  // Include all env related files
  //------------------------------------------------------- 
  `include "env_config.sv"
  `include "uart_scoreboard.sv"
  `include "virtual_sequencer.sv"
  `include "env.sv"

endpackage : uart_env_pkg

`endif
