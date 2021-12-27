`ifndef TX_CFG_CONVERTER_INCLUDED_
`define TX_CFG_CONVERTER_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: tx_cfg_converterzo
// Description:
// class for converting tx_cfg configurations into struct configurations
//--------------------------------------------------------------------------------------------
class tx_cfg_converter extends uvm_object;
  
  `uvm_object_utils(tx_cfg_converter)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "tx_cfg_converter");

  extern static function void from_class(input tx_agent_config input_conv_h, 
                                         output uart_transfer_cfg_s output_conv);

  extern function void do_print(uvm_printer printer);

endclass : tx_cfg_converter

//--------------------------------------------------------------------------------------------
// Construct: new
// Parameters:
//
//  name - tx_cfg_converter
//--------------------------------------------------------------------------------------------
function tx_cfg_converter::new(string name = "tx_cfg_converter");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// function: from_class
// converting tx_cfg configurations into structure configurations
//--------------------------------------------------------------------------------------------
function void tx_cfg_converter::from_class(input tx_agent_config input_conv_h,
                                                 output uart_transfer_cfg_s output_conv);

  output_conv.uart_type = uart_type_e'(input_conv_h.uart_type);
  output_conv.msb_first = shift_direction_e'(input_conv_h.shift_dir);
  output_conv.oversampling_bits = oversampling_e'(input_conv_h.oversampling_bits);
  output_conv.stop_bit = stop_bit_e'(input_conv_h.stop_bit_duration);
  output_conv.baudrate_divisor = input_conv_h.tx_baudrate_divisor;
  output_conv.parity_scheme = parity_e'(input_conv_h.parity_scheme);

  `uvm_info("cfg_converter",$sformatf("uart_cfg=\n %p",output_conv),UVM_LOW)

endfunction: from_class 

//--------------------------------------------------------------------------------------------
// Function: do_print method
// Print method can be added to display the data members values
//--------------------------------------------------------------------------------------------
function void tx_cfg_converter::do_print(uvm_printer printer);

  uart_transfer_cfg_s uart_st;
  tx_agent_config tx_agent_config_h;
  super.do_print(printer);
  printer.print_string( "msb_first",tx_agent_config_h.shift_dir.name());
  printer.print_string( "msb_first",tx_agent_config_h.uart_type.name());
  printer.print_string( "msb_first",tx_agent_config_h.oversampling_bits.name());
  printer.print_field( "stop_bit", uart_st.stop_bit,$bits(uart_st.stop_bit),UVM_DEC);
  printer.print_field("baudrate_divisor",uart_st.baudrate_divisor,$bits(uart_st.baudrate_divisor),UVM_DEC);
endfunction : do_print

`endif
 
 
