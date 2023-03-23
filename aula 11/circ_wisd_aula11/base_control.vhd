--***************************************************************
--*																*
--*	Title	: Control Unit										*
--*	Design	: Snake Project										*
--*	Author	: Frederik Luehrs									*
--*	Email	: luehrs.fred@gmail.com								*
--*																*
--***************************************************************
--*																*
--*	Description :												*
--*																*
--***************************************************************

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.wisdom_package.all;

entity base_control is 
	port
	(
	clk				: in  STD_LOGIC;						--from system
	res				: in  STD_LOGIC;						--from system
	cnt_guru_rdy	: in  STD_LOGIC;						--from counter
	dp_2_ctrl      : in  dp_2_ctrl_flags;
	disc_2_base    : in  disc_2_base_flags;
	ref_2_base     : in  ref_2_base_flags;				--from referee
	base_2_disc    : out base_2_disc_flags;
	ctrl_2_dp      : out ctrl_2_dp_flags;
	ctrl_2_mem     : out base_2_mem_flags
	);
end  base_control;



architecture arch of  base_control is


--***********************************
--*	COMPONENT DECLARATIONS			*
--***********************************

component fsm_main is 
	port
	(
	clk				: in STD_LOGIC;			--from system
	res				: in STD_LOGIC;			--from system
	fsm_i_done		: in STD_LOGIC;			--from fsm internal
	end_of_guru		: in STD_LOGIC;			--from datapath	
	end_of_disc		: in STD_LOGIC;			--from system; disciple circuit
	duo_formed		: in STD_LOGIC;			--from datapaths
	con_sel        : out CONTROL_SELECT;
	fsm_i_start		: out STD_LOGIC;		   --to fsm internal
	fsm_s_start		: out STD_LOGIC			--to fsm internal
	);
end component;

component fsm_init is 
	port
	(
	clk				: in STD_LOGIC;			--from system
	res				: in STD_LOGIC;			--from system
	start_init		: in STD_LOGIC;			--from fsm internal
	ovf_of_y		   : in STD_LOGIC;			--from system
	done_init		: out STD_LOGIC; 		   --to fsm internal
	flags_2_dp		: out ctrl_2_dp_flags;	--to datapath
	flags_2_mem		: out base_2_mem_flags	--to memory
	);
end component;

component fsm_guru is 
	port
	(
	clk				: in  STD_LOGIC;			--from system
	res				: in  STD_LOGIC;			--from system
	fsm_sg_start   : in  STD_LOGIC;			--from fsm internal
	end_of_guru		: in  STD_LOGIC;			--from datapath	
	cnt_guru_rdy	: in  STD_LOGIC;	
	duo_formed		: in  STD_LOGIC;			--from datapath
	go_guru        : in  STD_LOGIC;
	flags_2_dp		: out ctrl_2_dp_flags;	--to datapath
	flags_2_mem		: out base_2_mem_flags	--to memory
	
	);
end component;


--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************

   signal start_init_s,start_step_s, done_init_s, cnt_guru_rdy_s: STD_LOGIC;
	signal init_2_dp_s  	 		 : ctrl_2_dp_flags;
	signal guru_2_dp_s  			 : ctrl_2_dp_flags;
	signal flags_2_ctrl_s     	 : dp_2_ctrl_flags;
	signal init_2_mem_s         : base_2_mem_flags;
	signal guru_2_mem_s         : base_2_mem_flags;
	signal con_sel_s            : CONTROL_SELECT;
	signal disc_2_base_s   		 : disc_2_base_flags;
	signal base_2_disc_s   		 : base_2_disc_flags;
	signal go_guru_s            : STD_LOGIC;
	signal ref_2_base_s         : ref_2_base_flags;
	


begin

	--*******************************
	--*	COMPONENT INSTANTIATIONS	*
	--*******************************

	main: fsm_main 
						port map
						(
						clk				=> clk,		
						res				=> res,
						fsm_i_done		=> done_init_s,
						end_of_guru		=> flags_2_ctrl_s.end_of_guru,
						end_of_disc		=> disc_2_base_s.end_of_disc,
						duo_formed		=> ref_2_base_s.duo_formed,
						con_sel        => con_sel_s,
						fsm_i_start		=> start_init_s,
						fsm_s_start		=> start_step_s
						);

	
	init:	 fsm_init 
						port map
						(
						clk				=> clk,			
						res				=> res,
						start_init		=> start_init_s,
						ovf_of_y		   => flags_2_ctrl_s.ovf_of_y,
						done_init		=> done_init_s,
						flags_2_dp		=> init_2_dp_s,
						flags_2_mem		=> init_2_mem_s
						);
						
						
						
	 guru:  fsm_guru 
						port map
						(
						clk				=> clk,
						res				=> res,
						fsm_sg_start   => start_step_s,
						end_of_guru		=> flags_2_ctrl_s.end_of_guru,	
						cnt_guru_rdy	=> cnt_guru_rdy_s,
						duo_formed		=> ref_2_base_s.duo_formed,
						go_guru        => ref_2_base_s.go_guru,
						flags_2_dp		=> guru_2_dp_s,	
						flags_2_mem		=> guru_2_mem_s 				
						);
						
			
	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
	with con_sel_s select
		ctrl_2_dp   <=	init_2_dp_s		when INIT_CON,
						 guru_2_dp_s		when GURU_CON;
						
	with con_sel_s select					
		ctrl_2_mem	<=	init_2_mem_s 	when INIT_CON,
						 guru_2_mem_s 	when GURU_CON;			
						

	cnt_guru_rdy_s	<= cnt_guru_rdy;
	flags_2_ctrl_s <= dp_2_ctrl;
	base_2_disc    <= base_2_disc_s; 
	disc_2_base_s  <= disc_2_base;     
	ref_2_base_s   <= ref_2_base ;

						
	
end arch;
