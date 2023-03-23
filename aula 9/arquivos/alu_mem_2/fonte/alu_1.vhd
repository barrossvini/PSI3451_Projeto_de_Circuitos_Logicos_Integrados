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



entity alu is 
	generic
	(
	WIDTH		: NATURAL	:= 8
	);

	port
	(
	rb_op			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	alu_result		: out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	);
end alu;



architecture with_RCA of alu is


--***********************************
--*	COMPONENT DECLARATIONS			*
--***********************************

component rc_adder_2
	generic
	(
	WIDTH : integer := 8
	);
	
	port
	(
	a_i, b_i	: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	c_i			: in STD_LOGIC;
	z_out 		: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	c_o			: out STD_LOGIC
	);
end component;

--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
 
signal result_s		: std_logic_vector(WIDTH-1 downto 0); 
signal carry_out_s		: STD_LOGIC;

begin

	--*******************************
	--*	COMPONENT INSTANTIATIONS	*
	--*******************************

	add:	rc_adder_2	generic map
						(
						WIDTH	=> WIDTH
						)
						
						port map
						(
						a_i			=> std_logic_vector(to_unsigned(1,rb_op'length)),
						b_i			=> rb_op,
						c_i			=> '0',
						z_out 		=> result_s,
						c_o			=> carry_out_s
						);
	
	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	
	alu_result	<=	result_s;
	
	--*******************************
	--*	PROCESS DEFINITIONS			*
	--*******************************
	

end with_RCA;


