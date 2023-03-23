library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.wisdom_package.all;

entity stimuli_fsm_init is
	generic
	(
	WIDTH			:         NATURAL := 8;
	CLK_PERIOD		: 		  TIME	:=  10ns
	);

	port
	(
	clk				: out STD_LOGIC;			--from system
	rst			    : out STD_LOGIC;			--from system
	start_init		: out STD_LOGIC;			--from fsm internal
	ovf_of_y		: out STD_LOGIC			--from system
	);

end stimuli_fsm_init;

architecture test of stimuli_fsm_init is
	signal clk_s : STD_LOGIC;

	component clock_generator
		generic (
		CLK_PERIOD		: TIME	:= 10ns
		);

		port (	
		clk		: out STD_LOGIC
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
	

procedure check_fsm(start_init_value, ovf_of_y_value: in STD_LOGIC)	is
		begin
			-- Assign values to estimuli_module´s outputs.
			start_init <= start_init_value; 
            ovf_of_y <= ovf_of_y_value;

			wait until rising_edge (clk_s);
			-- Events at the rising edge of next clock cycle
			end procedure check_fsm;

		procedure reset_activate is    -- reset activation procedure
		begin
			wait until falling_edge(CLK_s);
			rst <= '1';
			wait for CLK_PERIOD;
			rst <= '0';
		end procedure reset_activate;


	begin
		-- Apply test vectors
		
		check_fsm('0','0');    -- analyze state transitions
		reset_activate;
		
		-- Simulando init opção 1
		
		wait for 50*CLK_PERIOD;		

		check_fsm('0','0');    
	
		wait for 2*CLK_PERIOD;
		
		check_fsm('1','0');   -- forçando transição para estado zero e seguindo para estado mem_walk
		
		wait for 4*CLK_PERIOD;		
		
		check_fsm('1','0');    -- deve permanecer em mem_walk
		
		--opção 2
		
		wait for 2*CLK_PERIOD;
		check_fsm('1','1'); -- passando para estado Done
		
		wait for 50*CLK_PERIOD;	 --- deve automaticamente ir para IDLE e done_init = '1'
		
			rst <= '1';		

		wait for 50*CLK_PERIOD;			

		wait;
	end process sim;
end architecture test;