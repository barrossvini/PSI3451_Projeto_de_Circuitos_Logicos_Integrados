library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.wisdom_package.all;

entity tb_fsm_init is

GENERIC (WIDTH: natural :=8);

end tb_fsm_init;

architecture test of tb_fsm_init is

	component fsm_init
		port
	(
	clk				: in STD_LOGIC;			--from system
	rst				: in STD_LOGIC;			--from system
	start_init		: in STD_LOGIC;			--from fsm internal
	ovf_of_y		: in STD_LOGIC;			--from system
	done_init		: out STD_LOGIC; 		--to fsm internal
	flags_2_dp		: out ctrl_2_dp_flags;	--to datapath
	flags_2_mem		: out base_2_mem_flags	--to memory
	);
	end component;

	component stimuli_fsm_init is
		generic
		(
		WIDTH:         NATURAL := 8;
		CLK_PERIOD		: TIME	:=  10ns
		);

		port
		(
	clk				: out STD_LOGIC;			--from system
	rst				: out STD_LOGIC;			--from system
	start_init		: out STD_LOGIC;			--from fsm internal
	ovf_of_y		: out STD_LOGIC			--from system
	);
	end component;

	signal clk_s, rst_s, start_init_s, ovf_of_y_s, done_init_s: STD_LOGIC;
	signal flags_2_dp_s	: ctrl_2_dp_flags;
    signal flags_2_mem_s    : base_2_mem_flags;
begin

	-- Instantiate DUT
	dut : fsm_init
		port map
		(
		clk				=> clk_s,			
		rst				=> rst_s,
		start_init	=> start_init_s,
		ovf_of_y	=> ovf_of_y_s,
		done_init	=> done_init_s,
		flags_2_dp		=> flags_2_dp_s,
		flags_2_mem	=> flags_2_mem_s
		);

	-- Instantiate stimuli generation module
	test : stimuli_fsm_init
		port map
		(
		clk				=> clk_s,			
		rst			=> rst_s,
		start_init	=> start_init_s,
		ovf_of_y	=> ovf_of_y_s
		);

end architecture test;