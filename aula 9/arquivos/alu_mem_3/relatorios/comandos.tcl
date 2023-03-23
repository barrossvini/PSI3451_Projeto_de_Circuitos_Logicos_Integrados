load_library tsmc035_typ
set_working_dir "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/síntese"
read -technology "tsmc035_typ"  { "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/alu_1.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/alu_mem.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/full_adder_1.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/mem_2port.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/mem_quartus_rtl.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/rc_adder_2.vhd" }
pre_optimize -common_logic -unused_logic -boundary -xor_comparator_optimize 
pre_optimize -extract 
set register2register 2.500000
set input2register 2.500000
set register2output 2.500000
optimize .work.alu_mem.add_mux -target tsmc035_typ -macro -auto -effort standard -hierarchy auto 
optimize_timing .work.alu_mem.add_mux 
report_area "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/relatorios/area2" -cell_usage -all_leafs 
set propagate_clock_delay TRUE
report_delay "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/relatorios/delay2" -num_paths 1 -critical_paths -show_nets -show_input_pins -clock_frequency
set_working_dir "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_3/síntese"
read -technology "tsmc035_typ"  { "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/alu_1.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/alu_mem.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/full_adder_1.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/mem_2port.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/mem_quartus_rtl.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/rc_adder_2.vhd" }
pre_optimize -common_logic -unused_logic -boundary -xor_comparator_optimize 
pre_optimize -extract 
load_library tsmc025_typ
read -technology "tsmc025_typ"  { "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/alu_1.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/alu_mem.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/full_adder_1.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/mem_2port.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/mem_quartus_rtl.vhd" "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_1/fonte/rc_adder_2.vhd" }
pre_optimize -common_logic -unused_logic -boundary -xor_comparator_optimize 
pre_optimize -extract 
optimize .work.alu_mem.add_mux -target tsmc025_typ -macro -auto -effort standard -hierarchy auto 
optimize_timing .work.alu_mem.add_mux 
report_area "C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 9/alu_mem_3/relatorios/area" -cell_usage -all_leafs 
set novendor_constraint_file FALSE
auto_write alu_mem_gt.vhd
