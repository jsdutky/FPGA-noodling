// Diablo zynquplus/zynquplus xczu3eg-sbva484 HP bank <OBANK>,
// <DESIGN>,
// hpio_iobpair0, hpio_iobsngl_vr2

`timescale 1ns/100ps

module <DESIGN> (
	in<IBANK>,
	tin<TBANK>,
	clkin<CBANK>,
	out<OBANK>p,
	out<OBANK>n);

input in<IBANK>;
input tin<TBANK>;
input clkin<CBANK>;
output out<OBANK>p;
output out<OBANK>n;

// Input path
IBUF #(.IOSTANDARD ("SSTL15")) my_ibuf<IBANK> (.O(d<IBANK>), .I(in<IBANK>)) ;

// Tri-state path
IBUF #(.IOSTANDARD ("SSTL15")) my_tbuf<TBANK> (.O(t<TBANK>), .I(tin<TBANK>)) ;

// Clock in path
IBUFG #(.IOSTANDARD ("SSTL15")) my_ibufclk<CBANK> (.O(ibufclk<CBANK>), .I(clkin<CBANK>)) ;
BUFG my_bufg<CBANK> (.O (gclk<CBANK>), .I (ibufclk<CBANK>)) ;

// Tri-state flop
FD fdt<TBANK> (.Q(ts<TBANK>), .C(~gclk<CBANK>), .D(t<TBANK>)) ;

// Data flop
FD fd<OBANK> (.Q(q<OBANK>), .C(gclk<CBANK>), .D(d<IBANK>)) ;

// Output path
OBUFTDS #(.IOSTANDARD ("<IOSTANDARD>")) my_obuf<OBANK> (.I(q<OBANK>), .T(ts<TBANK>), .O(out<OBANK>p), .OB(out<OBANK>n)) ;

endmodule
