library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;


entity lfsr is 
	
	generic
	(
	WIDTH	: natural := 12
	);
	port
	(
	Q		        : out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
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

signal q_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);
signal d_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);

begin


-- for generate para criar lfsr
R1 : FOR N IN WIDTH-1 downto 0 GENERATE
-- instanciando o lfsr
			D0 :d_reg
			PORT MAP(clk,'1',d_s(N),q_s(N));
		
END GENERATE R1;

-- Mapeando a saida e entrada de cada d_reg

-- Para o Dreg 0
		 d_s(0) <= q_s(11) or rst ;
		 Q(0) <= q_s(0);

-- Para os FFs com xor		 
		d_s(1) <= ((q_s(0) xor q_s(11)) or rst);
		Q(1) <= q_s(1);
		
		d_s(4) <= ((q_s(3) xor q_s(11)) or rst);
		Q(4) <= q_s(4);
		
		d_s(6) <= ((q_s(5) xor q_s(11)) or rst);
		Q(6) <= q_s(6);
		
		d_s(8) <= ((q_s(7) xor q_s(11)) or rst);
		Q(8) <= q_s(8);
		
		d_s(10) <= ((q_s(9) xor q_s(11)) or rst);
		Q(10) <= q_s(10);
		
		d_s(11) <= ((q_s(10) xor q_s(11)) or rst);
		Q(11) <= q_s(11);
-- Para os FFs sem xor	
		d_s(2) <=  (q_s(1) or rst) ;
		Q(2) <= q_s(2);
		
		d_s(3) <=  (q_s(2) or rst) ;
		Q(3) <= q_s(3);
		
		d_s(5) <=  (q_s(4) or rst) ;
		Q(5) <= q_s(5);
		
		d_s(7) <=  (q_s(6) or rst) ;
		Q(7) <= q_s(7);
		
		d_s(9) <=  (q_s(8) or rst) ;
		Q(9) <= q_s(9);

end architecture estrutural;

--- arquivo d_reg
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;


entity d_reg is 
	
	generic (t_ff: time := 2 ns);
   
	port
	(
	clk  : in  STD_LOGIC;
	load : in  STD_LOGIC;
	d    : in  STD_LOGIC;
	q	 : out STD_LOGIC
	);
end d_reg;

architecture arch of d_reg is

signal q_s	: STD_LOGIC;

begin

	q <= q_s after t_ff;

-- Register with active-high clock
	process(clk)
	begin
		if clk'EVENT AND clk = '1' then
			if (load = '1') then
				q_s <= d;
			end if;
		end if;
	end process;
   
end arch;



