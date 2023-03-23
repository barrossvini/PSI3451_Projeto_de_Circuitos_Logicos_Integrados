Library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity rc_adder_1 is
	generic
	(
	WIDTH	: natural := 4
	);
	port
	(
	a_i, b_i		:	in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
	z_out		:	out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
	c_i			:	in STD_LOGIC;
	c_o			:	out STD_LOGIC
	);
	
end rc_adder_1;


architecture structural of rc_adder_1 is

component full_adder_2 
port
	(
	a_in, b_in, c_in		:	in STD_LOGIC;
	z_out, c_out		:	out STD_LOGIC
	);
	
end component;

component full_adder_1 
	port
	(
	a_in, b_in, c_in		:	in STD_LOGIC;
	z_out, c_out		:	out STD_LOGIC
	);
	
end component;

signal carry: STD_LOGIC_VECTOR (WIDTH-1 downto 0);

begin


		 f1 :full_adder_2
		 PORT MAP(a_i(WIDTH-1),b_i(WIDTH-1),c_i,z_out(WIDTH-1),carry(WIDTH-1));
		 

		 f2 :full_adder_2
		 PORT MAP(a_i(WIDTH-2),b_i(WIDTH-2),carry(WIDTH-1),z_out(WIDTH-2),carry(WIDTH-2));

		 
		 f3 :full_adder_2
		 PORT MAP(a_i(WIDTH-3),b_i(WIDTH-3),carry(WIDTH-2),z_out(WIDTH-3),carry(WIDTH-3));
		 
		 f4 :full_adder_1
		 PORT MAP(a_i(0),b_i(0),carry(WIDTH-3),z_out(0),carry(0));
		 
		 c_o <= carry(0);
		 

end structural;

Library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity full_adder_2 is
	port
	(
	a_in, b_in, c_in		:	in STD_LOGIC;
	z_out, c_out		:	out STD_LOGIC
	);
	
end full_adder_2;


architecture structural of full_adder_2 is

	COMPONENT and2 
		GENERIC (t_and: time := 3 ns);
		PORT (x, y: IN STD_LOGIC;
			    z   : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT xor2
		GENERIC (t_xor: time := 4 ns);
		PORT (x, y: IN STD_LOGIC;
			    z: OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT or3
		GENERIC (t_or: time := 5 ns);
		PORT (w, x, y: IN STD_LOGIC;
			    z: OUT STD_LOGIC);
	END COMPONENT;  
  
signal aux_xor, aux_and_1, aux_and_2, aux_and_3	: STD_LOGIC;

begin

	XOR_2: xor2 GENERIC MAP (13 ns) PORT MAP (x=>c_in ,y=>aux_xor ,z=>z_out ); 
     	XOR_1: xor2 GENERIC MAP (13 ns) PORT MAP (y=>b_in, z=>aux_xor, x=>a_in); 
     	AND_1: and2 GENERIC MAP (10 ns) PORT MAP (y=>b_in, z=>aux_and_1, x=>a_in); 
     	AND_2: and2 GENERIC MAP (10 ns) PORT MAP (a_in ,c_in, aux_and_2 ); 
	OR_3: or3 GENERIC MAP (15 ns) PORT MAP (aux_and_1, aux_and_2 ,y=>aux_and_3, z=>c_out ); 
	AND_3: and2 GENERIC MAP (10 ns) PORT MAP (x=>b_in ,y=>c_in ,z=>aux_and_3 ); 


end structural;

Library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY and2 IS
	GENERIC(t_and : time := 2 ns);
	PORT( x, y: IN STD_LOGIC;
		    z: OUT STD_LOGIC);
END and2;

ARCHITECTURE dataflow OF and2 IS

BEGIN 
	z <= x AND y AFTER t_and;
END dataflow;

Library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY xor2 IS
	GENERIC(t_xor : time := 4 ns);
	PORT( x, y: IN STD_LOGIC;
		    z: OUT STD_LOGIC);
END xor2;

ARCHITECTURE dataflow OF xor2 IS

BEGIN 
	z <= x XOR y AFTER t_xor;
END dataflow;

Library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY or3 IS
	GENERIC(t_or : time := 4 ns);
	PORT( w, x, y: IN STD_LOGIC;
		    z: OUT STD_LOGIC);
END or3;

ARCHITECTURE dataflow OF or3 IS

BEGIN 
	z <= w OR x OR y AFTER t_or;
END dataflow;

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