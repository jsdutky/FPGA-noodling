// Diablo zynquplus/zynquplus xczu3eg-sbva484 HP bank <IBANK>,
// <DESIGN>,
// hpio_iobpair0, hpio_iobsngl_vr2

`timescale 1ns/100ps

module <DESIGN> (
	in<IBANK>,
	clkin<CBANK>,
	out<OBANK>);

input in<IBANK>;
input clkin<CBANK>;
output out<OBANK>;

// Input path
IBUF #(.IOSTANDARD ("<IOSTANDARD>")) my_ibuf<IBANK> (.O(d<IBANK>), .I(in<IBANK>)) ;

// Clock in path
IBUFG #(.IOSTANDARD ("SSTL15")) my_ibufclk<CBANK> (.O(ibufclk<CBANK>), .I(clkin<CBANK>)) ;
BUFG my_bufg<CBANK> (.O (gclk<CBANK>), .I (ibufclk<CBANK>)) ;

// Data flop
FD fd<OBANK> (.Q(q<OBANK>), .C(gclk<CBANK>), .D(d<IBANK>)) ;

// Output path
OBUF #(.IOSTANDARD ("SSTL15"), .SLEW ("FAST")) my_obuf<OBANK> (.I(q<OBANK>), .O(out<OBANK>)) ;

endmodule
