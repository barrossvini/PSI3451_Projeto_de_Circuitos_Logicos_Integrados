

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

Use work.wisdom_package.all;


ENTITY mem_2port IS
	PORT
	(
		clock				: IN STD_LOGIC  ;
		base_2_mem_a		: IN base_2_mem_flags;
		data_out_2_base_a	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		disc_2_mem_b		: IN base_2_mem_flags;
		data_out_2_disc_b	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END mem_2port;


ARCHITECTURE structure OF mem_2port IS



	COMPONENT mem_quartus
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		clock			: IN STD_LOGIC  ;
		data_a			: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b			: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a			: IN STD_LOGIC  ;
		wren_b			: IN STD_LOGIC  ;
		q_a				: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b				: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	Mem_block: mem_quartus
		PORT MAP (
		wren_a => base_2_mem_a.mem_wr_en,
		clock => clock,
		wren_b => disc_2_mem_b.mem_wr_en,
		address_a => base_2_mem_a.mem_addr,
		address_b => disc_2_mem_b.mem_addr,
		data_a => base_2_mem_a.data_in,
		data_b => disc_2_mem_b.data_in,
		q_a => data_out_2_base_a,
		q_b => data_out_2_disc_b
	);



END structure;