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

// HS Tri-state flop
FD fdt_hs<TBANK> (.Q(ts_hs<TBANK>), .C(~gclk<CBANK>), .D(t<TBANK>)) ;

// LP Tri-state flop
FD fdt_lp<TBANK> (.Q(ts_lp<TBANK>), .C(~gclk<CBANK>), .D(t<TBANK>)) ;

// HS Data flop
FD fd_hs<OBANK> (.Q(q_hs<OBANK>), .C(gclk<CBANK>), .D(d<IBANK>)) ;

// LP Data flop
FD fd_lp<OBANK> (.Q(q_lp<OBANK>), .C(gclk<CBANK>), .D(d<IBANK>)) ;

// Output path
OBUFDS_DPHY #(.IOSTANDARD ("<IOSTANDARD>")) my_obuf<OBANK> (.HSTX_I(q_hs<OBANK>),
							.LPTX_I_P(q_lp<OBANK>), .LPTX_I_N(~q_lp<OBANK>),
							.LPTX_T(ts_lp<TBANK>), .HSTX_T(ts_hs<TBANK>),
							.O(out<OBANK>p), .OB(out<OBANK>n)) ;

endmodule
