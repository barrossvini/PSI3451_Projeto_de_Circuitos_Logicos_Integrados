--***************************************************************
--*
--*   Version with mask (00..00-01..11) for -1 operation in x,
--*     avoiding interference in y
--*
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
	one_op		     : in STD_LOGIC_VECTOR(WIDTH-1 downto 0); -- uma constante (00000001).
	rb_op			     : in STD_LOGIC_VECTOR(WIDTH-1 downto 0); -- operandos Rb_op são oriundos de Reg Bank (saídas de REG_GURU ou REG_INIT).
	alu_ctrl         : in STD_LOGIC;                          -- controle a saida da ula: 
	alu_result		  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0) -- resultado_soma(proxima posicao do GURU) ou posicao atual do GURU
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
	a_i, b_i	   : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	c_i			: in STD_LOGIC;
	z_out 		   : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	c_o			: out STD_LOGIC
	);
end component;

--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal result_s		         : std_logic_vector(WIDTH-1 downto 0); 
signal carry_out_s	      	: STD_LOGIC;

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
						a_i			=> one_op,
						b_i			=> rb_op,
						c_i			=> '0',
						z_out 		   => result_s,
						c_o			=> carry_out_s
						);
	
	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	
	alu_result	<=	rb_op							when (alu_ctrl = '0') else
					   result_s					  	when (alu_ctrl = '1') else
					   (others => 'X');
		

end with_RCA;

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




-- for generate para todos os WIDTH bits
R1 : FOR N IN WIDTH-1 downto 0 GENERATE


--      if generate para caso LSB
         R12: IF (N=0) GENERATE
		 F1 :full_adder_1
		 PORT MAP(a_i(N),b_i(N),c_i,z_out(N),carry(N));
		 END GENERATE R12;


--      if generate para caso MSB
         R13 :IF(N=WIDTH-1) GENERATE
		 F2 : full_adder_1
		 PORT MAP (a_i(N),b_i(N),carry(N-1),z_out(N),c_o);
		 END GENERATE R13;

--		if generate para demais casos
        R14: IF(N>0 AND N<WIDTH-1) GENERATE
		F3 : full_adder_1
		PORT MAP(a_i(N),b_i(N),carry(N-1),z_out(N),carry(N));
		END GENERATE R14;
		


-- fechar for
END GENERATE R1;


end structural;

-- full_adder_1
Library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity full_adder_1 is
	port
	(
	a_in, b_in, c_in		:	in STD_LOGIC;
	z_out, c_out		:	out STD_LOGIC
	);
	
end full_adder_1;



architecture dataflow of full_adder_1 is

signal aux_xor, aux_and_1, aux_and_2, aux_and_3	: STD_LOGIC;

begin

	z_out <= aux_xor xor c_in AFTER 4 ns;
     aux_xor <= a_in xor b_in AFTER 4 ns;
     aux_and_1 <= a_in and b_in AFTER 3 ns; 
     aux_and_2 <= a_in and c_in AFTER 3 ns; 
	c_out <= aux_and_1 or aux_and_2 or aux_and_3 AFTER 5 ns; 
	aux_and_3 <= b_in and c_in AFTER 3 ns; 
	
end dataflow;
