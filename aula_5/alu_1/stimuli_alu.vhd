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
	one_op		     : out STD_LOGIC_VECTOR(WIDTH-1 downto 0); 
	rb_op	: 	out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	alu_ctrl         : out STD_LOGIC      
	);
	
end stimuli_module ;

architecture test of stimuli_module  is
-- "Time" that will elapse between test vectors we submit to the component.
constant TIME_DELTA : time := 100 ns;      -- choose any value

 
begin

simulation : process

-- procedure for vector generation (as input, one_op ,  rb_op and alu_ctrl)
procedure assign_input_words(constant a: in integer;
							 constant b: in std_logic ) is
begin
-- Assign values to estimuli_module´s outputs.
rb_op <= std_logic_vector(to_unsigned(a,WIDTH));-- representa a com width bits
one_op <= std_logic_vector(to_unsigned(1,rb_op'length)); -- recebe vetor valor 1 tamanho de rb_op
alu_ctrl <= b; -- denine-se 1 para apresentar o resultado na saida

wait for TIME_DELTA;
end procedure assign_input_words;


begin

-- test vectors application
-- you may use the following syntax

--		for i in decimal_1 to decimal_2 loop
--          any command
--		end loop;
assign_input_words(159,'0'); -- para dar inicio a simulação com a entrada na saida

for i in 159 to 255 loop
		assign_input_words(i,'1');
end loop;



wait;
end process simulation;
end architecture test;