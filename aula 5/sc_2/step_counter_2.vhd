--***************************************************************
--*																*
--*	Title	:	Step Counter									*
--*	Design	:	wisdom_hw										*
--*	Author	:	Frederik Luehrs	/ Wang J. Chau								*
--*								*
--*																*
--***************************************************************
--*																*
--*	Description :												*
--*																*
--***************************************************************

package my_package is

	 type SPEED_FACTOR is	(    -- this is an enumerate type
					x1,  --slowest - triggers at 8*max_ref_count || speed is guru´s speed
					x2,  --second slowest - triggers at 4*max_ref_count || speed is 2*guru´s speed
					x4,	 --second fastest - triggers at 2*max_ref_count || speed is 4*guru´s speed
					x8   --fastest - triggers at max_ref_count || speed is 8*guru´s speed
					);
					
end package;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.my_package.all;


entity step_counter_2 is 
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
end step_counter_2;


architecture arch of step_counter_2 is

--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************

	signal cnt_v1_s	: STD_LOGIC ;    --signal evaluates to '1' when counting reaches 8*COUNT_MAX_V8_FAST
	signal cnt_v2_s	: STD_LOGIC ;    --signal evaluates to '1' when counting reaches 4*COUNT_MAX_V8_FAST
	signal cnt_v4_s	: STD_LOGIC ; 	 --signal evaluates to '1' when counting reaches 2*COUNT_MAX_V8_FAST
	signal cnt_v8_s	: STD_LOGIC ;    --signal evaluates to '1' when counting reaches COUNT_MAX_V8_FAST

		
begin

	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	
	cnt_guru_rdy <=  cnt_v1_s;
	
	cnt_disc_rdy <= cnt_v1_s	when (speed_sync = x1) else
					cnt_v2_s	when (speed_sync = x2) else
					cnt_v4_s	when (speed_sync = x4) else
					cnt_v8_s	when (speed_sync = x8);
					
	
	
	--*******************************
	--*	PROCESS DEFINITIONS			*
	--*******************************
				
	--increment counter each cycle
	--reset if max reached or clr is set
	
	
	process(clk, res)
		variable cnt_s	: UNSIGNED (COUNT_COUNT_WIDTH-1 downto 0)	:= x"0000";
		variable go_allowed	: STD_LOGIC:= '1' ;   
	begin
		if clk'event and clk = '1' then
			if(res = '1') then
				cnt_s := x"0000";
			elsif(cnt_s = 8*COUNT_MAX_V8_FAST) then
				go_allowed := '0';
				cnt_s := x"0000";	
				cnt_v1_s <= '1';	
				cnt_v2_s <= '1';	
				cnt_v4_s <= '1';	
				cnt_v8_s <= '1';
			else
				if (cnt_s = 4*COUNT_MAX_V8_FAST) then
					cnt_v2_s <= '1';	
					cnt_v4_s <= '1';	
					cnt_v8_s <= '1';
				elsif ((cnt_s = 2*COUNT_MAX_V8_FAST) OR (cnt_s = 6*COUNT_MAX_V8_FAST)) then
					cnt_v4_s <= '1';	
					cnt_v8_s <= '1';
				elsif (cnt_s = 1*COUNT_MAX_V8_FAST OR cnt_s = 3*COUNT_MAX_V8_FAST OR cnt_s = 5*COUNT_MAX_V8_FAST OR cnt_s = 7*COUNT_MAX_V8_FAST) then
					cnt_v8_s <= '1';
				else
					cnt_v1_s <= '0';	
					cnt_v2_s <= '0';	
					cnt_v4_s <= '0';	
					cnt_v8_s <= '0';	
				end if;
				if (go_allowed ='1') then
					cnt_s := cnt_s + 1;	
				end if;
			end if;
				cnt_value <= cnt_s;
			if (go = '1') then
				go_allowed := '1';
			end if;
		end if;
	end process;

	

end arch;
