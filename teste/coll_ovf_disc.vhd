library IEEE;
use IEEE.std_logic_1164.all;
use work.wisdom_package.all;

entity coll_ovf_disc is 
	port
	(
	clk			   : in  STD_LOGIC;											--from system
	res				: in  STD_LOGIC;										   --from system
    disc_addr     	: in  STD_LOGIC_VECTOR(7 downto 0);
	end_of_disc		: out STD_LOGIC							     	--to control unit
	);
end coll_ovf_disc;


architecture arch of coll_ovf_disc is



--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************

signal disc_addr_s		  : STD_LOGIC_VECTOR(7 downto 0);
signal end_of_disc_s       : STD_LOGIC;

begin
	
	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	disc_addr_s <= disc_addr;

	end_of_disc	<= '1' when (disc_addr_s(6)='1' or disc_addr_s(7)= '1') else '0';
	
end arch;
