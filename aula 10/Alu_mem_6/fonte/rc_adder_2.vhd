Library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity rc_adder_2 is
	generic
	(
	WIDTH	: natural := 8
	);
	port
	(
	a_i, b_i		:	in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
	z_out		:	out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
	c_i			:	in STD_LOGIC;
	c_o			:	out STD_LOGIC
	);
	
end rc_adder_2;


architecture structural of rc_adder_2 is


	COMPONENT full_adder_1 
		port ( a_in, b_in, c_in		:	in STD_LOGIC;
				z_out, c_out		:	out STD_LOGIC);
	END COMPONENT;
	
  
  
signal carry	: STD_LOGIC_VECTOR (WIDTH-2 downto 0);  -- auxiliary signal carry(x) means carry_out of stage x

begin

	G_ALL : FOR N IN WIDTH-1 DOWNTO 0 GENERATE
		G_0 : IF (N = 0) GENERATE
			fa_0 : full_adder_1
				PORT MAP (a_i(N), b_i(N), c_i, z_out(N), carry(N) );  
		END GENERATE G_0;
		
		G_MAX : IF (N = WIDTH-1) GENERATE
			fa_MAX : full_adder_1
				PORT MAP (a_i(N), b_i(N), carry (N-1), z_out(N), c_o ); 
		END GENERATE G_MAX;
		
		G_OTHERS : IF (N < WIDTH-1 AND N > 0) GENERATE
			fa_others : full_adder_1
				PORT MAP (a_i(N), b_i(N), carry (N-1), z_out(N), carry (N)); 
		END GENERATE G_OTHERS;

	END GENERATE G_ALL;


end structural;



