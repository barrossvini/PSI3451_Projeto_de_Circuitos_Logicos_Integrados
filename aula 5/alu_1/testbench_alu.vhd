library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_alu is

GENERIC (WIDTH: natural :=8);

end tb_alu;

architecture test of tb_alu is

component stimuli_module 
	generic
	(
	WIDTH	: natural := 8
	);
	
	port
	(
	a_i	: 	out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end component ;

component alu
	generic
	(
	WIDTH		: NATURAL	:= 8
	);

	port
	(
	rb_op			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	alu_result		: out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	);
end component ;

	signal a_i_s, z_o_s : STD_LOGIC_VECTOR(WIDTH-1 downto 0); 

begin

-- Instantiate DUT
	dut : alu
		generic map(WIDTH => WIDTH)
		port map(rb_op	 		=> a_i_s, 
				alu_result			=> z_o_s);

-- Instantiate test module
	test : stimuli_module
		generic map(WIDTH => WIDTH)
		port map(a_i	 		=> a_i_s);


end architecture test;