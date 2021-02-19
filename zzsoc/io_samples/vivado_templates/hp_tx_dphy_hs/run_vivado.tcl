set device [get_parts -regexp xczu3eg-sbva484-1-e]
set design <DESIGN>

read_verilog <DESIGN>.v
read_xdc     <DESIGN>.xdc

synth_design -top <DESIGN> -part $device -flatten_hierarchy none
place_design
route_design
write_checkpoint -force ./<DESIGN>_post_route.dcp