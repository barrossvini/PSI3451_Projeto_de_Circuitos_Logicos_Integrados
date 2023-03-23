library IEEE; 
use IEEE.STD_LOGIC_1164.all; 

package wisdom_package is 
	
	type CONTROL_SELECT is
	(
	INIT_CON,
	STEP_GURU_CON
	);
  
	type RB_SEL is	(
					INIT_OUT,
					REG_GURU_OUT,
					REG_GURU_PREV_OUT
					);
	
	
	type CODE is 	(
					BLANK,
					GURU,
					DISCIPLE,
					DUO
					);

	constant BLANK_VEC		: STD_LOGIC_VECTOR(7 downto 0) := "00000001";
	constant GURU_VEC	: STD_LOGIC_VECTOR(7 downto 0) := "00000010";
	constant DISC_VEC	: STD_LOGIC_VECTOR(7 downto 0) := "00000100";
	constant DUO_VEC	: STD_LOGIC_VECTOR(7 downto 0) := "00001000";
  	   
	type CODE_BITS is array (CODE) of STD_LOGIC_VECTOR(7 downto 0);
	constant CODE_VECTORS	: CODE_BITS	:= (BLANK_VEC, GURU_VEC, DISC_VEC, DUO_VEC);
					


	type ctrl_2_dp_flags is
	record
		ng_rand_zero		: STD_LOGIC;
		ng_cte_incr		: STD_LOGIC;
		rb_init_en		: STD_LOGIC;
		rb_out_sel		: RB_SEL;
	end record;
	
	type dp_2_ctrl_flags is
	record
		ovf_of_x		: STD_LOGIC;
		end_of_guru	: STD_LOGIC;
		ovf_of_y		: STD_LOGIC;
		duo_formed		: STD_LOGIC;
	end record;

	type disc_2_base_flags is
	record
		end_of_disc	: STD_LOGIC;
	end record;
	
	type disc_2_mem_flags is
	record
		mem_wr_en	: STD_LOGIC;
		mem_addr	: STD_LOGIC_VECTOR (5 DOWNTO 0);
		data_in		: STD_LOGIC_VECTOR (7 DOWNTO 0);
	end record;
			
	type base_2_mem_flags is
	record
		mem_wr_en	: STD_LOGIC;
		mem_addr	: STD_LOGIC_VECTOR (5 DOWNTO 0);
		data_in		: STD_LOGIC_VECTOR (7 DOWNTO 0);
	end record;
	
end wisdom_package ; 


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
		disc_2_mem_b		: IN disc_2_mem_flags;
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