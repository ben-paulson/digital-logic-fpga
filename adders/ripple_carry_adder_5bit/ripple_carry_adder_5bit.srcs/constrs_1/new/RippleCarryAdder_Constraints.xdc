# First set constraints for 5-bit input A
# These will be the 5 leftmost switches

set_property PACKAGE_PIN R3 [get_ports {A[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[0]}]

set_property PACKAGE_PIN W2 [get_ports {A[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[1]}]

set_property PACKAGE_PIN U1 [get_ports {A[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[2]}]

set_property PACKAGE_PIN T1 [get_ports {A[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[3]}]

set_property PACKAGE_PIN R2 [get_ports {A[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[4]}]

# Next set constraints for 5-bit input B
# These will be the 5 rightmost switches

set_property PACKAGE_PIN V17 [get_ports {B[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[0]}]

set_property PACKAGE_PIN V16 [get_ports {B[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[1]}]

set_property PACKAGE_PIN W16 [get_ports {B[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[2]}]

set_property PACKAGE_PIN W17 [get_ports {B[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[3]}]

set_property PACKAGE_PIN W15 [get_ports {B[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[4]}]

# Now set constraints for SUM output
# This will be the 5 rightmost LEDs

set_property PACKAGE_PIN U16 [get_ports {SUM[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SUM[0]}]

set_property PACKAGE_PIN E19 [get_ports {SUM[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SUM[1]}]

set_property PACKAGE_PIN U19 [get_ports {SUM[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SUM[2]}]

set_property PACKAGE_PIN V19 [get_ports {SUM[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SUM[3]}]

set_property PACKAGE_PIN W18 [get_ports {SUM[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SUM[4]}]

# Finally set carry out (the possible 6th bit)
# It will be on LED7

set_property PACKAGE_PIN V14 [get_ports {CO}]
set_property IOSTANDARD LVCMOS33 [get_ports {CO}]