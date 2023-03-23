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

vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 8/mem_2port/mem_2port.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 8/mem_2port/mem_quartus.vhd}

vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 8/mem_2port/testbench_mem_2port.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 8/mem_2port/stimuli_mem_2port.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 8/mem_2port/mem_quartus.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 8/mem_2port/mem_2port.vhd}
vcom -93 -work work {C:/Users/Vinícius/Desktop/USP/PSI3451 (WANG)/aula 8/mem_2port/clock_generator.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc" tb_mem_2port

add wave *
view structure
view signals
run 100 ns
