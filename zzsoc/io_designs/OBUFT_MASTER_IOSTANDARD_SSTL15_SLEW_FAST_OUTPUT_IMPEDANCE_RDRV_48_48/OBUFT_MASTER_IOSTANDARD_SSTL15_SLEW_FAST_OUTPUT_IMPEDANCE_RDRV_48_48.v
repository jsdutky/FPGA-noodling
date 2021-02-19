// Diablo zynquplus/zynquplus xczu3eg-sbva484 HP bank 64,
// OBUFT_MASTER_IOSTANDARD_SSTL15_SLEW_FAST_OUTPUT_IMPEDANCE_RDRV_48_48,
// hpio_iobpair0, hpio_iobsngl_vr2

`timescale 1ns/100ps

module OBUFT_MASTER_IOSTANDARD_SSTL15_SLEW_FAST_OUTPUT_IMPEDANCE_RDRV_48_48 (
	in65,
	tin65,
	clkin65,
	out64);

input in65;
input tin65;
input clkin65;
output out64;

// Input path
IBUF #(.IOSTANDARD ("SSTL15")) my_ibuf65 (.O(d65), .I(in65)) ;

// Tri-state path
IBUF #(.IOSTANDARD ("SSTL15")) my_tbuf65 (.O(t65), .I(tin65)) ;

// Clock in path
IBUFG #(.IOSTANDARD ("SSTL15")) my_ibufclk65 (.O(ibufclk65), .I(clkin65)) ;
BUFG my_bufg65 (.O (gclk65), .I (ibufclk65)) ;

// Tri-state flop
FD fdt65 (.Q(ts65), .C(~gclk65), .D(t65)) ;

// Data flop
FD fd64 (.Q(q64), .C(gclk65), .D(d65)) ;

// Output path
OBUFT #(.IOSTANDARD ("SSTL15"), .SLEW ("FAST")) my_obuf64 (.I(q64), .T(ts65), .O(out64)) ;

endmodule
