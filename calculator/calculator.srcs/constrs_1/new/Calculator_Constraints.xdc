# Map input A to rightmost switches 4-0

set_property PACKAGE_PIN W15 [get_ports {A[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[4]}]

set_property PACKAGE_PIN W17 [get_ports {A[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[3]}]

set_property PACKAGE_PIN W16 [get_ports {A[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[2]}]

set_property PACKAGE_PIN V16 [get_ports {A[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[1]}]

set_property PACKAGE_PIN V17 [get_ports {A[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[0]}]

# Map input B to switches 10-6

set_property PACKAGE_PIN T2 [get_ports {B[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[4]}]

set_property PACKAGE_PIN T3 [get_ports {B[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[3]}]

set_property PACKAGE_PIN V2 [get_ports {B[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[2]}]

set_property PACKAGE_PIN W13 [get_ports {B[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[1]}]

set_property PACKAGE_PIN W14 [get_ports {B[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[0]}]

# Map 'sub' input to switch 15
set_property PACKAGE_PIN R2 [get_ports {sub}]
set_property IOSTANDARD LVCMOS33 [get_ports {sub}]

# Map 'neg' output to LED 10
set_property PACKAGE_PIN W3 [get_ports {neg}]
set_property IOSTANDARD LVCMOS33 [get_ports {neg}]

# Map 'valid' output to LED 15
set_property PACKAGE_PIN L1 [get_ports {valid}]
set_property IOSTANDARD LVCMOS33 [get_ports {valid}]

# Map 'clk' input to 100MHz clock
set_property PACKAGE_PIN W5 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# Map output twoc to LEDs 4-0

set_property PACKAGE_PIN W18 [get_ports {twoc[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {twoc[4]}]

set_property PACKAGE_PIN V19 [get_ports {twoc[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {twoc[3]}]

set_property PACKAGE_PIN U19 [get_ports {twoc[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {twoc[2]}]

set_property PACKAGE_PIN E19 [get_ports {twoc[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {twoc[1]}]

set_property PACKAGE_PIN U16 [get_ports {twoc[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {twoc[0]}]

# Map "an" output to 7-segment anodes

set_property PACKAGE_PIN W4 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

set_property PACKAGE_PIN V4 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]

set_property PACKAGE_PIN U4 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

# Map "seg" output to the correct LED in the 7-segment display

set_property PACKAGE_PIN W7 [get_ports {seg[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[7]}]

set_property PACKAGE_PIN W6 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

set_property PACKAGE_PIN U8 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]

set_property PACKAGE_PIN V8 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN U5 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN V5 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]

set_property PACKAGE_PIN U7 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN V7 [get_ports {seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]