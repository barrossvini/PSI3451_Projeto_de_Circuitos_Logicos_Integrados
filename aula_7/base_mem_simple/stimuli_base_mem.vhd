library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Use work.wisdom_package.all;

entity stimuli_base_mem_simple IS
	generic
	(
	WIDTH:         NATURAL := 8;
	CLK_PERIOD		: TIME	:=  10ns
	);
	
	port
	(
		clk					: out  	STD_LOGIC;						--from system
		res					: out  	STD_LOGIC;						--from system
		ng_2_RB         	: out 	STD_LOGIC_VECTOR(WIDTH-1 downto 0);
		rb_INIT_en	    	: out 	STD_LOGIC;
		rb_GURU_en	    	: out 	STD_LOGIC;
		rb_PRE_GURU_en   	: out 	STD_LOGIC;
		out_sel		    	: out 	RB_SEL;
		cg_sel				: out 	CODE;
		base_mem_wren		: out 	STD_LOGIC;
		disc_mem_wren		: out 	STD_LOGIC;
		disc_mem_addr		: out STD_LOGIC_VECTOR(WIDTH-3 downto 0);
		disc_mem_data		: out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	
	);
end stimuli_base_mem_simple;

architecture test of stimuli_base_mem_simple  is
	signal clk_s : STD_LOGIC;
	signal j: integer;

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

	clock_gen: clock_generator
		port map
		(
		clk		=> clk_s
		);


	sim : process
		
					
		procedure reset_activate is    -- reset activation procedure
		begin
			wait until falling_edge(CLK_s);
			res <= '1';
			wait for CLK_PERIOD;
			res <= '0';
		end procedure reset_activate;


		
		procedure check_mem_base_ctrl(rb_INIT_en_value, rb_GURU_en_value, rb_PRE_GURU_en_value, base_mem_wren_value: in STD_LOGIC; out_sel_value: in RB_SEL ; cg_sel_value: in CODE) is
		
			begin
			-- Assign values to estimuli_module´s outputs.
			rb_INIT_en <= rb_INIT_en_value; 
			rb_GURU_en <= rb_GURU_en_value;
			rb_PRE_GURU_en <= rb_PRE_GURU_en_value;
			base_mem_wren <= base_mem_wren_value;
			out_sel <= out_sel_value;
			cg_sel <= cg_sel_value;

			end procedure check_mem_base_ctrl;
			
		
		procedure check_mem_base_datapath(ng_2_RB_value: in STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0)) is
		
			begin
			-- Assign values to estimuli_module´s outputs.
			ng_2_RB <= ng_2_RB_value;

			end procedure check_mem_base_datapath;
			
						
			
			procedure check_mem_disc(disc_mem_wren_value: in STD_LOGIC; disc_mem_addr_value:in STD_LOGIC_VECTOR (WIDTH-3 DOWNTO 0) ; disc_mem_data_value: in STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0)) is
		
			begin
			-- Assign values to estimuli_module´s outputs.
			disc_mem_wren <= disc_mem_wren_value; 
			disc_mem_addr <= disc_mem_addr_value;
			disc_mem_data <= disc_mem_data_value;

			end procedure check_mem_disc;
			

		begin   -- process
			
		-- Apply one test vectors quite random-  port a and port b - writing for one cycle
		
			check_mem_base_ctrl('1', '0', '0', '0', INIT_OUT, BLANK);    -- control values 
			check_mem_base_datapath(std_logic_vector(to_unsigned(7, 8)));  -- address to registers input 
			check_mem_disc('0', std_logic_vector(to_unsigned(7, 6)), std_logic_vector(to_unsigned(7, 8)));    -- any data from disc 
			
			wait until rising_edge (clk_s);
			wait until rising_edge (clk_s);
			
		reset_activate;
		
		-- Read all positions of memory

		for i in 0 to 63 loop
			check_mem_base_ctrl('1', '0', '0', '0', INIT_OUT, BLANK);    -- control values 
			check_mem_base_datapath(std_logic_vector(to_unsigned(i, 8)));  -- address to registers input 
			check_mem_disc('0', std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(7, 8)));    -- any data from disc
			wait until rising_edge (clk_s);
		
		end loop;
		
		wait for 6*CLK_PERIOD;
		wait until rising_edge (clk_s);
		
		-- base write enable for all positions of memory	
		
		for i in 0 to 15 loop
		
			-- cycle of write for base (Blank in position i)
			
			check_mem_base_ctrl('1', '0', '0', '1', INIT_OUT, BLANK);    -- control values 
			check_mem_base_datapath(std_logic_vector(to_unsigned(i*4, 8)));  -- address to registers input 
			check_mem_disc('0', std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(7, 8)));    -- any data from disc

			wait until rising_edge (clk_s);
			

			-- cycle of write for base (Guru in position i+1)
			
			check_mem_base_ctrl('1', '0', '0', '1', INIT_OUT, GURU);    -- control values 
			check_mem_base_datapath(std_logic_vector(to_unsigned(i*4+1, 8)));  -- address to registers input 
			check_mem_disc('0', std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(7, 8)));    -- any data from disc

			wait until rising_edge (clk_s);
			
			-- cycle of write for base (Disc in position i+1)
			if( i = 11) then --  vez em que passa e a posição é 46 (N1) da memoria onde faremos os dois escrever na posição
				check_mem_base_ctrl('1', '0', '0', '1', INIT_OUT, DISCIPLE);    -- control values 
				check_mem_base_datapath(std_logic_vector(to_unsigned(i*4+2, 8)));  -- address to registers input 
				check_mem_disc('1', std_logic_vector(to_unsigned(i*4+2, 6)), std_logic_vector(to_unsigned(7, 8))); 
				wait until rising_edge (clk_s);
				wait until rising_edge (clk_s);
				check_mem_base_ctrl('1', '0', '0', '0', INIT_OUT, DISCIPLE);    -- control values 
				check_mem_base_datapath(std_logic_vector(to_unsigned(i*4+2, 8)));  -- address to registers input 
				check_mem_disc('0', std_logic_vector(to_unsigned(i*4+2, 6)), std_logic_vector(to_unsigned(7, 8))); 
				wait for 2*CLK_PERIOD; -- para facilitar observação
			
			else
				check_mem_base_ctrl('1', '0', '0', '1', INIT_OUT, DISCIPLE);    -- control values 
				check_mem_base_datapath(std_logic_vector(to_unsigned(i*4+2, 8)));  -- address to registers input 
				check_mem_disc('0', std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(7, 8)));    -- disc escreve
				wait until rising_edge (clk_s);
			end if;
			--
			
			wait until rising_edge (clk_s);
			-- cycle of write for base (duo in position i+1)
			
			check_mem_base_ctrl('1', '0', '0', '1', INIT_OUT, DUO);    -- control values 
			check_mem_base_datapath(std_logic_vector(to_unsigned(i*4+3, 8)));  -- address to registers input 
			check_mem_disc('0', std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(7, 8)));    -- any data from disc

			wait until rising_edge (clk_s);
		end loop;
		
		

		-- disciple write enable for all positions of memory	
		
		for i in 0 to 63 loop
		
			-- cycle of write for disc (i+2 i position i
			
			check_mem_base_ctrl('1', '0', '0', '0', INIT_OUT, BLANK);    -- control values 
			check_mem_base_datapath(std_logic_vector(to_unsigned(i, 8)));  -- address to registers input 
			check_mem_disc('1', std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i+2, 8)));    -- any data from disc

			wait until rising_edge (clk_s);
			
			-- cycles of read for disc
		
			check_mem_base_ctrl('1', '0', '0', '0', INIT_OUT, BLANK);    -- control values 
			check_mem_base_datapath(std_logic_vector(to_unsigned(i, 8)));  -- address to registers input 
			check_mem_disc('0', std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i+2, 8)));    -- any data from disc
		
		end loop;							

	end process sim;
end architecture test;