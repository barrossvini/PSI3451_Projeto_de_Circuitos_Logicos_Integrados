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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.wisdom_package.all;


entity alu_mem is 
	generic
	(
	WIDTH		: NATURAL	:= 8
	);

--***************************************************************
--*	PORT NAMES ARE COMPATIBLE WITH FIGURE IN CLASS HANDOUT	  *
--***************************************************************


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
		rb_op			: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
		alu_result		: out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	);

	port
	(

	);
end component;

component mem_2port 
	PORT
	(
		clock				: IN STD_LOGIC  ;
		base_2_mem_a		: IN base_2_mem_flags;
		data_out_2_base_a	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		disc_2_mem_b		: IN disc_2_mem_flags;
		data_out_2_disc_b	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)

	);
end component;
component mux
	generic
	(
	WIDTH		: NATURAL	:= 8
	);
	port
	(
		out_sel		: in STD_LOGIC;
		rb_out		: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
		from_cte    : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0);
		ula2mux     : in  STD_LOGIC_VECTOR(WIDTH-1 downto 0)
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

	mem:	mem_2port		-- 2-pot memory intantiation circuit intantiation
						port map
						(

							clock					=> clk;
							base_2_mem_a			=> base_2_mem_flags_sig;
							base_2_mem_a.data_in 	=> bs_data_in;
							base_2_mem_a.mem_addr	=> bs_mux_out
							base_2_mem_a.mem_wr_en	=> bs_mem_wr_en;
							data_out_2_base_a		=> bs_data_out;
							disc_2_mem_b.data_in	=> ds_data_in;
							disc_2_mem_b.mem_addr	=> ds_mux_out;
							disc_2_mem_b.mem_wr_en	=> ds_mem_wr_en;
							data_out_2_disc_b		=> ds_data_out

						);
	
	alu_bs:	alu    	-- base circuit intantiation
		port map
						(
						rb_op			=> bs_from_rb;
						alu_result		=> bs_ula2mux
						
						);
						
	alu_ds:	alu		-- disciple circuit intantiation
		port map
						(
						rb_op			=> ds_from_rb;
						alu_result		=> ds_ula2mux
						);
						
	m_d: mux
		port map
						(
						out_sel		=> ds_ng_cte_incr;
						rb_out		=> ds_mux_out;
						from_cte    => ds_from_cte;
						ula2mux		=> ds_ula2mux
						);
						
	m_b: mux
		port map
						(
						out_sel		=> bs_ng_cte_incr;
						rb_out		=> bs_mux_out;
						from_cte    => bs_from_cte;
						ula2mux		=> bs_ula2mux
						);
						
						
	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	
	--*******************************
	--*	EiTHER INTANTIATION OF MUXEX MODULES OR DATAFLOW MUXES * 
	--*******************************
	
	

	

end add_mux;


