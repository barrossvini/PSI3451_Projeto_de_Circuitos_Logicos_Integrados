library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_package.all;


entity tb_step_counter_2 is

GENERIC (	COUNT_COUNT_WIDTH 	: NATURAL 	:= 16;
			CLK_PERIOD		: TIME	:=  10 ns);

end tb_step_counter_2 ;

architecture test of tb_step_counter_2 is

	component step_counter_2  
	generic
	(
	COUNT_MAX_V8_FAST	: UNSIGNED	:= x"50";    -- 50 hexadecimal and 80 decimal
	COUNT_COUNT_WIDTH 	: NATURAL 	:= 16
	);

	port
	(
	clk		: in STD_LOGIC;
	res		: in STD_LOGIC;
	go		: in STD_LOGIC;
	speed_sync		: in SPEED_FACTOR;
	cnt_guru_rdy	: out STD_LOGIC;
	cnt_disc_rdy	: out STD_LOGIC;
	cnt_value	: out UNSIGNED(COUNT_COUNT_WIDTH-1 downto 0)
	);
	end component;

	component stimuli_step_counter_2_modif
	generic
	(
	CLK_PERIOD		: TIME	:=  10 ns
	);

	port
	(
	clk		: out STD_LOGIC;
	rst		: out STD_LOGIC;
	speed_sync		: out SPEED_FACTOR;
	cnt_guru_rdy	: in STD_LOGIC;    --from counter: indicates max count
	go	: out STD_LOGIC    --to counter: authorizes new counting 
	);
	end component;

	signal clk_s, rst_s, cnt_guru_rdy_s, cnt_disc_rdy_s, go_s: STD_LOGIC :='0';
	signal cnt_value_s	:  UNSIGNED(COUNT_COUNT_WIDTH-1 downto 0);
	signal speed_sync_s	: SPEED_FACTOR;

begin

	-- Instantiate DUT
	dut : step_counter_2 
		port map
		(
		clk				=> clk_s,			
		res				=> rst_s,
		go				=> go_s,
		speed_sync		=> speed_sync_s,
		cnt_guru_rdy			=> cnt_guru_rdy_s,	
		cnt_disc_rdy			=> cnt_disc_rdy_s,	
		cnt_value   		=> cnt_value_s		
				);

	-- Instantiate stimuli generation module
	stim : stimuli_step_counter_2_modif
		generic map ( CLK_PERIOD => CLK_PERIOD)
		port map
		(
		clk				=> clk_s,			
		rst				=> rst_s,
		speed_sync		=> speed_sync_s,
		go				=> go_s,
		cnt_guru_rdy			=> cnt_guru_rdy_s
		);

end architecture test;