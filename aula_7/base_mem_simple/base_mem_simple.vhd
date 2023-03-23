library IEEE; 
use IEEE.STD_LOGIC_1164.all; 

package wisdom_package is 
	
	type SPEED is
	(
	ONE_X,
	TWO_X,
	FOUR_X,
	EIGHT_X
	);
	
	
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
					

	type ctrl_2_dp_flags  is --ctrl_base_datapath_flags
	record
		ng_cte_incr	   : STD_LOGIC;
		ng_rand_zero	: STD_LOGIC;
		alu_ctrl			: STD_LOGIC;
		rb_INIT_en		: STD_LOGIC;
		rb_GURU_en		: STD_LOGIC;
		rb_PRE_GURU_en : STD_LOGIC;
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
	   mem_a_addr			: STD_LOGIC_VECTOR(5 downto 0);
		mem_wr_en	   	: STD_LOGIC;
		data_a   			: STD_LOGIC_VECTOR(7 downto 0);
		cg_sel				: CODE;
	end record;
	  
		  
	type disc_2_mem_flags is
	record
	   mem_b_addr		   : STD_LOGIC_VECTOR(5 downto 0);
		mem_wr_en	      : STD_LOGIC;
		data_b   			: STD_LOGIC_VECTOR(7 downto 0);
		cg_sel			   : CODE;
	end record;  

	
end wisdom_package ; 


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.wisdom_package.all;


entity base_mem_simple is 

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
end  base_mem_simple;



architecture arch of  base_mem_simple is


	component mem_2port
	   PORT
	   (
		address_a		     : IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
		address_b			  : IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
		clock		      	  : IN  STD_LOGIC  := '1';
		data_a				  : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b				  : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a				  : IN  STD_LOGIC  := '0';
		wren_b				  : IN  STD_LOGIC  := '0';
		q_a		  			  : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b					  : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	   );
    END component;
	 
component reg_bank
	generic
	(
	WIDTH			    : NATURAL	:= 8
	);
	port
	(
	clk			    : in STD_LOGIC;
	res			    : in STD_LOGIC;
	ng_2_RB         : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	load_INIT	    : in STD_LOGIC;
	load_GURU	    : in STD_LOGIC;
	load_PRE_GURU   : in STD_LOGIC;
	out_sel		    : in RB_SEL;
	guru_addr       : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	guru_prev_addr  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	rb_out		    : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	);
end component;	


component code_gen is 
	port
	(
	ctrl_code_sel	: in CODE;
	mem_code_w		: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;



--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************

	signal clk_s, res_s           : STD_LOGIC;

	signal base_2_mem_s        	: base_2_mem_flags;
	signal disc_2_mem_s		   	: disc_2_mem_flags;

   	signal guru_addr_s       	: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	signal guru_prev_addr_s  	: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	signal rb_2_alu_s		    : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	signal mem_a_data_s  	   	: STD_LOGIC_VECTOR(WIDTH-1 downto 0);

	
	
begin

	
	  mem   : mem_2port 
									port map
									(
									base_2_mem_s.mem_a_addr,
									disc_2_mem_s.mem_b_addr,
									clk_s,
									base_2_mem_s.data_a,
									disc_2_mem_s.data_b,
									base_2_mem_s.mem_wr_en,
									disc_2_mem_s.mem_wr_en,
									base_data_out,
									disc_data_out
									);


	
		rb:		reg_bank			
									port map(
									clk_s,
									res_s,
									ng_2_RB,
									rb_INIT_en,
									rb_GURU_en,
									rb_PRE_GURU_en,
									out_sel,
									guru_addr_s,
									guru_prev_addr_s,
									rb_2_alu_s
									);
									
									
										
		c_g:	code_gen 			port map(
									cg_sel,
									mem_a_data_s
									);

									
									
	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************

	clk_s <= clk;
	res_s <= res;			
	
	base_2_mem_s.mem_wr_en  <=  base_mem_wren;
	
	base_2_mem_s.mem_a_addr (WIDTH-3 downto 0)      <=   rb_2_alu_s (WIDTH-3 downto 0);
	base_2_mem_s.data_a     <=   mem_a_data_s;
	
	disc_2_mem_s.mem_wr_en  <=  disc_mem_wren;
	
	disc_2_mem_s.mem_b_addr  <=  disc_mem_addr;
	disc_2_mem_s.data_b  <=  disc_mem_data;
	
	

end arch;
