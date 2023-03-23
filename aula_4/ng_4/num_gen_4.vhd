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


entity num_gen_with_procedure is
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
end num_gen_with_procedure ;


architecture arch of num_gen_with_procedure is


--***********************************
--*	SIMPLIFIED FUNTION DECLARATION		*
--***********************************

procedure rand_num_p(constant WIDTH : in NATURAL;
					 signal res_v : out std_logic_vector
					 ) is
  variable your_n_usp :  unsigned (WIDTH - 1 downto 0);
begin
  your_n_usp := "10101001" ;
  res_v <= std_logic_vector (your_n_usp ) AFTER 8ns;
end rand_num_p;


--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************

	signal number_s         : unsigned(WIDTH-1 downto 0);
	SIGNAL ng_2_rb_s        : unsigned(WIDTH-1 downto 0);
	signal alu_2_ng_s       : unsigned(WIDTH-1 downto 0);
	signal res_v_s 			: std_logic_vector(WIDTH-1 downto 0);


begin

	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	
	
		alu_2_ng_s		<= 	unsigned (alu_2_ng) ;
	
		number_s	<=	unsigned (res_v_s) 	 when (ng_rand_zero = '0') else	
							"00000000"	 when (ng_rand_zero = '1') else
							(others => 'X' );						
							 
		ng_2_rb_s	<=	number_s	      when (ng_cte_incr = '0') else
							alu_2_ng_s     when (ng_cte_incr = '1') else
							(others => 'X' );					
					
		ng_2_rb      <= std_logic_vector(ng_2_rb_s);
	
		
		rand_num_p(WIDTH,res_v_s); --Chamada do procedure
	
	
end arch;
