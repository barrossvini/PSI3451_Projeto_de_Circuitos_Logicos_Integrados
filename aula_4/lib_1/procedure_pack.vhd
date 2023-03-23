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

package procedure_pack is
		procedure rand_num_p(constant width : in NATURAL;
							 signal res_v : out std_logic_vector
							);
end procedure_pack;

package body procedure_pack is
		
		procedure rand_num_p(constant width : in NATURAL;
							 signal res_v : out std_logic_vector
							 ) is
		  variable your_n_usp :  unsigned (WIDTH - 1 downto 0);
		  begin
			your_n_usp := "10101001" ;
			res_v <= std_logic_vector (your_n_usp ) AFTER 8ns;
		end procedure;
end procedure_pack;
