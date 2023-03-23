library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Use work.wisdom_package.all;

entity stimuli_alu_mem is
	generic
	(
	WIDTH:         NATURAL := 8;
	CLK_PERIOD		: TIME	:=  10ns
	);
	
	port
	(
	clk					: out STD_LOGIC;
	bs_from_rb			: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	ds_from_rb			: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	bs_from_cte			: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	ds_from_cte			: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	bs_ng_cte_incr		: out STD_LOGIC;
	ds_ng_cte_incr		: out STD_LOGIC;
	bs_data_in			: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	ds_data_in			: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	bs_data_out			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	ds_data_out			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	bs_mem_wr_en		: out STD_LOGIC;
	ds_mem_wr_en		: out STD_LOGIC
	);

end stimuli_alu_mem ;

architecture test of stimuli_alu_mem  is
	signal clk_s : STD_LOGIC;
	signal j: integer;

	component clock_generator
		generic (
		CLK_PERIOD		: TIME	:= 10ns
		);

		port (	
		clk		: out STD_LOGIC
		);

end component ;

begin

	
	clk <=clk_s;

	clock_gen: clock_generator
		port map
		(
		clk		=> clk_s
		);


	sim : process
		
		
		procedure check_mem_bs(bs_from_rb_value, bs_from_cte_value: in STD_LOGIC_VECTOR (7 DOWNTO 0); bs_ng_cte_incr_value: in STD_LOGIC ; bs_data_in_value: in STD_LOGIC_VECTOR (7 DOWNTO 0); bs_mem_wr_en_value: in STD_LOGIC) is
		
			begin
			-- Assign values to estimuli_module´s outputs.
			bs_from_rb <= bs_from_rb_value; 
			bs_from_cte <= bs_from_cte_value;
			bs_ng_cte_incr <= bs_ng_cte_incr_value;
			bs_data_in <= bs_data_in_value; 
			bs_mem_wr_en <=  bs_mem_wr_en_value;

			wait until rising_edge (clk_s);
			-- Events at the rising edge of next clock cycle
			end procedure check_mem_bs;
			
			procedure check_mem_ds(ds_from_rb_value, ds_from_cte_value: in STD_LOGIC_VECTOR (7 DOWNTO 0); ds_ng_cte_incr_value: in STD_LOGIC ; ds_data_in_value: in STD_LOGIC_VECTOR (7 DOWNTO 0); ds_mem_wr_en_value: in STD_LOGIC) is
		
			begin
			-- Assign values to estimuli_module´s outputs.
			ds_from_rb <= ds_from_rb_value; 
			ds_from_cte <= ds_from_cte_value;
			ds_ng_cte_incr <= ds_ng_cte_incr_value;
			ds_data_in <= ds_data_in_value; 
			ds_mem_wr_en <=  ds_mem_wr_en_value;

			wait until rising_edge (clk_s);
			-- Events at the rising edge of next clock cycle
			end procedure check_mem_ds;
			

		begin   -- process
			
		-- Apply one test vectors quite random- first port a and, one cycle later, port b - writing for one cycle
		
			check_mem_bs(std_logic_vector(to_unsigned(15, 8)), std_logic_vector(to_unsigned(40, 8)),'0',std_logic_vector(to_unsigned(41, 8)),'1');    -- fill in and check port A 
			check_mem_ds(std_logic_vector(to_unsigned(31, 8)), std_logic_vector(to_unsigned(60, 8)),'0',std_logic_vector(to_unsigned(61, 8)),'1');    -- fill in and check port A 
		 	check_mem_bs(std_logic_vector(to_unsigned(15, 8)), std_logic_vector(to_unsigned(40, 8)),'0',std_logic_vector(to_unsigned(41, 8)),'0');    -- fill in and check port A 
			check_mem_ds(std_logic_vector(to_unsigned(31, 8)), std_logic_vector(to_unsigned(60, 8)),'0',std_logic_vector(to_unsigned(61, 8)),'0');    -- fill in and check port A 
		
		-- Apply vector and write it every 10 clock cycles 
		 
		for i in 0 to 63 loop
		
			for j in 0 to 9 loop
				if (j= 9) then
				check_mem_bs(std_logic_vector(to_unsigned(i, 8)), std_logic_vector(to_unsigned(0, 8)),'1',std_logic_vector(to_unsigned(i+2, 8)),'1');    -- fill in and check port A 
				check_mem_ds(std_logic_vector(to_unsigned(i+3, 8)), std_logic_vector(to_unsigned(0, 8)),'1',std_logic_vector(to_unsigned(i+5, 8)),'1');    -- fill in and check port A 
				check_mem_bs(std_logic_vector(to_unsigned(i, 8)), std_logic_vector(to_unsigned(0, 8)),'1',std_logic_vector(to_unsigned(i+2, 8)),'0');    -- fill in and check port A 
				check_mem_ds(std_logic_vector(to_unsigned(i+3, 8)), std_logic_vector(to_unsigned(0, 8)),'1',std_logic_vector(to_unsigned(i+5, 8)),'0');    -- fill in and check port A 
				else
				wait until rising_edge (clk_s);		
				end if;
			end loop;
		end loop;
	end process sim;
end architecture test;