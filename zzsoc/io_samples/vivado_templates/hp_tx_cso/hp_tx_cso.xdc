set_property PACKAGE_PIN <INPIN> [get_ports in<IBANK>]
set_property ODT RTT_48 [get_ports in<IBANK>]

set_property PACKAGE_PIN <TSPIN> [get_ports tin<TBANK>]
set_property ODT RTT_48 [get_ports tin<TBANK>]

set_property PACKAGE_PIN <CLKPIN> [get_ports clkin<CBANK>]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ibufclk<CBANK>]

set_property LOC SLICE_X4Y234 [get_cells fdt<TBANK>]
set_property LOC SLICE_X4Y233 [get_cells fd<OBANK>]

set_property PACKAGE_PIN <OUTPINP> [get_ports out<OBANK>p]
set_property OUTPUT_IMPEDANCE <OUTPUT_IMPEDANCE> [get_ports out<OBANK>p]

set_property PACKAGE_PIN <OUTPINN> [get_ports out<OBANK>n]
set_property OUTPUT_IMPEDANCE <OUTPUT_IMPEDANCE> [get_ports out<OBANK>n]
