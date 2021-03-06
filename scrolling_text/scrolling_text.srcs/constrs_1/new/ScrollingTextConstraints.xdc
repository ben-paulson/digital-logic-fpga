# Map 'clk' input to 100MHz clock
set_property PACKAGE_PIN W5 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# Map write input to switch 2
set_property PACKAGE_PIN W16 [get_ports {write}]
set_property IOSTANDARD LVCMOS33 [get_ports {write}]

# Map start input to switch 1
set_property PACKAGE_PIN V16 [get_ports {start}]
set_property IOSTANDARD LVCMOS33 [get_ports {start}]

# Map reset input to switch 0
set_property PACKAGE_PIN V17 [get_ports {reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

# Map speed input to switches 6-4

set_property PACKAGE_PIN V2 [get_ports {speed[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {speed[5]}]

set_property PACKAGE_PIN W13 [get_ports {speed[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {speed[4]}]

set_property PACKAGE_PIN W14 [get_ports {speed[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {speed[3]}]

set_property PACKAGE_PIN V15 [get_ports {speed[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {speed[2]}]

set_property PACKAGE_PIN W15 [get_ports {speed[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {speed[1]}]

set_property PACKAGE_PIN W17 [get_ports {speed[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {speed[0]}]

# Set code input switches to leftmost switches 15-9

set_property PACKAGE_PIN R2 [get_ports {code[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[6]}]

set_property PACKAGE_PIN T1 [get_ports {code[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[5]}]

set_property PACKAGE_PIN U1 [get_ports {code[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[4]}]

set_property PACKAGE_PIN W2 [get_ports {code[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[3]}]

set_property PACKAGE_PIN R3 [get_ports {code[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[2]}]

set_property PACKAGE_PIN T2 [get_ports {code[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[1]}]

set_property PACKAGE_PIN T3 [get_ports {code[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[0]}]

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