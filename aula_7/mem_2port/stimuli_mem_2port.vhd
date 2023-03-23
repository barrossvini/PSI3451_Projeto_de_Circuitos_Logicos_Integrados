library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity stimuli_mem_2port is
	generic
	(
	WIDTH:         NATURAL := 8;
	CLK_PERIOD		: TIME	:=  10ns
	);

	PORT
	(
		address_a		: OUT STD_LOGIC_VECTOR (WIDTH-3 DOWNTO 0);
		address_b		: OUT STD_LOGIC_VECTOR (WIDTH-3 DOWNTO 0);
		clock		: OUT STD_LOGIC  ;
		data_a		: OUT STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
		data_b		: OUT STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
		wren_a		: OUT STD_LOGIC  ;
		wren_b		: OUT STD_LOGIC 
	);

end stimuli_mem_2port ;



architecture test of stimuli_mem_2port  is
	signal clk_s : STD_LOGIC;

	component clock_generator
		generic (
		CLK_PERIOD		: TIME	:= 10ns
		);

		port (	
		clk		: out STD_LOGIC
		);

end component ;

begin


	clock <=clk_s;

	clock_gen: clock_generator
		port map
		(
		clk		=> clk_s
		);


	sim : process
		
		procedure check_mem(address_a_value, address_b_value: in STD_LOGIC_VECTOR (5 DOWNTO 0); wren_a_value, wren_b_value: in STD_LOGIC; data_a_value, data_b_value: in STD_LOGIC_VECTOR (7 DOWNTO 0)) is
		
			begin
			-- Assign values to estimuli_module´s outputs.
			address_a <= address_a_value; 
			address_b <= address_b_value;
			wren_a <= wren_a_value;
			wren_b <= wren_b_value; 
			data_a <=  data_a_value;
			data_b <=  data_b_value;

			wait until rising_edge (clk_s);
			-- Events at the rising edge of next clock cycle
			end procedure check_mem;

		begin   -- process
			
		-- Apply test vectors
		--1) A primeira questão refere-se à escrita e leitura simultânea, ou seja, a necessidade de se
		--definir qual é o valor lido em q_a quando ocorre, no mesmo ciclo, a escrita em data_a (o
		--mesmo vale para o porto b). Nas memórias do IP Catalog/Libraryd a Intel, a saída q_a
		--assume o valor que está sendo escrito no mesmo ciclo de relógio.
		
		-- primeiro fazemos escrita em b e verificamos q_b até 31
		for i in 0 to 31 loop
			check_mem(std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i, 6)),'0','1',std_logic_vector(to_unsigned(4*i+3, 8)),std_logic_vector(to_unsigned(255-4*i, 8)));    -- fill in and check memory 
		end loop;
		-- aqui fazemos escrita em a e verificamos saida em q_a de 32 até 64
		for i in 32 to 64 loop
			check_mem(std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i, 6)),'1','0',std_logic_vector(to_unsigned(4*i+3, 8)),std_logic_vector(to_unsigned(255-4*i, 8)));    -- fill in and check memory 
		end loop;
		wait for 4*CLK_PERIOD; -- para dar espaço a nova simulação
		
		--2) A segunda questão a ser esclarecida é o caso em que o mesmo endereço de memória está
		--sendo considerado para as duas portas (o mesmo endereço de memória em address_a e
		--address_b). Para isto, existem mais dois casos a considerar:
		
		--a. a escrita simultânea de dados distintos em data_a e data_b: em memórias físicas
		--(implementadas em silício), o valor escrito seria a do dado mais atrasado
		--(último a chegar na célula de memória). Uma vez que, na implementação em IP
		--Catalog/Library da Intel, não se pode garantir se a escrita pelo porto a é mais
		--rápida ou mais lenta que no porto b (ou vice-versa), o valor escrito nesta
		--condição é 'X'. Atenção: Neste caso do bloco da Intel, no ciclo de escrita, as
		--saídas lidas são o s valores sendo escritos; só nos ciclos seguintes, novas leituras
		--na posição evidenciarão a presença do valor 'X'.
		for i in 0 to 64 loop
			check_mem(std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i, 6)),'1','1',std_logic_vector(to_unsigned(4*i+3, 8)),std_logic_vector(to_unsigned(255-4*i, 8)));    -- fill in and check memory 
			wait for 2*CLK_PERIOD; -- para poder observar o valor na saida
			check_mem(std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i, 6)),'0','0',std_logic_vector(to_unsigned(4*i+3, 8)),std_logic_vector(to_unsigned(255-4*i, 8)));
			wait for 2*CLK_PERIOD;
		end loop;
		-- aqui passamos o mesmo endereço e fazemos a e b escrever ao mesmo tempo no mesmo endereço
		
		wait for 4*CLK_PERIOD; -- para dar espaço a nova simulação
		--b. a escrita no porto a e a leitura no porto b (ou vice-versa): o recurso de IP
		--Catalog/Library da Intel permite ao usuário optar que, no ciclo de escrita, a saída
		--no porto b seja 'X' ou o valor de data_b anterior. No caso do projeto Wisdom, a
		--segunda opção é usada para evitar a indefinição. É evidente, por correção, que a
		--leitura futura na mesma posição em qualquer um dos portos produzirá na saída o
		--valo escrito no porto a.
		
		for i in 0 to 31 loop
			check_mem(std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i, 6)),'1','0',std_logic_vector(to_unsigned(4*i+3, 8)),std_logic_vector(to_unsigned(255-4*i, 8)));    -- fill in and check memory 
			wait for 2*CLK_PERIOD; -- para poder observar o valor na saida
		end loop;
		-- de 0 a 31 escrevemos em a e lemos em q_b
		for i in 32 to 64 loop
			check_mem(std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i, 6)),'0','1',std_logic_vector(to_unsigned(4*i+3, 8)),std_logic_vector(to_unsigned(255-4*i, 8)));    -- fill in and check memory 
			wait for 2*CLK_PERIOD; -- para poder observar o valor na saida
		end loop;
		-- de 32 a 64 escrevemos em b e lemos em q_a
	
		
		wait;
	end process sim;
end architecture test;