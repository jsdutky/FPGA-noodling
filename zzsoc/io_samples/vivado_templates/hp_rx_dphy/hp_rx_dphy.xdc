set_property PACKAGE_PIN <INPINP> [get_ports in<IBANK>p]
set_property PACKAGE_PIN <INPINN> [get_ports in<IBANK>n]

set_property PACKAGE_PIN <CLKPIN> [get_ports clkin<CBANK>]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ibufclk<CBANK>]

set_property LOC SLICE_X4Y233 [get_cells fd_hs<OBANK>]
set_property LOC SLICE_X4Y233 [get_cells fd_lp_p<OBANK>]
set_property LOC SLICE_X4Y233 [get_cells fd_lp_n<OBANK>]

set_property PACKAGE_PIN <OUTPINHS> [get_ports out_hs<OBANK>]
set_property OUTPUT_IMPEDANCE RDRV_48_48 [get_ports out_hs<OBANK>]
set_property PACKAGE_PIN <OUTPINLPP> [get_ports out_lp_p<OBANK>]
set_property OUTPUT_IMPEDANCE RDRV_48_48 [get_ports out_lp_p<OBANK>]
set_property PACKAGE_PIN <OUTPINLPN> [get_ports out_lp_n<OBANK>]
set_property OUTPUT_IMPEDANCE RDRV_48_48 [get_ports out_lp_n<OBANK>]
