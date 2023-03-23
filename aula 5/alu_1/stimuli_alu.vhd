library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stimuli_module is
	generic
	(
	WIDTH	: natural := 8
	);
	
	port
	(
	a_i	: 	out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end stimuli_module ;

architecture test of stimuli_module  is
-- "Time" that will elapse between test vectors we submit to the component.
constant TIME_DELTA : time := 100 ns;      -- choose any value


begin

simulation : process

-- procedure for vector generation

procedure assign_input_words(constant a: in integer) is
begin
-- Assign values to estimuli_module´s outputs.
a_i <= std_logic_vector(to_unsigned(a,WIDTH));-- representa a com width bits

wait for TIME_DELTA;
end procedure assign_input_words;


begin

-- test vectors application
-- começar da posição N1=159 e ir até overflow usando loop

	for i in 159 to 255 loop
		assign_input_words(i);
	end loop;



wait;
end process simulation;
end architecture test;