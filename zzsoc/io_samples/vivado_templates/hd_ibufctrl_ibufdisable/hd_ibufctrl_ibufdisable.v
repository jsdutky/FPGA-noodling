// Diablo zynquplus/zynquplus xczu3eg-sbva484 HD bank <IBANK>,
// <DESIGN>,
// hdio_iobpair0

`timescale 1ns/100ps

module <DESIGN> (
	in<IBANK>,
	tin<TBANK>,
	clkin<CBANK>,
	out<OBANK>);

input in<IBANK>;
input tin<TBANK>;
input clkin<CBANK>;
output out<OBANK>;

// Input path
IBUF_IBUFDISABLE #(.IOSTANDARD ("SSTL15")) my_ibuf<IBANK> (.O(d<IBANK>), .I(in<IBANK>), .IBUFDISABLE(ibufdisable<TBANK>)) ;

// Tri-state path
IBUF #(.IOSTANDARD ("SSTL15")) my_tbuf<TBANK> (.O(t<TBANK>), .I(tin<TBANK>)) ;

// Clock in path
IBUFG #(.IOSTANDARD ("SSTL15")) my_ibufclk<CBANK> (.O(ibufclk<CBANK>), .I(clkin<CBANK>)) ;
BUFG my_bufg<CBANK> (.O (gclk<CBANK>), .I (ibufclk<CBANK>)) ;

// Tri-state flop
FD fdt<TBANK> (.Q(ibufdisable<TBANK>), .C(~gclk<CBANK>), .D(t<TBANK>)) ;

// Data flop
FD fd<OBANK> (.Q(q<OBANK>), .C(gclk<CBANK>), .D(d<IBANK>)) ;

// Output path
OBUF #(.IOSTANDARD ("SSTL15"), .SLEW ("FAST")) my_obuf<OBANK> (.I(q<OBANK>), .O(out<OBANK>)) ;

endmodule
