-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Wisdom
-------------------------------------------------------------------------------
--
--
-- Description : 
--
-------------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.all; 

package wisdom_package is 
	
	type CONTROL_SELECT is
	(
	INIT_CON,
	GURU_CON
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
		cg_sel			: CODE;
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

	type base_2_mem_flags is
	record
		mem_wr_en	: STD_LOGIC;
	end record;
	
end wisdom_package ; 



library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.wisdom_package.all;


entity fsm_main is 
	port
	(
	clk				: in STD_LOGIC;			--from system
	res				: in STD_LOGIC;			--from system
	fsm_i_done		: in STD_LOGIC;			--from fsm internal
	end_of_guru		: in STD_LOGIC;			--from datapath	
	end_of_disc		: in STD_LOGIC;			--from system; disciple circuit
	duo_formed		: in STD_LOGIC;			--from datapath
	fsm_i_start		: out STD_LOGIC;		--to fsm internal
	fsm_s_start		: out STD_LOGIC;		--to fsm internal
	con_sel			: out CONTROL_SELECT	--to fsm internal
	);
end fsm_main;


architecture arch of fsm_main is

-- SYMBOLIC ENCODED FSM STATES
type STATE_TYPE_MAIN is (
    INIT_ACTIVATION, STEP_ACTIVATION, CHECK_END, HIT_POINT);

signal STATE, NEXT_STATE: STATE_TYPE_MAIN;

-- Declarations of pre-registered internal signals

begin

------------------------------------
-- Next State Logic (combinatorial)
------------------------------------

upd_next_state:	process (fsm_i_done, end_of_guru, end_of_disc, duo_formed, STATE)
				begin
					case STATE is
						when INIT_ACTIVATION	=> 	if(fsm_i_done = '1') then
												NEXT_STATE <= STEP_ACTIVATION;
											else
			    								NEXT_STATE <= INIT_ACTIVATION;
											end if;
		
						when STEP_ACTIVATION	=> 	NEXT_STATE <= CHECK_END;	
						
						when CHECK_END 		=> 	if (end_of_guru = '0') OR (end_of_disc = '0') then 
													NEXT_STATE <= CHECK_END;
												elsif (end_of_guru = '1') AND (end_of_disc = '1') AND (duo_formed = '0') then
													NEXT_STATE <= STEP_ACTIVATION;  
												else     ----  (end_of_guru = '1') AND (end_of_disc = '1') AND (duo_formed = '1') 
													NEXT_STATE <= HIT_POINT;
												end if;
											
						when HIT_POINT 		=> 	NEXT_STATE <= STEP_ACTIVATION;
												
						when others		=> null;
				
					end case;
				end process;
------------------------------------
-- Current State Logic (sequential)
------------------------------------
upd_state:	process (clk, res)
				begin
					if clk'event and clk = '1' then
						if(res = '1')	then
							STATE <= INIT_ACTIVATION;
						else
							STATE <= NEXT_STATE;
						end if;
					end if;
				end process;


------------------------------------
-- OUTPUT Logic (combinatorial)
------------------------------------
upd_output:	process (STATE)
			begin
				case STATE is
					when INIT_ACTIVATION	=> 	con_sel		<= INIT_CON;
										fsm_i_start	<= '1';
										fsm_s_start	<= '0';
			
					when STEP_ACTIVATION	=>  con_sel		<= GURU_CON;
										fsm_i_start	<= '0';
										fsm_s_start	<= '1';
						
					when CHECK_END 			=> 	con_sel		<= GURU_CON;
										fsm_i_start	<= '0';
										fsm_s_start	<= '0';
			
					when HIT_POINT 		=> 	con_sel		<= GURU_CON;
										fsm_i_start	<= '0';
										fsm_s_start	<= '0';
		
					when others				=> null;
			
				end case;
			end process;

					
				
end arch;
