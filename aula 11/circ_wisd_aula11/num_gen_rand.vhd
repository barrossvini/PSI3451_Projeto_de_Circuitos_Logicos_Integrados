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
library IEEE;
use work.wisdom_package.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity num_gen_rand is
	generic
	(
	WIDTH	: natural := 8
	);
	
	port
	(
	ng_rand_zero	: in  STD_LOGIC; 
	rand_num       : in  STD_LOGIC_VECTOR (1 downto 0); 
	number			: out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
	);
end num_gen_rand ;


architecture arch of num_gen_rand is



--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal rand_zero_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);
signal rand_num_s		: STD_LOGIC_VECTOR (WIDTH-1 downto 0);



begin

	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	rand_num_s  <= "000000" & rand_num;
	
	rand_zero_s	<=	rand_num_s	 when (ng_rand_zero = '0') else	
					   "00000000"	 when (ng_rand_zero = '1') else
				      (others => 'X' );									
					
	number		<= rand_zero_s ;
	
	
end arch;
