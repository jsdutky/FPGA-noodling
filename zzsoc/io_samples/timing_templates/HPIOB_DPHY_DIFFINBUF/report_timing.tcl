report_timing -corner Slow  -path_type full_clock_expanded -input_pins -max_paths 30 -setup -hold -to <ToInst_HS> -file ${desName}_setup_hold_Slow.rpt
report_timing -corner Slow  -path_type full_clock_expanded -input_pins -delay_type min_max -max_paths 30 -from <FromInst> -append -file ${desName}_min_max_Slow.rpt
report_timing -corner Fast  -path_type full_clock_expanded -input_pins -max_paths 30 -setup -hold -to <ToInst_HS> -file ${desName}_setup_hold_Fast.rpt
report_timing -corner Fast  -path_type full_clock_expanded -input_pins -delay_type min_max -max_paths 30 -from <FromInst> -append -file ${desName}_min_max_Fast.rpt
