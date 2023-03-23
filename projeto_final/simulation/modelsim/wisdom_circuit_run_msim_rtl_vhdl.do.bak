transcript on
if ![file isdirectory vhdl_libs] {
	file mkdir vhdl_libs
}

vlib vhdl_libs/altera
vmap altera ./vhdl_libs/altera
vcom -93 -work altera {c:/intelfpga/18.1/quartus/eda/sim_lib/altera_syn_attributes.vhd}
vcom -93 -work altera {c:/intelfpga/18.1/quartus/eda/sim_lib/altera_standard_functions.vhd}
vcom -93 -work altera {c:/intelfpga/18.1/quartus/eda/sim_lib/alt_dspbuilder_package.vhd}
vcom -93 -work altera {c:/intelfpga/18.1/quartus/eda/sim_lib/altera_europa_support_lib.vhd}
vcom -93 -work altera {c:/intelfpga/18.1/quartus/eda/sim_lib/altera_primitives_components.vhd}
vcom -93 -work altera {c:/intelfpga/18.1/quartus/eda/sim_lib/altera_primitives.vhd}

vlib vhdl_libs/lpm
vmap lpm ./vhdl_libs/lpm
vcom -93 -work lpm {c:/intelfpga/18.1/quartus/eda/sim_lib/220pack.vhd}
vcom -93 -work lpm {c:/intelfpga/18.1/quartus/eda/sim_lib/220model.vhd}

vlib vhdl_libs/sgate
vmap sgate ./vhdl_libs/sgate
vcom -93 -work sgate {c:/intelfpga/18.1/quartus/eda/sim_lib/sgate_pack.vhd}
vcom -93 -work sgate {c:/intelfpga/18.1/quartus/eda/sim_lib/sgate.vhd}

vlib vhdl_libs/altera_mf
vmap altera_mf ./vhdl_libs/altera_mf
vcom -93 -work altera_mf {c:/intelfpga/18.1/quartus/eda/sim_lib/altera_mf_components.vhd}
vcom -93 -work altera_mf {c:/intelfpga/18.1/quartus/eda/sim_lib/altera_mf.vhd}

vlib vhdl_libs/altera_lnsim
vmap altera_lnsim ./vhdl_libs/altera_lnsim
vlog -sv -work altera_lnsim {c:/intelfpga/18.1/quartus/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv}
vcom -93 -work altera_lnsim {c:/intelfpga/18.1/quartus/eda/sim_lib/altera_lnsim_components.vhd}

vlib vhdl_libs/cyclonev
vmap cyclonev ./vhdl_libs/cyclonev
vlog -vlog01compat -work cyclonev {c:/intelfpga/18.1/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vcom -93 -work cyclonev {c:/intelfpga/18.1/quartus/eda/sim_lib/cyclonev_atoms.vhd}
vcom -93 -work cyclonev {c:/intelfpga/18.1/quartus/eda/sim_lib/cyclonev_components.vhd}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/xor2.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/wisdom_package.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/reg.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/referee.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/rc_adder.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/rand_num_disc.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/or2.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/mem_2port.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/lfsr.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/holder.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/galois_2bits.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/full_adder.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/d_reg.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/counter_trigger.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/alu.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/wisdom_circuit.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/step_counter.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/reg_bank_disc.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/reg_bank.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/rand_num.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/num_gen_disc.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/num_gen.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/fsm_main.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/fsm_init.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/fsm_guru.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/fsm_disc.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/disciple_circuit.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/disc_datapath.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/coll_ovf_disc.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/coll_ovf.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/code_gen.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/button_handler.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/base_datapath.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/base_control.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/base_circuit_extended.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/base_circuit.vhd}

vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/tb_global/address_counter.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/tb_global/clock_generator.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/tb_global/map_monitor.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/tb_global/stimuli_wisdom.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/projeto_final/tb_global/tb_wisdom.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  tb_wisdom

do C:/USP/PSI3451_wang/projeto_final/tb_global/run_sim.txt
