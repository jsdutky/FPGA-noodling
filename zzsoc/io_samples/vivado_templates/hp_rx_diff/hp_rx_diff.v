// Diablo zynquplus/zynquplus xczu3eg-sbva484 HP bank <IBANK>,
// <DESIGN>,
// hpio_iobpair0

`timescale 1ns/100ps

module <DESIGN> (
	in<IBANK>p,
	in<IBANK>n,
	clkin<CBANK>,
	out<OBANK>,
	outb<OBANK>);

input in<IBANK>p;
input in<IBANK>n;
input clkin<CBANK>;
output out<OBANK>;
output outb<OBANK>;

// Input path
IBUFDS_DIFF_OUT #(.IOSTANDARD ("<IOSTANDARD>")) my_ibuf<IBANK> (.O(d<IBANK>), .OB(db<IBANK>), .I(in<IBANK>p), .IB(in<IBANK>n)) ;

// Clock in path
IBUFG #(.IOSTANDARD ("SSTL15")) my_ibufclk<CBANK> (.O(ibufclk<CBANK>), .I(clkin<CBANK>)) ;
BUFG my_bufg<CBANK> (.O (gclk<CBANK>), .I (ibufclk<CBANK>)) ;

// Data flop
FD fd<OBANK> (.Q(q<OBANK>), .C(gclk<CBANK>), .D(d<IBANK>)) ;
FD fdb<OBANK> (.Q(qb<OBANK>), .C(gclk<CBANK>), .D(db<IBANK>)) ;

// Output path
OBUF #(.IOSTANDARD ("SSTL15"), .SLEW ("FAST")) my_obuf<OBANK> (.I(q<OBANK>), .O(out<OBANK>)) ;
OBUF #(.IOSTANDARD ("SSTL15"), .SLEW ("FAST")) my_obufb<OBANK> (.I(qb<OBANK>), .O(outb<OBANK>)) ;

endmodule
