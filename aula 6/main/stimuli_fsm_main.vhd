library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.wisdom_package.all;

entity stimuli_fsm_main is
	generic
	(
	WIDTH			:         NATURAL := 8;
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

end stimuli_fsm_main ;

architecture test of stimuli_fsm_main is
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
	

procedure check_fsm(fsm_i_done_value, end_of_guru_value, end_of_disc_value, duo_formed_value	: in STD_LOGIC)	is
		begin
			-- Assign values to estimuli_module´s outputs.
			fsm_i_done <= fsm_i_done_value; 
			end_of_guru <= end_of_guru_value;
			end_of_disc <= end_of_disc_value;
			duo_formed <= duo_formed_value; 

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
		
		check_fsm('0','0','0','0');    -- analyze state transitions
		reset_activate;
		
	-- **initialization state** protocol
		
		while (fsm_i_start /= '1') 
			loop
			check_fsm('0','0','0','0');    -- guaranteeing fsm_i_done='0'		
		end loop;
		
		-- emulate some action in fsm_init
		
		wait for 50*CLK_PERIOD;		

		-- forcing fsm_i_done='1'

		check_fsm('1','0','0','0');     -- forcing fsm_i_done='1' -> end of fsm_init and forcing fsm_main to go to STEP_ACTIVATION 		

	-- **step** protocol
		
		while (fsm_s_start /= '1') 
			loop
			check_fsm('1','0','0','0');  -- maintaining fsm_i_done='1'		
		end loop;
		
		-- emulate some action in guru and disciple step
		
		wait for 50*CLK_PERIOD;		

		check_fsm('0','0','0','0');    -- forcing end_of_guru=end_of_disc='0' forcing fsm_main to stay in CHECK_END
	
		wait for 2*CLK_PERIOD;
		
		check_fsm('0','1','0','0');    -- forcing end_of_guru='1' and end_of_disc='0' forcing fsm_main to stay in CHECK_END
		
		wait for 2*CLK_PERIOD;		
		
		check_fsm('0','0','1','0');    -- forcing end_of_guru='0' and end_of_disc='1' forcing fsm_main to stay in CHECK_END 
		
		wait for 2*CLK_PERIOD;			
		
		check_fsm('0','1','1','0');    -- forcing end_of_guru='1' and end_of_disc='1' plus duo_formed='0', forcing fsm_main to return to STEP_ACTIVATION

		wait for 1*CLK_PERIOD;	
		
		-- **step** protocol 2nd time
		
		while (fsm_s_start /= '1') 
			loop
			check_fsm('1','0','0','0');  -- maintaining fsm_i_done='1'		
		end loop;
		
		-- emulate some action in guru and disciple step
		
		wait for 1*CLK_PERIOD;		
		
		check_fsm('1','0','0','0'); -- forcing end_of_guru=end_of_disc='0' forcing fsm_main to stay in CHECK_END
		
	
		wait for 50*CLK_PERIOD;			
		
		check_fsm('0','1','1','1');    -- forcing end_of_guru='1' andend_of_disc='1' plus duo_formed='1', forcing fsm_main to go to HIT_POINT
		
		wait for 8*CLK_PERIOD;			-- fsm_main automatically  returns to STEP_ACTIVATION
		

			rst <= '1';		

		wait for 50*CLK_PERIOD;			

		wait;
	end process sim;
end architecture test;