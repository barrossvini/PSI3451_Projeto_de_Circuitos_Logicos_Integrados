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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity num_gen_with_function is
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
end num_gen_with_function ;


architecture arch of num_gen_with_function is


--***********************************
--*	SIMPLIFIED FUNTION DECLARATION		*
--***********************************

function rand_num_f(width : NATURAL) return std_logic_vector is
  
	variable res_v : std_logic_vector(WIDTH - 1 downto 0);
	--	Meu numero usp, em decimal, eh  10335913 
    --    	Meu numero usp mod 256, em decimal eh  169

	variable your_n_usp :  unsigned (WIDTH - 1 downto 0);
	


begin
  your_n_usp := "10101001" ;
  res_v := std_logic_vector (your_n_usp );
  return res_v;
end function;


--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************

	signal number_s         : unsigned(WIDTH-1 downto 0);
	SIGNAL ng_2_rb_s        : unsigned(WIDTH-1 downto 0);
	signal alu_2_ng_s       : unsigned(WIDTH-1 downto 0);


begin

	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	
	
		alu_2_ng_s		<= 	unsigned (alu_2_ng) ;
	
		number_s	<=	unsigned (rand_num_f(WIDTH)) AFTER 8ns	 when (ng_rand_zero = '0') else	
							"00000000"	 when (ng_rand_zero = '1') else
							(others => 'X' );						
							 
		ng_2_rb_s	<=	number_s	      when (ng_cte_incr = '0') else
							alu_2_ng_s     when (ng_cte_incr = '1') else
							(others => 'X' );					
					
		ng_2_rb      <= std_logic_vector(ng_2_rb_s);
	
		
	
	
end arch;
