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



library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.wisdom_package.all;


entity alu_mem is 
	generic
	(
	WIDTH		: NATURAL	:= 8
	);

	port
	(
	clk					: in STD_LOGIC;
	bs_from_rb			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	ds_from_rb			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	bs_from_cte			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	ds_from_cte			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	bs_ng_cte_incr		: in STD_LOGIC;
	ds_ng_cte_incr		: in STD_LOGIC;
	bs_data_in			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	ds_data_in			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	bs_data_out			: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	ds_data_out			: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	bs_mem_wr_en		: in STD_LOGIC;
	ds_mem_wr_en		: in STD_LOGIC
	);
end alu_mem;






architecture add_mux of alu_mem is


--***********************************
--*	COMPONENT DECLARATIONS			*
--***********************************

component alu  
	generic
	(
	WIDTH		: NATURAL	:= 8
	);

	port
	(
	rb_op			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	alu_result		: out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	);
end component;

component mem_2port 
	PORT
	(
		clock				: IN STD_LOGIC  ;
		base_2_mem_a		: IN base_2_mem_flags;
		data_out_2_base_a	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		disc_2_mem_b		: IN base_2_mem_flags;
		data_out_2_disc_b	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;

--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
 
signal bs_ula2mux, ds_ula2mux		: std_logic_vector(WIDTH-1 downto 0); 
signal bs_mux_out, ds_mux_out		: std_logic_vector(WIDTH-1 downto 0);


begin

	--*******************************
	--*	COMPONENT INSTANTIATIONS	*
	--*******************************

	mem:	mem_2port	
						port map
						(
						clock						=> clk,
						base_2_mem_a.data_in		=> bs_data_in,
						base_2_mem_a.mem_addr		=> bs_mux_out(5 downto 0),
						base_2_mem_a.mem_wr_en		=> bs_mem_wr_en,		
						data_out_2_base_a			=> bs_data_out,
						disc_2_mem_b.data_in		=> ds_data_in,
						disc_2_mem_b.mem_addr		=> ds_mux_out(5 downto 0),
						disc_2_mem_b.mem_wr_en		=> ds_mem_wr_en,			
						data_out_2_disc_b			=> ds_data_out
						);
	
	alu_bs:	alu    	-- base circuit
		port map
						(
						rb_op		=> bs_from_rb,
						alu_result	=> bs_ula2mux
						);
						
	alu_ds:	alu		-- disciple circuit
		port map
						(
						rb_op		=> ds_from_rb,
						alu_result	=> ds_ula2mux
						);
						
	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	
	bs_mux_out <= bs_from_cte when (bs_ng_cte_incr='0' ) else bs_ula2mux;
	ds_mux_out <= ds_from_cte when (ds_ng_cte_incr='0' ) else ds_ula2mux;
	
	--*******************************
	--*	PROCESS DEFINITIONS			*
	--*******************************
	

end add_mux;


