// Diablo zynquplus/zynquplus xczu3eg-sbva484 HP bank <IBANK>,
// <DESIGN>,
// hpio_iobpair0

`timescale 1ns/100ps

module <DESIGN> (
	in<IBANK>p,
	in<IBANK>n,
	clkin<CBANK>,
	out_hs<OBANK>,
	out_lp_p<OBANK>,
	out_lp_n<OBANK>);

input in<IBANK>p;
input in<IBANK>n;
input clkin<CBANK>;
output out_hs<OBANK>;
output out_lp_p<OBANK>;
output out_lp_n<OBANK>;

// Input path
IBUFDS_DPHY #(.IOSTANDARD ("<IOSTANDARD>")) my_ibuf<IBANK> (.HSRX_O(d<IBANK>),
							.LPRX_O_P(dphy_lprx_o_<IBANK>p),
							.LPRX_O_N(dphy_lprx_o_<IBANK>n),
							.I(in<IBANK>p), .IB(in<IBANK>n),
							.HSRX_DISABLE(1'b0), .LPRX_DISABLE(1'b0)) ;

// Clock in path
IBUFG #(.IOSTANDARD ("SSTL15")) my_ibufclk<CBANK> (.O(ibufclk<CBANK>), .I(clkin<CBANK>)) ;
BUFG my_bufg<CBANK> (.O (gclk<CBANK>), .I (ibufclk<CBANK>)) ;

// HS Data flop
FD fd_hs<OBANK> (.Q(q_hs<OBANK>), .C(gclk<CBANK>), .D(d<IBANK>)) ;

// LP P Data flop
FD fd_lp_p<OBANK> (.Q(q_lp_p<OBANK>), .C(gclk<CBANK>), .D(dphy_lprx_o_<IBANK>p)) ;

// LP N Data flop
FD fd_lp_n<OBANK> (.Q(q_lp_n<OBANK>), .C(gclk<CBANK>), .D(dphy_lprx_o_<IBANK>n)) ;

// Output path
OBUF #(.IOSTANDARD ("SSTL15"), .SLEW ("FAST")) my_obuf_hs<OBANK> (.I(q_hs<OBANK>), .O(out_hs<OBANK>)) ;

// Output path
OBUF #(.IOSTANDARD ("SSTL15"), .SLEW ("FAST")) my_obuf_lp_p<OBANK> (.I(q_lp_p<OBANK>), .O(out_lp_p<OBANK>)) ;

// Output path
OBUF #(.IOSTANDARD ("SSTL15"), .SLEW ("FAST")) my_obuf_lp_n<OBANK> (.I(q_lp_n<OBANK>), .O(out_lp_n<OBANK>)) ;

endmodule
