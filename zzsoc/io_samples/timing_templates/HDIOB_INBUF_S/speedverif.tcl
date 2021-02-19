set_param dlyest.reportBeldelays 1
open_checkpoint <AteDir>/<AteDesign>/<AteDesign>_post_route.dcp
config_timing_analysis -disable_flight_delays true
set desName [regsub {_post_route} [regsub {checkpoint_} [get_design] {}] {} ]
create_clock -period 2.00 -name clk [get_ports <AteInputPin>]
set myclk [get_cell my_ibufclk48]
set myclkStd [get_property IOSTANDARD $myclk]
set myIOInst <FromInst>
set myIOBel [get_property BEL [get_cells $myIOInst]]
set myIOSite [get_property SITE [get_cells $myIOInst]]
puts "Checkpoint name is $desName, clk std is $myclkStd"

set fh [open iobuffer.instName w]
puts $fh $myIOInst
close $fh

source report_timing.tcl

#write_bitstream -force -raw_bitfile $desName.bit

