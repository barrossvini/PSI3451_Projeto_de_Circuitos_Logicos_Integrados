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

vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/wisdom_package.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/reg.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/rc_adder.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/rand_num_disc.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/lfsr.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/full_adder.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/d_reg.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/alu.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/reg_bank_disc.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/num_gen_disc.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/fsm_disc.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/disciple_circuit.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/disc_datapath.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/coll_ovf_disc.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/code_gen.vhd}

vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/Testbench/Alert_check.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/Testbench/Alert_gen.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/Testbench/clock_generator.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/Testbench/fifo_1.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/Testbench/message_print.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/Testbench/step_addr_check.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/Testbench/stimuli_disciple.vhd}
vcom -93 -work work {C:/USP/PSI3451_wang/aula_13/Testbench/tb_disciple.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  tb_disciple

do C:/USP/PSI3451_wang/aula_13/Testbench/run_sim.txt
