library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- teste para o lsfr galois
entity stimuli_lfsr is
		generic
	(
	CLK_PERIOD		: TIME	:= 10ns;
	WIDTH	: natural := 12
	);
	port
	(
	clk				: out STD_LOGIC;			
	rst				: out STD_LOGIC	
	);

end stimuli_lfsr ;

architecture test of stimuli_lfsr is
	signal clk_s : STD_LOGIC;

	component clock_generator
		generic (
		CLK_PERIOD		: TIME	:= 10ns
		);

		port (	
		clk	: out STD_LOGIC
		);

end component ;

begin


	clk <=clk_s;

	clock: clock_generator
		port map
		(
		clk		=> clk_s
		);


	sim : process
	
	    procedure inicia_reset is
		begin
		    rst <= '0';
		end procedure inicia_reset;
	
		procedure reset_activate is    -- reset activation procedure
		begin
			wait until falling_edge(CLK_s);
			rst <= '1';
			wait for CLK_PERIOD;
			rst <= '0';
		end procedure reset_activate;
		


	begin
		-- inicia reset em 0
		inicia_reset;
		wait for CLK_PERIOD;
		-- depois de reset em 0, seta o reset para dar inicio ao funcionamento do lsfr
		reset_activate;
		wait for 22*CLK_PERIOD;
		-- após 22 ciclos reseta denovo
		reset_activate;
		
		

		wait;
	end process sim;
end architecture test;


--- srquivo clock
