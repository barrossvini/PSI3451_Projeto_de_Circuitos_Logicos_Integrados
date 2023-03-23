library IEEE;
use IEEE.std_logic_1164.all;
use work.wisdom_package.all;

entity disc_datapath is 
	generic
	(
	WIDTH		: NATURAL	:= 8
	);

	port
	(
		clk			   	    : in STD_LOGIC;											--from system
		res				  	: in  STD_LOGIC;										   --from system
		cg_sel				: in CODE;
		ng_cte_incr			: in STD_LOGIC;
		alu_ctrl			: in STD_LOGIC;
		rb_disc_en			: in STD_LOGIC;
		rb_disc_prev_en		: in STD_LOGIC;
		reg_out_sel			: in RB_SEL;
		duo_formed			: in STD_LOGIC;
		disc_addres_2_mem	: out STD_LOGIC_VECTOR(5 downto 0);
		disc_data			: out STD_LOGIC_VECTOR(WIDTH-1 downto 0);-- Dado para o porto a de mem_2port, com dado (8 bits)correspondente a um dos 3 c�digos: DISCIPLE, BLANK ou DUO. 
		end_of_disc			: out STD_LOGIC;
		disc_addres_prev	: out STD_LOGIC_VECTOR(5 downto 0);
		disc_addres			: out STD_LOGIC_VECTOR(5 downto 0)
		);
		
end disc_datapath;


architecture arch of disc_datapath is

--***********************************
--*	COMPONENT DECLARATIONS			*
--***********************************

component  num_gen_disc	 is
	GENERIC(
			WIDTH	   	: NATURAL := 8
			
			);
	
	PORT(
			clk			: IN  STD_LOGIC;
			reset 		: IN  STD_LOGIC;
			alu_result	: IN  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
			ng_cte_incr	: in STD_LOGIC;
			ng_2_rb		: OUT STD_LOGIC_VECTOR (WIDTH-1 downto 0)
	);
end component;

component reg_bank_disc
	generic
	(
	WIDTH		: NATURAL	:= 8
	);

	port
	(
	clk			    : in STD_LOGIC;
	res			    : in STD_LOGIC;
	ng_2_rb         : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	load_DISC	    : in STD_LOGIC;
	load_PREV_DISC  : in STD_LOGIC;
	out_sel		    : in RB_SEL;
	disc_addr       : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	disc_prev_addr  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
	rb_out		    : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
	);
end component;	

component alu
	generic
	(
	WIDTH		: NATURAL	:= 8
	);

	port
	(
	one_op		     : in STD_LOGIC_VECTOR(WIDTH-1 downto 0); -- uma constante (00000001).
	rb_op			     : in STD_LOGIC_VECTOR(WIDTH-1 downto 0); -- operandos Rb_op s�o oriundos de Reg Bank (sa�das de REG_GURU ou REG_INIT).
	alu_ctrl         : in STD_LOGIC;                          -- controle a saida da ula: 
	alu_result		  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0) -- resultado_soma(proxima posicao do GURU) ou posicao atual do GURU
	);
end component;



component code_gen is 
	port
	(
	ctrl_code_sel	: in CODE;
	mem_code_w		: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component coll_ovf_disc is 
	port
	(
	clk			   : in  STD_LOGIC;											--from system
	res				: in  STD_LOGIC;										   --from system
    disc_addr     	: in  STD_LOGIC_VECTOR(7 downto 0);
	end_of_disc		: out STD_LOGIC							     	--to control unit
	);
end component;

--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************
signal ng_2_rb_s		  		: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
signal alu_result_s		  		: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
signal rb_out_s		  			: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
signal disc_addres_s,disc_addres_prev_s			: STD_LOGIC_VECTOR(WIDTH-1 downto 0);


begin

	--*******************************
	--*	COMPONENT INSTANTIATIONS	*
	--*******************************

	n_g:	 num_gen_disc			generic map(
														WIDTH	      => WIDTH
											)
									port map(
														clk			=> clk,
														reset 		=> res,
														alu_result	=> alu_result_s,
														ng_cte_incr	=> ng_cte_incr,
														ng_2_rb		=> ng_2_rb_s
											);


						
	rb:		reg_bank_disc			
									port map(
												clk			    => clk,
												res			    => res,
												ng_2_rb         => ng_2_rb_s,
												load_DISC	    => rb_disc_en,
												load_PREV_DISC  => rb_disc_prev_en,
												out_sel		    => reg_out_sel,
												disc_addr       => disc_addres_s,
												disc_prev_addr  => disc_addres_prev_s,
												rb_out		    => rb_out_s
									);
		
	
	alu_1:	alu 				generic map(
												WIDTH	=> WIDTH
									)
								port map(
												one_op		=> "11111000", -- somando complemento do numero 8 (8bits)
												rb_op			=> rb_out_s,
												alu_ctrl    => alu_ctrl,
												alu_result  => alu_result_s
									);

	
	c_g:	code_gen 			port map(
												ctrl_code_sel	=> cg_sel,
												mem_code_w		=> disc_data
									);

	
	dut :	 coll_ovf_disc		
									port map(
												clk			   => clk,
												res				=> res,
												disc_addr     	=> rb_out_s,
												end_of_disc		=> end_of_disc
									);
									
	--*******************************
	--*	SIGNAL ASSIGNMENTS			*
	--*******************************
--Endere�o para o porto a de mem_2port, com o endere�o (6 bits), ou do disc_address ou o disc_address_prev 
	disc_addres_2_mem(5) <= rb_out_s(5);
	disc_addres_2_mem(4) <= rb_out_s(4);
	disc_addres_2_mem(3) <= rb_out_s(3);
	disc_addres_2_mem(2) <= rb_out_s(2);
	disc_addres_2_mem(1) <= rb_out_s(1);
	disc_addres_2_mem(0) <= rb_out_s(0);
--disc_address: o Disciple Circuit deve disponibilizar para o referee o
--endere�o (6 bits) da nova posi��o da mem�ria para onde o disc�pulo est� indo. 
--disc_address_prev: o Disciple Circuit deve disponibilizar para o referee o 
--endere�o (6 bits) da posi��o atual (antiga) da mem�ria de onde o disc�pulo
--est� saindo, escrevendo o valor adequado.
	disc_addres(5) <= disc_addres_s(5);
	disc_addres(4) <= disc_addres_s(4);
	disc_addres(3) <= disc_addres_s(3);
	disc_addres(2) <= disc_addres_s(2);
	disc_addres(1) <= disc_addres_s(1);
	disc_addres(0) <= disc_addres_s(0);
	
	disc_addres_prev(5) <= disc_addres_prev_s(5);
	disc_addres_prev(4) <= disc_addres_prev_s(4);
	disc_addres_prev(3) <= disc_addres_prev_s(3);
	disc_addres_prev(2) <= disc_addres_prev_s(2);
	disc_addres_prev(1) <= disc_addres_prev_s(1);
	disc_addres_prev(0) <= disc_addres_prev_s(0);
	
	
	
	
end arch;

