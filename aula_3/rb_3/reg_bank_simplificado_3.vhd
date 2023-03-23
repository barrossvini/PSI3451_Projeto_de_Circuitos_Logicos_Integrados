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
package my_package is

	 type RB_SEL is	(
					INIT_OUT, 
					GURU_OUT					
					);
					
end package;



library IEEE;
use IEEE.std_logic_1164.all;

use work.my_package.all;



entity reg_bank is 
  
 
					
	generic
	(
	WIDTH		: NATURAL	:= 8
	);


	port
	(
	out_sel		: in RB_SEL;
	rb_out		: out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	);
	

end reg_bank;


architecture process_if_else of reg_bank is


--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal guru_out_s	: STD_LOGIC_VECTOR(WIDTH-1 downto 0) 	:= "00001111";
signal init_out_s	: STD_LOGIC_VECTOR(WIDTH-1 downto 0)	:= "11110000";


begin


	process (out_sel)
			begin
			if (out_sel = GURU_OUT) then
					rb_out	<= 	guru_out_s;
			elsif (out_sel = INIT_OUT ) then
					rb_out	<= 	init_out_s;

			end if;
	end process;


end process_if_else ;
