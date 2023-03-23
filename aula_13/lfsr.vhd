library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;


entity lfsr is 
	port
	(
	Q		        : out STD_LOGIC_VECTOR (11 downto 0);
	clk				: in STD_LOGIC;			
	rst				: in STD_LOGIC	
	);
	
end lfsr;

architecture estrutural of lfsr is

    COMPONENT d_reg
	port
	(
	clk  : in  STD_LOGIC;
	load : in  STD_LOGIC;
	d    : in  STD_LOGIC;
	q	 : out STD_LOGIC
	);
	END COMPONENT;

signal q_s	: STD_LOGIC_VECTOR (11 downto 0);
signal d_s	: STD_LOGIC_VECTOR (11 downto 0);

begin


-- for generate para criar lfsr
R1 : for n in 11 downto 0 generate
-- instanciando o lfsr
			com_xor: if (n = 11) or (n = 10) or (n=8) or (n=6) or (n=4) or (n=1) generate 
				D0 :d_reg port map(clk,'1',d_s(n),q_s(n));
				d_s(n) <= ((q_s(n-1) xor q_s(11)) or rst );
			end generate com_xor;
			
			sem_xor: if (n=9) or (n=7) or (n=5) or (n=3) or (n=3) or (n=2) generate
				D1 :d_reg port map(clk,'1',d_s(n),q_s(N));
				d_s(n) <= (q_s(n-1) or rst);
			end generate sem_xor;
			
			zero: if n = 0 generate
				D2 :d_reg port map(clk,'1',d_s(n),q_s(n));
				d_s(n) <= (q_s(11) or rst);
			end generate zero;
		
end generate R1;

Q <= q_s;

end architecture estrutural;



