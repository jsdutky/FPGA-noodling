set_property PACKAGE_PIN <INPINP> [get_ports in<IBANK>p]
set_property PACKAGE_PIN <INPINN> [get_ports in<IBANK>n]

set_property PACKAGE_PIN <CLKPIN> [get_ports clkin<CBANK>]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ibufclk<CBANK>]

set_property LOC SLICE_X4Y233 [get_cells fd<OBANK>]
set_property INTERNAL_VREF <VREF> [get_iobanks <CBANK>]

set_property PACKAGE_PIN <OUTPIN> [get_ports out<OBANK>]
