library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Use work.wisdom_package.all;

entity stimuli_mem_2port is
	generic
	(
	WIDTH:         NATURAL := 8;
	CLK_PERIOD		: TIME	:=  10ns
	);
	
	PORT
	(
		clock				: OUT STD_LOGIC  ;
		base_2_mem_a		: OUT base_2_mem_flags;
		data_out_2_base_a	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		disc_2_mem_b		: OUT base_2_mem_flags;
		data_out_2_disc_b	: IN STD_LOGIC_VECTOR (7 DOWNTO 0)
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
		
		procedure check_mem(address_a_value,address_b_value: in STD_LOGIC_VECTOR (5 DOWNTO 0);
							wren_a_value, wren_b_value: in STD_LOGIC;
							data_a_value, data_b_value: in STD_LOGIC_VECTOR (7 DOWNTO 0)) is
		
			begin
			-- Assign values to estimuli_module´s outputs.
			base_2_mem_a.mem_addr <= address_a_value; 
			disc_2_mem_b.mem_addr <= address_b_value;
			base_2_mem_a.mem_wr_en <= wren_a_value;
			disc_2_mem_b.mem_wr_en <= wren_b_value; 
			base_2_mem_a.data_in <=  data_a_value;
			disc_2_mem_b.data_in <=  data_b_value;

			wait until rising_edge (clk_s);
			-- Events at the rising edge of next clock cycle
			end procedure check_mem;

		begin   -- process
			
		-- Apply test vectors
		
		for i in 0 to 63 loop
		-- avalia o caso 1 :
			check_mem(std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i, 6)),'0','1',std_logic_vector(to_unsigned(4*i+3, 8)),std_logic_vector(to_unsigned(255-4*i, 8)));    -- fill in and check memory 
		end loop;
		wait for 4*CLK_PERIOD; -- para dar tempo ao inicio da proxima condição
		for i in 0 to 63 loop
		--Avalia 2a, quem escreve na saida caso as duas queiram escrever ao mesmo tempo na mesma posicao, deve ser aleatório:
			check_mem(std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i, 6)),'1','1',std_logic_vector(to_unsigned(4*i+3, 8)),std_logic_vector(to_unsigned(255-4*i, 8)));
			wait for 2*CLK_PERIOD;
		end loop;
		-- serve para saber oq acontece se w_a = 0 e w_b = 0
		check_mem(std_logic_vector(to_unsigned(63, 6)), std_logic_vector(to_unsigned(63, 6)),'0','0',std_logic_vector(to_unsigned(255, 8)),std_logic_vector(to_unsigned(3, 8)));
		wait for 4*CLK_PERIOD;
		for i in 0 to 63 loop
		--avalia 2b, escreve em a, le em b, pra isso precisa esperar um ciclo:
			check_mem(std_logic_vector(to_unsigned(i, 6)), std_logic_vector(to_unsigned(i, 6)),'1','0',std_logic_vector(to_unsigned(4*i+3, 8)),std_logic_vector(to_unsigned(255-4*i, 8)));
			wait for 2*CLK_PERIOD;-- espera um ciclo pra poder ver na saida dps q escreveu
		end loop;
		
		
		wait;
	end process sim;
end architecture test;