// Diablo zynquplus/zynquplus xczu3eg-sbva484 HD bank <IOBANK>,
// <DESIGN>,
// hdio_iobpair0

`timescale 1ns/100ps

module <DESIGN> (
	io<IOBANK>,
	tin<TBANK>,
	clkin<CBANK>);

inout io<IOBANK>;
input tin<TBANK>;
input clkin<CBANK>;

// Tri-state path
IBUF #(.IOSTANDARD ("SSTL15")) my_tbuf<TBANK> (.O(t<TBANK>), .I(tin<TBANK>)) ;

// Clock in path
IBUFG #(.IOSTANDARD ("SSTL15")) my_ibufclk<CBANK> (.O(ibufclk<CBANK>), .I(clkin<CBANK>)) ;
BUFG my_bufg<CBANK> (.O (gclk<CBANK>), .I (ibufclk<CBANK>)) ;

// Tri-state flop
FD fdt<TBANK> (.Q(ts<TBANK>), .C(~gclk<CBANK>), .D(t<TBANK>)) ;

// Data flop
FD fd<IOBANK> (.Q(q<IOBANK>), .C(gclk<CBANK>), .D(d<IOBANK>)) ;

// Input/Output path
IOBUF #(.IOSTANDARD ("SSTL15"), .SLEW ("FAST")) my_iobuf<IOBANK> (.I(q<IOBANK>), .T(ts<TBANK>), .O(d<IOBANK>), .IO(io<IOBANK>)) ;

endmodule
