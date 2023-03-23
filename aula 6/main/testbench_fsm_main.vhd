library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.wisdom_package.all;

entity tb_fsm_main is

GENERIC (WIDTH: natural :=8);

end tb_fsm_main;

architecture test of tb_fsm_main is

	component fsm_main 
		port
		(
		clk				: in STD_LOGIC;			--from system
		res				: in STD_LOGIC;			--from system
		fsm_i_done		: in STD_LOGIC;			--from fsm internal
		end_of_guru		: in STD_LOGIC;			--from datapath	
		end_of_disc		: in STD_LOGIC;			--from system; disciple circuit
		duo_formed		: in STD_LOGIC;			--from datapath
		fsm_i_start		: out STD_LOGIC;		--to fsm internal
		fsm_s_start		: out STD_LOGIC;		--to fsm internal
		con_sel			: out CONTROL_SELECT	--to fsm internal
		);
	end component;

	component stimuli_fsm_main is
		generic
		(
		WIDTH:         NATURAL := 8;
		CLK_PERIOD		: TIME	:=  10ns
		);

		port
		(
		clk				: out STD_LOGIC;			--system generatiom
		rst				: out STD_LOGIC;			--system generatiom
		fsm_i_done		: out STD_LOGIC;			--emulatimg fsm_init
		end_of_guru		: out STD_LOGIC;			--emulatimg datapath	
		end_of_disc		: out STD_LOGIC;			--emulatimg disciple circuit
		duo_formed		: out STD_LOGIC;			--emulatimg datapath
		fsm_i_start		: in STD_LOGIC;				--emulating fsm_init
		fsm_s_start		: in STD_LOGIC;				--emulating fsm_init guru or disciple step machines 
		con_sel			: in CONTROL_SELECT			--emulating the mux selector
		);
	end component;

	signal clk_s, rst_s, fsm_i_done_s, end_of_guru_s, end_of_disc_s, duo_formed_s: STD_LOGIC;
	signal fsm_i_start_s, fsm_s_start_s: STD_LOGIC :='0';
	signal con_sel_s	: CONTROL_SELECT;

begin

	-- Instantiate DUT
	dut : fsm_main 
		port map
		(
		clk				=> clk_s,			
		res				=> rst_s,
		fsm_i_done		=> fsm_i_done_s,
		end_of_guru		=> end_of_guru_s,
		end_of_disc		=> end_of_disc_s,
		duo_formed		=> duo_formed_s,
		fsm_i_start		=> fsm_i_start_s,
		fsm_s_start		=> fsm_s_start_s,
		con_sel			=> con_sel_s
		);

	-- Instantiate stimuli generation module
	test : stimuli_fsm_main
		port map
		(
		clk				=> clk_s,	
		rst				=> rst_s,
		fsm_i_done		=> fsm_i_done_s,
		end_of_guru		=> end_of_guru_s,
		end_of_disc		=> end_of_disc_s,
		duo_formed		=> duo_formed_s,
		fsm_i_start		=> fsm_i_start_s,
		fsm_s_start		=> fsm_s_start_s,
		con_sel			=> con_sel_s
		);

end architecture test;