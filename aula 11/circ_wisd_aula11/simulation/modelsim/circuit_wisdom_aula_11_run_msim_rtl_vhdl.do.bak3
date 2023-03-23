transcript on
if ![file isdirectory vhdl_libs] {
	file mkdir vhdl_libs
}

vlib vhdl_libs/altera
vmap altera ./vhdl_libs/altera
vcom -93 -work altera {c:/altera/10.1/quartus/eda/sim_lib/altera_syn_attributes.vhd}
vcom -93 -work altera {c:/altera/10.1/quartus/eda/sim_lib/altera_standard_functions.vhd}
vcom -93 -work altera {c:/altera/10.1/quartus/eda/sim_lib/alt_dspbuilder_package.vhd}
vcom -93 -work altera {c:/altera/10.1/quartus/eda/sim_lib/altera_europa_support_lib.vhd}
vcom -93 -work altera {c:/altera/10.1/quartus/eda/sim_lib/altera_primitives_components.vhd}
vcom -93 -work altera {c:/altera/10.1/quartus/eda/sim_lib/altera_primitives.vhd}

vlib vhdl_libs/lpm
vmap lpm ./vhdl_libs/lpm
vcom -93 -work lpm {c:/altera/10.1/quartus/eda/sim_lib/220pack.vhd}
vcom -93 -work lpm {c:/altera/10.1/quartus/eda/sim_lib/220model.vhd}

vlib vhdl_libs/sgate
vmap sgate ./vhdl_libs/sgate
vcom -93 -work sgate {c:/altera/10.1/quartus/eda/sim_lib/sgate_pack.vhd}
vcom -93 -work sgate {c:/altera/10.1/quartus/eda/sim_lib/sgate.vhd}

vlib vhdl_libs/altera_mf
vmap altera_mf ./vhdl_libs/altera_mf
vcom -93 -work altera_mf {c:/altera/10.1/quartus/eda/sim_lib/altera_mf_components.vhd}
vcom -93 -work altera_mf {c:/altera/10.1/quartus/eda/sim_lib/altera_mf.vhd}

vlib vhdl_libs/altera_lnsim
vmap altera_lnsim ./vhdl_libs/altera_lnsim
vlog -sv -work altera_lnsim {c:/altera/10.1/quartus/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv}
vcom -93 -work altera_lnsim {c:/altera/10.1/quartus/eda/sim_lib/altera_lnsim_components.vhd}

vlib vhdl_libs/cycloneii
vmap cycloneii ./vhdl_libs/cycloneii
vcom -93 -work cycloneii {c:/altera/10.1/quartus/eda/sim_lib/cycloneii_atoms.vhd}
vcom -93 -work cycloneii {c:/altera/10.1/quartus/eda/sim_lib/cycloneii_components.vhd}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/xor2.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/wisdom_package.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/reg.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/rc_adder_1.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/or2.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/new_alu.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/mem_2port.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/galois.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/full_adder_1.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/step_counter.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/reg_bank -template.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/num_gen_rand.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/num_gen.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/fsm_main.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/fsm_init.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/fsm_guru.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/coll_ovf.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/code_gen.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/circuit_wisdom_aula_11.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/button_handler.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/base_datapath.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/base_control.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/base_circuit.vhd}

vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/clock_generator.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/stimuli_wisdom.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/tb_wisdom.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/wisdom_package.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc" tb_wisdom

do C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 11/circ_wisd_aula11/run_sim.txt
