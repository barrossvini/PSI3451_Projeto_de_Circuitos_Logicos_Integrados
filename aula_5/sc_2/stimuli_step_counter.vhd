library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_package.all;

entity stimuli_step_counter is
	generic
	(
	CLK_PERIOD		: TIME	:=  10 ns;
	COUNT_COUNT_WIDTH  : NATURAL := 16
	);

	port
	(
	clk		: out STD_LOGIC;
	rst		: out STD_LOGIC;
	speed_sync	: out SPEED;
	en_disc      	: out  STD_LOGIC;
	en_cnt      	: out  STD_LOGIC;	
	cnt_guru_rdy	: in STD_LOGIC;    --from counter: indicates max count
	cnt_value	: in UNSIGNED(COUNT_COUNT_WIDTH-1 downto 0)
	);

end stimuli_step_counter ;

architecture test of stimuli_step_counter is
	signal clk_s : STD_LOGIC;

	component clock_generator
		generic (
		CLK_PERIOD		: TIME	:= 10 ns
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
		

		procedure reset_activate is    -- reset activation procedure
		begin
			wait until falling_edge(CLK_s);
			rst <= '1';
			wait for CLK_PERIOD;
			rst <= '0';
		end procedure reset_activate;
		
		procedure assign_input_words(constant a: in SPEED) is
			begin
			-- Assign values to speed.
			speed_sync <= a;

			wait for CLK_PERIOD;
		end procedure assign_input_words;
		
		procedure assign_flags(en_disc_value, en_cnt_value: in STD_LOGIC) is
			begin
			-- Assign values to enable signals.
			en_disc <= en_disc_value;
			en_cnt <= en_cnt_value;

			wait for CLK_PERIOD;
		end procedure assign_flags;


	begin
		-- Apply test vectors
		
		reset_activate;   -- counter will start
		
		assign_flags ('1', '1'); 				-- as contagens estão habilitadas
					
		wait for 1*CLK_PERIOD;
			
		
			assign_input_words (SPEED'VAL(0));     --  para velocidade X1
		
			while (cnt_guru_rdy /= '1' )    
				loop
							
					wait for 1*CLK_PERIOD;
			end loop;
			
	
		
		wait for 50*CLK_PERIOD;	
						
		
		
		assign_flags ('1', '1'); 				-- as contagens estão habilitadas
					
		wait for 1*CLK_PERIOD;
			
		
			assign_input_words (SPEED'VAL(1));     -- para velocidade X2
		
			while (cnt_guru_rdy /= '1' ) 
				loop
					wait for 1*CLK_PERIOD;
			end loop;

				
			wait for 50*CLK_PERIOD;	
			
			assign_flags ('1', '1'); 				-- as contagens estão habilitadas
					
		wait for 1*CLK_PERIOD;
			
		
			assign_input_words (SPEED'VAL(2));     -- para velocidade X4
		
			while (cnt_guru_rdy /= '1' ) 
				loop
					wait for 1*CLK_PERIOD;
			end loop;

				
			wait for 50*CLK_PERIOD;	
			
			assign_flags ('1', '1'); 				-- as contagens estão habilitadas
					
		wait for 1*CLK_PERIOD;
			
		
			assign_input_words (SPEED'VAL(3));     -- para velocidade X8
		
			while (cnt_guru_rdy /= '1' ) 
				loop
					wait for 1*CLK_PERIOD;
			end loop;

				
			wait for 50*CLK_PERIOD;	
			
			
		
		assign_flags ('1', '1'); 				-- as contagens estão habilitadas
					
		wait for 1*CLK_PERIOD;
			
		
			assign_input_words (SPEED'VAL(1));     -- Para esse com velocidade x2, faz-se um reset quando cnt_value  = 159
			
			while (cnt_guru_rdy /= '1' and cnt_value /= "10011111" )    
				loop
					wait for 1*CLK_PERIOD;
			end loop;
			reset_activate;
			
		reset_activate;  -- faz reset depois de parar em 159
		
		wait for 50*CLK_PERIOD;	
		
		assign_flags ('1', '1'); 				-- as contagens estão habilitadas
					
		wait for 1*CLK_PERIOD;
			
		
			assign_input_words (SPEED'VAL(2));     -- Para esse com velocidade x4, faz-se um reset quando cnt_value  = 213
			
			while (cnt_guru_rdy /= '1' and cnt_value /= "11010101" )    
				loop
					wait for 1*CLK_PERIOD;
			end loop;
			reset_activate;
			
		reset_activate;  -- faz reset depois de parar em 213
		
		wait for 50*CLK_PERIOD;	
						
		
		assign_flags ('0', '1'); 				-- as contagens estão habilitadas
					
		wait for 1*CLK_PERIOD;
			
	
			while (cnt_guru_rdy /= '1') 
				loop
					wait for 1*CLK_PERIOD;
			end loop;

			wait for 50*CLK_PERIOD;	


	end process sim;

end architecture test;