load_library tsmc035_typ
set_working_dir C:/Users/Vinícius/Desktop/USP/PSI3451_wang/aula_9/base_control_1/sintese
read -technology "tsmc035_typ"  { C:/Users/Vinícius/Desktop/USP/PSI3451_wang/aula_9/base_control_1/fonte/wisdom_package.vhd C:/Users/Vinícius/Desktop/USP/PSI3451_wang/aula_9/base_control_1/fonte/counter_trigger.vhd C:/Users/Vinícius/Desktop/USP/PSI3451_wang/aula_9/base_control_1/fonte/fsm_guru.vhd C:/Users/Vinícius/Desktop/USP/PSI3451_wang/aula_9/base_control_1/fonte/fsm_init.vhd C:/Users/Vinícius/Desktop/USP/PSI3451_wang/aula_9/base_control_1/fonte/fsm_main.vhd C:/Users/Vinícius/Desktop/USP/PSI3451_wang/aula_9/base_control_1/fonte/base_control.vhd }
pre_optimize -common_logic -unused_logic -boundary -xor_comparator_optimize 
pre_optimize -extract 
view_schematic -rtl -view
save_project_script C:/Users/Vinícius/Desktop/USP/PSI3451_wang/aula_9/base_control_1/fonte/base_control.scr
set register2register 3.030303
set input2register 3.030303
set register2output 3.030303
optimize .work.base_control.arch -target tsmc035_typ -macro -auto -effort standard -hierarchy auto 
optimize_timing .work.base_control.arch 
view_schematic -view
report_delay -num_paths 1 -show_schematic 1 -critical_paths
report_area area.txt -cell_usage -hierarchy -all_leafs 
set propagate_clock_delay TRUE
report_delay delay.txt -num_paths 1 -critical_paths -show_nets -show_input_pins -clock_frequency
set novendor_constraint_file FALSE
auto_write -format VHDL base_control_gt.vhd
