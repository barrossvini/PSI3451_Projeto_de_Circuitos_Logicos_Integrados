library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Use work.wisdom_package.all;

entity tb_alu_mem is

GENERIC (WIDTH: natural :=8);

end tb_alu_mem;

architecture test of tb_alu_mem is

	component alu_mem  
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
	end component;

	component stimuli_alu_mem 
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
	end component;

	signal bs_from_rb_s, ds_from_rb_s, bs_from_cte_s, ds_from_cte_s: STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
	signal clk_s, bs_ng_cte_incr_s, ds_ng_cte_incr_s:  STD_LOGIC ;
	signal bs_data_in_s, ds_data_in_s, bs_data_out_s, ds_data_out_s: STD_LOGIC_VECTOR (width-1 DOWNTO 0);
	signal bs_mem_wr_en_s, ds_mem_wr_en_s:  STD_LOGIC ;

begin

	-- Instantiate mem_2port
	dut : alu_mem
		port map
		(
		clk					=> clk_s,
		bs_from_rb			=> bs_from_rb_s,
		ds_from_rb			=> ds_from_rb_s,
		bs_from_cte			=> bs_from_cte_s,
		ds_from_cte			=> ds_from_cte_s,
		bs_ng_cte_incr		=> bs_ng_cte_incr_s,
		ds_ng_cte_incr		=> ds_ng_cte_incr_s,
		bs_data_in			=> bs_data_in_s,
		ds_data_in			=> ds_data_in_s,
		bs_data_out			=> bs_data_out_s,
		ds_data_out			=> ds_data_out_s,
		bs_mem_wr_en		=> bs_mem_wr_en_s,
		ds_mem_wr_en		=> ds_mem_wr_en_s
			);

	-- Instantiate stimuli generation module
	stimuli : stimuli_alu_mem
		port map
		(
		clk					=> clk_s,
		bs_from_rb			=> bs_from_rb_s,
		ds_from_rb			=> ds_from_rb_s,
		bs_from_cte			=> bs_from_cte_s,
		ds_from_cte			=> ds_from_cte_s,
		bs_ng_cte_incr		=> bs_ng_cte_incr_s,
		ds_ng_cte_incr		=> ds_ng_cte_incr_s,
		bs_data_in			=> bs_data_in_s,
		ds_data_in			=> ds_data_in_s,
		bs_data_out			=> bs_data_out_s,
		ds_data_out			=> ds_data_out_s,
		bs_mem_wr_en		=> bs_mem_wr_en_s,
		ds_mem_wr_en		=> ds_mem_wr_en_s
			);

end architecture test;