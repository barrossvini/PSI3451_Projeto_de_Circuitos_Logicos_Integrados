library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_lfsr is

GENERIC (
	WIDTH: natural :=12 
);

end tb_lfsr;

architecture test of tb_lfsr is

	component lfsr
		generic
	(
	WIDTH	: natural := 12
	);
	port
	(
	Q		:	out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
	clk				: in STD_LOGIC;			
	rst				: in STD_LOGIC	
	);
	
	
	end component;

	component stimuli_lfsr is
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
signal Q_s : STD_LOGIC_VECTOR (WIDTH-1 downto 0);

begin

	-- Instantiate DUT
	dut : lfsr 
		port map
		(
		Q               => Q_s,
		clk				=> clk_s,			
		rst				=> rst_s
		);

	-- Instantiate stimuli generation module
	test : stimuli_lfsr
		port map
		(
		clk				=> clk_s,	
		rst				=> rst_s
		);

end architecture test;