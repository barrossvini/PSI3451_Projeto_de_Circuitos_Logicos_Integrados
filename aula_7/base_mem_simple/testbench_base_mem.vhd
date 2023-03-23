library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Use work.wisdom_package.all;

entity tb_base_mem is

GENERIC (WIDTH: natural :=8);

end tb_base_mem;

architecture test of tb_base_mem is

	component base_mem_simple 

	generic
	(
	WIDTH		: NATURAL	:= 8
	);

	port
	(
		clk					: in  	STD_LOGIC;						--from system
		res					: in  	STD_LOGIC;						--from system
		ng_2_RB         	: in 	STD_LOGIC_VECTOR(WIDTH-1 downto 0);
		rb_INIT_en	    	: in 	STD_LOGIC;
		rb_GURU_en	    	: in 	STD_LOGIC;
		rb_PRE_GURU_en   	: in 	STD_LOGIC;
		out_sel		    	: in 	RB_SEL;
		cg_sel				: in 	CODE;
		base_mem_wren		: in 	STD_LOGIC;
		disc_mem_wren		: in 	STD_LOGIC;
		disc_mem_addr		: in STD_LOGIC_VECTOR(WIDTH-3 downto 0);
		disc_mem_data		: in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
		base_data_out	: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);				
		disc_data_out	: out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
		
	);
end component;

	component stimuli_base_mem_simple 
	generic
	(
	WIDTH:         NATURAL := 8;
	CLK_PERIOD		: TIME	:=  10ns
	);
	
	port
	(
		clk					: out  	STD_LOGIC;						--from system
		res					: out  	STD_LOGIC;						--from system
		ng_2_RB         	: out 	STD_LOGIC_VECTOR(WIDTH-1 downto 0);
		rb_INIT_en	    	: out 	STD_LOGIC;
		rb_GURU_en	    	: out 	STD_LOGIC;
		rb_PRE_GURU_en   	: out 	STD_LOGIC;
		out_sel		    	: out 	RB_SEL;
		cg_sel				: out 	CODE;
		base_mem_wren		: out 	STD_LOGIC;
		disc_mem_wren		: out 	STD_LOGIC;
		disc_mem_addr		: out STD_LOGIC_VECTOR(WIDTH-3 downto 0);
		disc_mem_data		: out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
		
	);
end component;

	signal ng_2_RB_s, disc_mem_data_s, base_data_out_s, disc_data_out_s: STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
	signal clk_s, res_s, rb_INIT_en_s, rb_GURU_en_s, rb_PRE_GURU_en_s, base_mem_wren_s, disc_mem_wren_s:  STD_LOGIC ;
	signal disc_mem_addr_s: STD_LOGIC_VECTOR (width-3 DOWNTO 0);
	signal out_sel_s: RB_SEL;
	signal cg_sel_s: CODE;


begin

	-- Instantiate mem_2port
	dut : base_mem_simple
		port map
		(
		clk					=> clk_s,
		res					=> res_s,
		ng_2_RB         	=> ng_2_RB_s,
		rb_INIT_en	    	=> rb_INIT_en_s,
		rb_GURU_en	    	=> rb_GURU_en_s,
		rb_PRE_GURU_en   	=> rb_PRE_GURU_en_s,
		out_sel		    	=> out_sel_s,
		cg_sel				=> cg_sel_s,
		base_mem_wren		=> base_mem_wren_s,
		disc_mem_wren		=> disc_mem_wren_s,
		disc_mem_addr		=> disc_mem_addr_s,
		disc_mem_data		=> disc_mem_data_s,
		base_data_out		=> base_data_out_s,
		disc_data_out		=> disc_data_out_s
			);

	-- Instantiate stimuli generation module
	stimuli : stimuli_base_mem_simple
		port map
		(
		clk					=> clk_s,
		res					=> res_s,
		ng_2_RB         	=> ng_2_RB_s,
		rb_INIT_en	    	=> rb_INIT_en_s,
		rb_GURU_en	    	=> rb_GURU_en_s,
		rb_PRE_GURU_en   	=> rb_PRE_GURU_en_s,
		out_sel		    	=> out_sel_s,
		cg_sel				=> cg_sel_s,
		base_mem_wren		=> base_mem_wren_s,
		disc_mem_wren		=> disc_mem_wren_s,
		disc_mem_addr		=> disc_mem_addr_s,
		disc_mem_data		=> disc_mem_data_s
			);

end architecture test;