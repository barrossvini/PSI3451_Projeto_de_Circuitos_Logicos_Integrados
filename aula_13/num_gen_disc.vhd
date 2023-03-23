LIBRARY IEEE;
USE work.wisdom_package.all;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.numeric_std.all;


ENTITY num_gen_disc IS
	GENERIC(
			WIDTH	   	: NATURAL := 8
			
			);
	
	PORT(
			clk			: IN  STD_LOGIC;
			reset 		: IN  STD_LOGIC;
			alu_result	: IN  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
			ng_cte_incr	: in STD_LOGIC;
			ng_2_rb		: OUT STD_LOGIC_VECTOR (WIDTH-1 downto 0)
	);
END num_gen_disc ;

ARCHITECTURE arch OF num_gen_disc IS
	 
	
	COMPONENT rand_num_disc IS
	generic
	(
	WIDTH	: natural := 8
	);
	port
	(
	clk  : in  STD_LOGIC;
	rst: in  STD_LOGIC;
	rand_num_discber    : out  STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	);
	
			 
	END  COMPONENT;
	
	SIGNAL rand_num_discber_s         : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	SIGNAL ng_2_rb_s        : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	SIGNAL alu_result_s       : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	SIGNAL reset_s 		   : STD_LOGIC;
	
	
	BEGIN
		reset_s 	    <= not reset;
		alu_result_s   <= alu_result;
		
		rand_num_discber_gen : rand_num_disc 
						GENERIC MAP(  WIDTH )
						PORT MAP(
								clk      => clk,
								rst    => reset_s,
								rand_num_discber => rand_num_discber_s 	  
							);				 

							 
		ng_2_rb_s	<=		rand_num_discber_s  when (ng_cte_incr = '0') else
							alu_result_s     when (ng_cte_incr = '1') else
							(others => 'X' );					
		

		ng_2_rb      <= ng_2_rb_s;
		
end arch;