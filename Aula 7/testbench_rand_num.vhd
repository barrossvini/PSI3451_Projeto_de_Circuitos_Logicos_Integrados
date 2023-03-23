library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_rand_num is

GENERIC (
	WIDTH: natural :=12 
);

end tb_rand_num;

architecture test of tb_rand_num is

	component rand_num
	 generic
	(
	WIDTH	: natural := 12
	);
	port
	(
	clk  : in  STD_LOGIC;
	rst: in  STD_LOGIC;
	Q0    : out  STD_LOGIC;
	Q1	 : out STD_LOGIC
	);
	
	
	end component;

	component stimuli_rand_num is
        generic
	(
	WIDTH	: natural := 12
	);
	port
	(
	clk				: out STD_LOGIC;			
	rst				: out STD_LOGIC	
	);
	end component;

-- sinais
signal clk_s, rst_s : STD_LOGIC;
signal Q0_s : STD_LOGIC;
signal Q1_s : STD_LOGIC;

begin

	-- Instantiate DUT
	dut : rand_num
		port map
		(
		clk				=> clk_s,			
		rst				=> rst_s,
		Q0				=> Q0_s,
		Q1				=> Q1_s
		);

	-- Instantiate stimuli generation module
	test : stimuli_rand_num
		port map
		(
		clk				=> clk_s,	
		rst				=> rst_s
		);

end architecture test;