--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all;
--use IEEE.std_logic_unsigned.all;
--use work.wisdom_package.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.wisdom_package.all;

entity circuit_wisdom_aula_11 is 
	port
	(
		clk					: in  STD_LOGIC;						--from system
		res					: in  STD_LOGIC;						--from system
		cnt_disc_rdy		: out  STD_LOGIC;						--to disciple circuit
	
		disc_2_base			: in disc_2_base_flags;					--fom disciple circuit
		ref_2_base			: in ref_2_base_flags;					-- from referee				

		enable				: in  STD_LOGIC;						-- from player
		sys_speed    		: in  STD_LOGIC_VECTOR(3 downto 0);  	-- from player
		disc_2_mem			: in disc_2_mem_flags;					--from disciple circuit
		tb_init_guru_data    		: out STD_LOGIC_VECTOR(7 downto 0)	   -- for test
	);
end  circuit_wisdom_aula_11;



architecture arch of  circuit_wisdom_aula_11 is


	component step_counter
		generic
		(
	COUNT_MAX_V8_FAST	   : UNSIGNED	:= x"50";    -- 50 hexadecimal and 80 decimal
	COUNT_COUNT_WIDTH 	: NATURAL 	:= 16
	);
		port
	(
	clk		     		   : in  STD_LOGIC;
	res		     		   : in  STD_LOGIC;
	speed_sync		      : in  SPEED;
	enable      	   	: in STD_LOGIC;
	cnt_guru_rdy		   : out STD_LOGIC;
	cnt_disc_rdy		   : out STD_LOGIC;
	cnt_value			   : out UNSIGNED(COUNT_COUNT_WIDTH-1 downto 0)    
		);
	end component;
	
	
	 component button_handler
		port
		(
		clk					: in  STD_LOGIC;
		res					: in  STD_LOGIC;
		enable				: in  STD_LOGIC;
		enable_bypass		: out STD_LOGIC;
		sys_speed    		: in  STD_LOGIC_VECTOR(3 downto 0);
		speed_sync		   : out SPEED
		);
	end component;

	component mem_2port
	   PORT
	   (
		address_a		     : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		address_b			  : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		      	  : IN  STD_LOGIC  := '1';
		data_a				  : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b				  : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a				  : IN  STD_LOGIC  := '0';
		wren_b				  : IN  STD_LOGIC  := '0';
		q_a		  			  : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b					  : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	   );
    END component;
	 
	component base_circuit
		port
		(
		clk					: in  STD_LOGIC;						--from system
		res					: in  STD_LOGIC;						--from system
		cnt_guru_rdy		: in  STD_LOGIC;						--from counter
		ref_2_base        : in  ref_2_base_flags;				--from referee    		
		disc_2_base    	: in  disc_2_base_flags;
		base_2_ref  		: out base_2_ref_flags;
		base_2_disc    	: out base_2_disc_flags;
		base_2_mem     	: out base_2_mem_flags
		);
	 end component;
	 
	 	
--	component referee
--		generic
--		( WIDTH		: NATURAL	:= 8 );
--		
--		port(
--		 clk, reset: in std_logic;
--		 cnt_disc_rdy, cnt_guru_rdy: in std_logic;
--		 guru_addr,disc_addr, guru_prev_addr,disc_prev_addr: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
--		 go_guru, go_disc, guru_well_behind, duo_formed: out std_logic );
--	end component;
--


--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************

   signal clk_s, res_s           : STD_LOGIC;
	signal cnt_guru_rdy_s      	: STD_LOGIC;
	signal cnt_disc_rdy_s      	: STD_LOGIC;
	signal cnt_value_s         	 : UNSIGNED(15 downto 0) ; 
	signal enable_s,en_bypass_s    : STD_LOGIC;
	signal speed_sync_s			    : SPEED;
	signal sys_speed_s    	  		: STD_LOGIC_VECTOR(3 downto 0);
	signal tb_init_guru_data_s  	   		: STD_LOGIC_VECTOR(7 downto 0);
	signal disc_data_s  	   		: STD_LOGIC_VECTOR(7 downto 0);
	signal ref_2_base_s        	: ref_2_base_flags;
	signal base_2_ref_s 		   	: base_2_ref_flags;
	signal base_2_mem_s        	: base_2_mem_flags;
	signal disc_2_base_s       	: disc_2_base_flags;
	signal disc_2_mem_s		   	: disc_2_mem_flags;
	signal base_2_disc_s       	: base_2_disc_flags;	
	
	
begin

	button : button_handler port map
									(
									clk					=>clk_s,
									res					=>res_s,
									enable				=>enable,
									enable_bypass     =>en_bypass_s,
									sys_speed    		=>sys_speed_s,
									speed_sync		   =>speed_sync_s
									);
									
	
	  mem   : mem_2port 
									port map
									(
									address_a		     =>base_2_mem_s.mem_a_addr,
									address_b			  =>disc_2_mem_s.mem_b_addr,
									clock		      	  =>clk_s,
									data_a				  =>base_2_mem_s.data_a,
									data_b				  =>disc_2_mem_s.data_b,
									wren_a				  =>base_2_mem_s.mem_wr_en,
									wren_b				  =>disc_2_mem_s.mem_wr_en,
									q_a		  			  =>tb_init_guru_data_s,
									q_b					  =>disc_data_s
									);

	   base: base_circuit 
									port map
									(
									clk					   =>clk_s,
									res						=>res_s,
									cnt_guru_rdy			=>cnt_guru_rdy_s,
									ref_2_base        	=>ref_2_base,    		
									disc_2_base    		=>disc_2_base,
									base_2_ref  			=>base_2_ref_s,
									base_2_disc    		=>base_2_disc_s,
									base_2_mem     		=>base_2_mem_s
									);
									
	 step  : step_counter  
			generic map(
									COUNT_MAX_V8_FAST	   => x"2",    
									COUNT_COUNT_WIDTH 	=> 16     --for test , functional value = 50000000 -1X
									)
									port map
									(
									clk		=> clk_s,
									res		=> res_s,
									speed_sync	=> speed_sync_s,
									enable      => en_bypass_s,
									cnt_guru_rdy => cnt_guru_rdy_s,
									cnt_disc_rdy  => cnt_disc_rdy_s,
									cnt_value		=> cnt_value_s );
									
									
	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	clk_s 						 <= clk;
	res_s 						 <= res;
	sys_speed_s              <= sys_speed;
	
	tb_init_guru_data    			    <= tb_init_guru_data_s;
	
	cnt_disc_rdy      <= cnt_disc_rdy_s;
	
	disc_2_mem_s <=  disc_2_mem;
	
						
									
									
end arch;
