set_property PACKAGE_PIN <TSPIN> [get_ports tin<TBANK>]
set_property ODT RTT_48 [get_ports tin<TBANK>]

set_property PACKAGE_PIN <CLKPIN> [get_ports clkin<CBANK>]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ibufclk<CBANK>]

set_property LOC SLICE_X4Y234 [get_cells fdt<TBANK>]
set_property LOC SLICE_X4Y233 [get_cells fd<IOBANK>]

set_property PACKAGE_PIN <IOUTPIN> [get_ports io<IOBANK>]
set_property OUTPUT_IMPEDANCE RDRV_48_48 [get_ports io<IOBANK>]
