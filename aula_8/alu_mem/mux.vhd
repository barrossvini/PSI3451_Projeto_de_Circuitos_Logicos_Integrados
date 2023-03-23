

library IEEE;
use IEEE.std_logic_1164.all;

use work.my_package.all;



entity mux is 
  
 
					
	generic
	(
	WIDTH		: NATURAL	:= 8
	);


	port
	(
	out_sel		: in STD_LOGIC;
	rb_out		: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	from_cte    : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	ula2mux     : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	);
	

end mux;



architecture arch of mux is

begin

						
	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	
	rb_out	<= 	from_cte	when (out_sel = '0') else
				ula2mux	when (out_sel = '1') else
				(others => 'X');       

end arch;
