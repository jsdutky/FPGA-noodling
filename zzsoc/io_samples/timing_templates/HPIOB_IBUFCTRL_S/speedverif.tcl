set_param dlyest.reportBeldelays 1
open_checkpoint <AteDir>/<AteDesign>/<AteDesign>_post_route.dcp
config_timing_analysis -disable_flight_delays true
set desName [regsub {_post_route} [regsub {checkpoint_} [get_design] {}] {} ]
create_clock -period 2.00 -name clk [get_ports <AteClkPin>]
set myclk [get_cell <AteClkInst>]
set myclkStd [get_property IOSTANDARD $myclk]
puts "Checkpoint name is $desName, clk std is $myclkStd"

#write_bitstream -force -raw_bitfile $desName.bit

