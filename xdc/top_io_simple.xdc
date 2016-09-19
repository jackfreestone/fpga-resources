# User Generated IO constraints 
set_property IOSTANDARD LVCMOS25 [get_ports clk]
set_property IOSTANDARD LVCMOS25 [get_ports in]
set_property IOSTANDARD LVCMOS25 [get_ports out]

# User Generated physical constraints 
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]

set_property PACKAGE_PIN Y6 [get_ports clk]
set_property PACKAGE_PIN T4 [get_ports in]
set_property PACKAGE_PIN U4 [get_ports out]
