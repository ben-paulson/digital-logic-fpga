# Set enable input switches to leftmost switches 15-12

set_property PACKAGE_PIN R2 [get_ports {enable[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {enable[3]}]

set_property PACKAGE_PIN T1 [get_ports {enable[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {enable[2]}]

set_property PACKAGE_PIN U1 [get_ports {enable[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {enable[1]}]

set_property PACKAGE_PIN W2 [get_ports {enable[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {enable[0]}]

# Map "an" output to 7-segment anodes

set_property PACKAGE_PIN W4 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

set_property PACKAGE_PIN V4 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]

set_property PACKAGE_PIN U4 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

# Map BCD input to rightmost switches 3-0

set_property PACKAGE_PIN W17 [get_ports {bcd[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bcd[3]}]

set_property PACKAGE_PIN W16 [get_ports {bcd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bcd[2]}]

set_property PACKAGE_PIN V16 [get_ports {bcd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bcd[1]}]

set_property PACKAGE_PIN V17 [get_ports {bcd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bcd[0]}]

# Map "seg" output to the correct LED in the 7-segment display

set_property PACKAGE_PIN W7 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

set_property PACKAGE_PIN W6 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]

set_property PACKAGE_PIN U8 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN V8 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN U5 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]

set_property PACKAGE_PIN V5 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN U7 [get_ports {seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]