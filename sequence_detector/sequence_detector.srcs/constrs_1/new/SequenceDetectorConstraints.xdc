# Map input code to rightmost switches 4-0

set_property PACKAGE_PIN W15 [get_ports {code[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[4]}]

set_property PACKAGE_PIN W17 [get_ports {code[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[3]}]

set_property PACKAGE_PIN W16 [get_ports {code[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[2]}]

set_property PACKAGE_PIN V16 [get_ports {code[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[1]}]

set_property PACKAGE_PIN V17 [get_ports {code[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {code[0]}]

# Map output state indicator to LEDs 4-0

set_property PACKAGE_PIN W18 [get_ports {st_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {st_out[4]}]

set_property PACKAGE_PIN V19 [get_ports {st_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {st_out[3]}]

set_property PACKAGE_PIN U19 [get_ports {st_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {st_out[2]}]

set_property PACKAGE_PIN E19 [get_ports {st_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {st_out[1]}]

set_property PACKAGE_PIN U16 [get_ports {st_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {st_out[0]}]

# Map 'blink' output to LEDs 8-6

set_property PACKAGE_PIN V13 [get_ports {blink[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blink[2]}]

set_property PACKAGE_PIN V14 [get_ports {blink[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blink[1]}]

set_property PACKAGE_PIN U14 [get_ports {blink[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blink[0]}]

# Map 'clk' input to 100MHz clock
set_property PACKAGE_PIN W5 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# Map reset input to switch 15
set_property PACKAGE_PIN R2 [get_ports {reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
