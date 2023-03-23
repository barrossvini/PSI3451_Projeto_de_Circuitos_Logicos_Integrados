--***************************************************************
--*																*
--*	Title	:													*
--*	Design	:													*
--*	Author	:													*
--*	Email	:													*
--*																*
--***************************************************************
--*																*
--*	Description :												*
--*																*
--***************************************************************
-- 10335912 mod 256 = 169
library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;


entity num_gen_direct is
	generic
	(
	WIDTH	: natural := 8
	);
	
	port
	(	ng_rand_zero: in  STD_LOGIC;
		ng_cte_incr	: in  STD_LOGIC;
		alu_2_ng	: in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
		ng_2_rb		: out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
	);
end num_gen_direct;


architecture arch of num_gen_direct is


--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
	signal rand_num_direct  : unsigned(WIDTH-1 downto 0);  
	signal number_s         : unsigned(WIDTH-1 downto 0);
	SIGNAL ng_2_rb_s        : unsigned(WIDTH-1 downto 0);
	SIGNAL alu_2_ng_s       : unsigned(WIDTH-1 downto 0);


begin

	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	
		rand_num_direct <= (to_unsigned(169,ng_2_rb'length));

				--	Meu numero usp, em decimal, eh  10335913
				--  Meu numero usp mod 256, em decimal eh  169
	
	
		alu_2_ng_s		<= 	unsigned (alu_2_ng) ;
	
		number_s	<=	rand_num_direct	 when (ng_rand_zero = '0') else	
							"00000000"	 when (ng_rand_zero = '1') else
							(others => 'X' );						
							 
		ng_2_rb_s	<=	number_s	      when (ng_cte_incr = '0') else
							alu_2_ng_s     when (ng_cte_incr = '1') else
							(others => 'X' );					
					
		ng_2_rb      <= std_logic_vector(ng_2_rb_s);
end arch;
