library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_mem_2port is

GENERIC (WIDTH: natural :=8);

end tb_mem_2port;

architecture test of tb_mem_2port is

component mem_2port IS
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
	--	clock		: IN STD_LOGIC  := '1';
		clock		: IN STD_LOGIC;
		data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
	--	wren_a		: IN STD_LOGIC  := '0';
	--	wren_b		: IN STD_LOGIC  := '0';
		wren_a		: IN STD_LOGIC;
		wren_b		: IN STD_LOGIC;	
		q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;


	component stimuli_mem_2port is
		generic
		(
		WIDTH:         NATURAL := 8;
		CLK_PERIOD		: TIME	:=  10ns
		);

	PORT
	(
		address_a		: OUT STD_LOGIC_VECTOR (WIDTH-3 DOWNTO 0);
		address_b		: OUT STD_LOGIC_VECTOR (WIDTH-3 DOWNTO 0);
		clock		: OUT STD_LOGIC  ;
		data_a		: OUT STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
		data_b		: OUT STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
		wren_a		: OUT STD_LOGIC  ;
		wren_b		: OUT STD_LOGIC 
	);
	
END component;


	signal address_a_s, address_b_s: STD_LOGIC_VECTOR (WIDTH-3 DOWNTO 0);
	signal clk_s, wren_a_s, wren_b_s:  STD_LOGIC ;
	signal data_a_s, data_b_s, q_a_s, q_b_s: STD_LOGIC_VECTOR (width-1 DOWNTO 0);

begin

	-- Instantiate mem_2port
	dut : mem_2port
		port map
		(
		address_a		=> 	address_a_s,
		address_b		=> 	address_b_s,
		clock		=> clk_s  ,
		data_a		=> 	data_a_s,
		data_b		=> 	data_b_s,
		wren_a		=> 	wren_a_s,
		wren_b		=> 	wren_b_s,
		q_a		=>   q_a_s,
		q_b		=>   q_b_s
			);

	-- Instantiate stimuli generation module
	stimuli : stimuli_mem_2port
		port map
		(
		address_a		=> 	address_a_s,
		address_b		=> 	address_b_s,
		clock		=> clk_s  ,
		data_a		=> 	data_a_s,
		data_b		=> 	data_b_s,
		wren_a		=> 	wren_a_s,
		wren_b		=> 	wren_b_s
			);

end architecture test;