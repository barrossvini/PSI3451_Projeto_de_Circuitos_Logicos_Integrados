library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.wisdom_package.all;

entity tb_wisdom is

GENERIC (WIDTH: natural :=8);

end tb_wisdom;

architecture test of tb_wisdom is

   component circuit_wisdom_aula_11 is 
		port
		(
		clk					: in  STD_LOGIC;						--from system
		res					: in  STD_LOGIC;						--from system
		cnt_disc_rdy		: out  STD_LOGIC;						--to disciple circuit
	
		disc_2_base			: in disc_2_base_flags;					--fom disciple circuit
		ref_2_base			: in ref_2_base_flags;					-- from referee				

		enable				: in  STD_LOGIC;						-- from player
		sys_speed    		: in  STD_LOGIC_VECTOR(3 downto 0);  	-- from player
		disc_2_mem		: in disc_2_mem_flags;					--from disciple circuit
		tb_init_guru_data    		: out STD_LOGIC_VECTOR(7 downto 0)	   -- for test
		);
	end  component;

	component stimuli_wisdom is
		generic
		(
		WIDTH:         NATURAL := 8;
		CLK_PERIOD		: TIME	:=  10ns
		);

		port
		(
		clk				: out STD_LOGIC;			--system generatiom
		rst				: out STD_LOGIC;			--system generatiom
		end_of_disc : out STD_LOGIC;				--from disciple circuit
		go_guru 		: out STD_LOGIC;			--from referee
		duo_formed	: out STD_LOGIC;			--from referee
		tb_disc_addr	   : out STD_LOGIC_VECTOR(7 downto 0);     --for test
		tb_disc_prev_addr : out STD_LOGIC_VECTOR(7 downto 0);		--for test
	   	enable    	: out STD_LOGIC;							--from player
		sys_speed    	: out STD_LOGIC_VECTOR(3 downto 0)		--from player
		);
	end component;

	signal clk_s, rst_s                : STD_LOGIC;
	signal end_of_disc_s				  : STD_LOGIC;	
	signal go_guru_s					  : STD_LOGIC;	
	signal duo_formed_s				  :  STD_LOGIC;
	signal cnt_disc_rdy_s      	     : STD_LOGIC;
	signal enable_s 				: STD_LOGIC;
   signal sys_speed_s		     		  : STD_LOGIC_VECTOR(3 downto 0);
	signal tb_init_guru_data_s  					  : STD_LOGIC_VECTOR(7 downto 0);
	signal tb_disc_addr_s   				  : STD_LOGIC_VECTOR(7 downto 0);
	signal tb_disc_prev_addr_s				  : STD_LOGIC_VECTOR(7 downto 0);
	signal	address_b_s			  : STD_LOGIC_VECTOR (7 DOWNTO 0);   
	signal	wren_b_s				  : STD_LOGIC;  			 		
	signal	data_b_s				  : STD_LOGIC_VECTOR (7 DOWNTO 0);  
	signal disc_2_mem_s		   	: disc_2_mem_flags;
	signal ref_2_base_s        	: ref_2_base_flags;
	signal disc_2_base_s       	: disc_2_base_flags;
	
begin

	--Signal Assignments

	disc_2_base_s.end_of_disc  <= end_of_disc_s;
	ref_2_base_s.go_guru 		<= go_guru_s;
	ref_2_base_s.duo_formed		<= duo_formed_s;
	
	----------------------------------------------	


	-- Instantiate DUT
	dut : circuit_wisdom_aula_11
		port map
		(
		clk				=> clk_s,			
		res				=> rst_s,
		cnt_disc_rdy 	=>	cnt_disc_rdy_s,
		disc_2_base 	=>disc_2_base_s,
		ref_2_base 		=>ref_2_base_s,
		enable			=> enable_s,
		sys_speed		=> sys_speed_s,	
		disc_2_mem		=> disc_2_mem_s,
		tb_init_guru_data  		=> tb_init_guru_data_s
		);

	test : stimuli_wisdom
		port map
		(
		clk				=> clk_s,			
		rst				=> rst_s,
		end_of_disc 	=>	end_of_disc_s,
		go_guru 		=> go_guru_s,
		duo_formed		=> duo_formed_s,
		tb_disc_addr	   => tb_disc_addr_s,
		tb_disc_prev_addr => tb_disc_prev_addr_s,
		enable    		=> enable_s,
		sys_speed		=> sys_speed_s			
		);

end architecture test;