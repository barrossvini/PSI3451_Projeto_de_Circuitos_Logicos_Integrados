library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Use work.wisdom_package.all;

entity tb_mem_2port is

GENERIC (WIDTH: natural :=8);

end tb_mem_2port;

architecture test of tb_mem_2port is

	component mem_2port
	PORT
	(
		clock				: IN STD_LOGIC  ;
		base_2_mem_a		: IN base_2_mem_flags;
		data_out_2_base_a	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		disc_2_mem_b		: IN base_2_mem_flags;
		data_out_2_disc_b	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;

	component stimuli_mem_2port is
		generic
		(
		WIDTH:         NATURAL := 8;
		CLK_PERIOD		: TIME	:=  10ns
		);

		port
	(
		clock				: OUT STD_LOGIC  ;
		base_2_mem_a		: OUT base_2_mem_flags;
		data_out_2_base_a	: IN STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
		disc_2_mem_b		: OUT base_2_mem_flags;
		data_out_2_disc_b	: IN STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0)
	);
	end component;

	signal address_a_s, address_b_s: STD_LOGIC_VECTOR (5 DOWNTO 0);
	signal clk_s, wren_a_s, wren_b_s:  STD_LOGIC ;
	signal data_a_s, data_b_s, q_a_s, q_b_s: STD_LOGIC_VECTOR (width-1 DOWNTO 0);

begin

	-- Instantiate mem_2port
	dut : mem_2port
		port map
		(
		clock				=> clk_s  ,
		base_2_mem_a.mem_wr_en	=> 		wren_a_s,
		base_2_mem_a.mem_addr	=> 	address_a_s,
		base_2_mem_a.data_in	=> 	data_a_s,
		data_out_2_base_a		=>   q_a_s,
		disc_2_mem_b.mem_wr_en	=> 	wren_b_s,
		disc_2_mem_b.mem_addr	=> 	address_b_s,
		disc_2_mem_b.data_in	=> 	data_b_s,
		data_out_2_disc_b		=>   q_b_s
			);

	-- Instantiate stimuli generation module
	stimuli : stimuli_mem_2port
		port map
		(
		clock				=> clk_s  ,
		base_2_mem_a.mem_wr_en	=> 		wren_a_s,
		base_2_mem_a.mem_addr	=> 	address_a_s,
		base_2_mem_a.data_in	=> 	data_a_s,
		data_out_2_base_a		=>   q_a_s,
		disc_2_mem_b.mem_wr_en	=> 	wren_b_s,
		disc_2_mem_b.mem_addr	=> 	address_b_s,
		disc_2_mem_b.data_in	=> 	data_b_s,
		data_out_2_disc_b		=>   q_b_s
			);

end architecture test;