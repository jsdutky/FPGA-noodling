set_property PACKAGE_PIN <INPIN> [get_ports in<IBANK>]

set_property PACKAGE_PIN <CLKPIN> [get_ports clkin<CBANK>]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ibufclk<CBANK>]

set_property LOC SLICE_X4Y233 [get_cells fd<OBANK>]

set_property PACKAGE_PIN <OUTPIN> [get_ports out<OBANK>]
set_property OUTPUT_IMPEDANCE RDRV_48_48 [get_ports out<OBANK>]
