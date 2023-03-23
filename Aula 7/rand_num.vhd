library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;


entity rand_num is
    generic
	(
	WIDTH	: natural := 12
	);
	port
	(
	clk  : in  STD_LOGIC;
	rst: in  STD_LOGIC;
	Q0    : out  STD_LOGIC;
	Q1	 : out STD_LOGIC
	);
end rand_num;

architecture structural of rand_num is
-- declara componente lfsr
    COMPONENT lfsr
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
	END COMPONENT;

signal q_s	: STD_LOGIC_VECTOR (WIDTH-1 downto 0);

begin
-- liga o sinal q_s ao Q do lfsr
    L0 : lfsr
	PORT MAP(q_s,clk,rst);
-- liga o sinal nas saidas
	Q0 <= q_s(0);
	Q1 <= q_s(1);


end structural;





