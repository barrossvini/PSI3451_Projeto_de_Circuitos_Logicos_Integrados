library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.wisdom_package.all;

entity stimuli_wisdom is
	generic
	(
			WIDTH			: NATURAL := 8;
		CLK_PERIOD		: TIME	:=  10ns
	);

	port
		(
		clk				: out STD_LOGIC;			--system generatiom
		rst				: out STD_LOGIC;			--system generatiom
		end_of_disc : 	out STD_LOGIC;				--from disciple circuit
		go_guru 		: out STD_LOGIC;			--from referee
		duo_formed	: out STD_LOGIC;			--from referee
		tb_disc_addr	   : out STD_LOGIC_VECTOR(7 downto 0);     --for test
		tb_disc_prev_addr : out STD_LOGIC_VECTOR(7 downto 0);		--for test
	   	enable    	: out STD_LOGIC;							--from player
		sys_speed    	: out STD_LOGIC_VECTOR(3 downto 0)		--from player
		);

end stimuli_wisdom ;

architecture test of stimuli_wisdom is

	component clock_generator
		generic (
		CLK_PERIOD		: TIME	:= 10ns
		);

		port (	
		clk		: out STD_LOGIC
		);

    end component ;
	 
	
--***********************************
--*	INTERNAL SIGNAL DECLARATIONS	*
--***********************************	
	signal clk_s 	 		          : STD_LOGIC;
	signal rst_s 	 		          : STD_LOGIC;
--	signal enable_s,en_bypass_s    : STD_LOGIC;
	signal cnt_guru_rdy_s      	 : STD_LOGIC;
	signal cnt_disc_rdy_s      	 : STD_LOGIC;
--	signal cnt_value_s         	 : UNSIGNED(16-1 downto 0) ; 
--	signal speed_sync_s			    : SPEED;
	signal sys_speed_s    			 : STD_LOGIC_VECTOR(3 downto 0);
	
	
begin


	clk               <= clk_s;
	rst               <= rst_s;
--	cnt_guru_rdy      <= cnt_guru_rdy_s;
--	cnt_disc_rdy      <= cnt_disc_rdy_s;
--	sys_speed         <= sys_speed_s;

	clock: clock_generator
		port map
		(
		clk		=> clk_s
		);
   
	


	sim : process
	
			procedure reset_activate is    -- reset activation procedure
				begin
					wait until falling_edge(CLK_s);
					rst_s <= '1';
					wait for CLK_PERIOD;
					rst_s <= '0';
				end procedure reset_activate;
				
				
			
			procedure checkWC(tb_end_of_discI,tb_go_guruI,tb_duo_formedI,enableI  : in std_logic;
										        disc_addrI,disc_prev_addrI , sys_speedI  : in INTEGER   ) is
		
				begin
					end_of_disc <=   tb_end_of_discI;   
					go_guru     <=   tb_go_guruI;    
				    duo_formed  <=   tb_duo_formedI;  
					enable       <=   enableI;	
					tb_disc_addr      <=   std_logic_vector(to_unsigned(disc_addrI,WIDTH))      ;
					tb_disc_prev_addr <=   std_logic_vector(to_unsigned(disc_prev_addrI,WIDTH)) ;
					sys_speed    <=   std_logic_vector(to_unsigned(sys_speedI,4)) ;
					

					wait until rising_edge (clk_s);
					-- Events at the rising edge of next clock cycle
			end procedure checkWC;

		

		begin
		------------------------------------------------------------------------------------------------------------------	
		-- SIM 1 : Iniciação do sistema
			
			reset_activate;                       -- forca o sistema para fase inicial: FSM_MAIN->INIT_ACTIVATION	
			                                      -- FSM_INIT->IDLE , FSM_GURU->START_ITERATION
															 
			-- No tempo 20ns, a FSM_MAIN:INIT_ACTIVATION envia um sinal para a ativacao do ciclo da FSM_INIT
			-- Observa-se a insercao de BLANK nas 64 posicoes correspondentes ao tabuleiro de 20 a 680 ns 
			checkWC('0','0','0','0', 60, 60,1);   -- disc comeca na posicao 7 x 4   
			
			wait for 68*CLK_PERIOD;               -- tempo suficiente para o fim do ciclo INIT	
			
			wait for 20*CLK_PERIOD;               -- tempo maximo para a FSM_GURU atingir o estado CHECK_LAST
			
			reset_activate;                       -- observe o sistema ser reiniciado. 
		----------------------------------------------------------------------------------------------------------	
		
		-- SIM 2 : condicao de jogo sem conflito entre guru e discipulo - deve-se observar toda a movimentacao. FIM da RODADA.  
				-- Velocidades iguais para o guru e o discipulo
				-- GO_GURU ocorre imediatamente no estado CHECK_LAST
				
				checkWC('0','0','0','0', 60, 60,1); -- disc comeca na posicao 7 x 4     
			
			   wait for 68*CLK_PERIOD;             -- tempo suficiente para o fim do ciclo INIT	
			
				wait for 20*CLK_PERIOD;             -- tempo maximo para a FSM_GURU atingir o estado CHECK_LAST
				
				checkWC('0','1','0','1', 60, 60,1); -- GO_GURU acionado e DISC - ENABLED COM VEL igual ao do Guru
																
--				wait for 4*CLK_PERIOD;					-- tempo para escrita na memoria do GURU, FSM_GURU->WAIT_COUNT_GURU
				wait for 14*CLK_PERIOD;					-- tempo para escrita na memoria do GURU, FSM_GURU->WAIT_COUNT_GURU
				
				-- botao pressionado e velocidade x1 escolhida, incremento do DISCIPULO 						
				for j in 0 to 6 loop
					checkWC('0' ,'0','0', '1', 52-j*8 , 60-j*8 , 1);
--					wait for 17*CLK_PERIOD;             			   -- FSM_GURU->CHECK_LAST
					wait for 7*CLK_PERIOD;             			   -- FSM_GURU->CHECK_LAST
					checkWC('0' ,'1','0', '1', 52-j*8 , 60-j*8 , 1);
--					wait for 4*CLK_PERIOD;             			      -- FSM_GURU->WAIT_COUNT_GURU
					wait for 10*CLK_PERIOD;             			      -- FSM_GURU->WAIT_COUNT_GURU
				end loop;
				
				wait for CLK_PERIOD; 									-- FSM_DISC-> CHECK_LAST
				
--				checkWC('0' ,'0','0', '1', 252 , 4 , 1); 
--				wait for 17*CLK_PERIOD;                         -- FSM_DISC-> LAST 
	
				checkWC('1' ,'0','0', '1', 252 , 4 , 1);         -- FSM_DISC-> LAST
				
				wait for CLK_PERIOD; 									-- FSM_MAIN (GURU) -> STEP_ACTIVATION
				
				-- Fim da rodada---------------------------------
				
				
		---------------------------------------------------------------------------------------------------------------------	
		-- SIM 3 : condicao de jogo sem conflito entre guru e discipulo - deve-se observar toda a movimentacao. FIM da RODADA.  
				-- discipulo 2x mais rapido
				-- Nova rodada

				
				checkWC('1' ,'0','0', '0', 252 , 4 , 1);         -- GO_GURU acionado e DISC em espera 
																-- pelo acionamento do botao - ENABLE
				
				wait for CLK_PERIOD; 					-- FSM_MAIN (GURU) -> CHECK_END
				
				checkWC('0','0','0','0', 63, 63, 1); -- disc comeca na posicao 7 x 7     
			
				wait for 17*CLK_PERIOD;             -- tempo maximo para a FSM_GURU atingir o estado CHECK_LAST
				
				checkWC('0','1','0','0', 63, 63,1); -- GO_GURU acionado e DISC em espera
																	-- pelo acionamento do botao - ENABLE
															
				wait for 3*CLK_PERIOD;					-- tempo para escrita na memoria do GURU, FSM_GURU->WAIT_COUNT_GURU
				
				checkWC('0','0','0','0', 63, 63,1); -- GO_GURU retorna a zero 
																
				wait for 14*CLK_PERIOD;             -- tempo maximo para a FSM_GURU atingir o estado CHECK_LAST	
				
				checkWC('0','1','0','1', 63, 63,2); -- GO_GURU acionado e DISC acionado pelo botao - ENABLE 
																
																
--				wait for 1*CLK_PERIOD;					-- tempo para escrita na memoria do GURU, FSM_GURU->WAIT_COUNT_GURU
										
--				checkWC('0','1','0','1', 63, 63,2); -- GO_GURU acionado e DISC em espera 
																-- pelo acionamento do botao - ENABLE								
				wait for 3*CLK_PERIOD;					-- tempo para escrita na memoria do GURU, FSM_GURU->WAIT_COUNT_GURU		
								
				checkWC('0','0','0','1', 63, 63,2); -- GO_GURU retorna a zero 
				
				wait for 4*CLK_PERIOD;             -- tempo maximo para a FSM_GURU atingir o estado CHECK_LAST	

--				checkWC('0','0','0','1', 55, 63,2); -- GO_GURU retorna a zero 
				
--				wait for 10*CLK_PERIOD;             -- tempo maximo para a FSM_GURU atingir o estado CHECK_LAST	
				
--				checkWC('0','1','0','1', 55, 63,2); -- GO_GURU acionado e DISC acionado pelo botao - ENABLE 
						
--				wait for 3*CLK_PERIOD;					-- tempo de ajuste	
				
--				checkWC('0','0','0','1', 55, 63,2); -- GO_GURU acionado e DISC acionado pelo botao - ENABLE 		

--				wait for 11*(CLK_PERIOD/2);					-- tempo de ajuste					
				
				-- botao pressionado e velocidade x4 escolhida,  incremento do DISCIPULO 		
				for j in 0 to 6 loop

					if(j=0 or j=2 or j=4 or j=6) then
						
						checkWC('0' ,'0','0', '1', 55-j*8 , 63-j*8 , 2);
						wait for 17*(CLK_PERIOD/2);             			           -- FSM_DISC->CHECK_LAST
					end if;
					
					if(j=1 or j=3 or j=5) then
							
						checkWC('0' ,'0','0', '1', 55-j*8 , 63-j*8 , 2);  -- -- FSM_DISC->CHECK_LAST
																			-- GO_GURU a cada 2x deslocamentos do DISC
						wait for 1*CLK_PERIOD;             			           -- FSM_DISC->CHECK_LAST						
						
						checkWC('0' ,'1','0', '1', 55-j*8 , 63-j*8 , 2);  -- -- FSM_DISC->CHECK_LAST
																			-- GO_GURU a cada 2x deslocamentos do DISC
						wait for 13*(CLK_PERIOD/2);             			           -- FSM_DISC->CHECK_LAST	

--						wait for 4.5*CLK_PERIOD;                                 -- wait para go
																									
--					wait for 4.5*CLK_PERIOD;                               -- FSM_DISC->WAIT_COUNT

					end if;
					
				end loop;
				
				checkWC('1' ,'0','0', '1', 255 , 7 , 2);  -- -- FSM_DISC->CHECK_LAST
																			-- GO_GURU a cada 2x deslocamentos do DISC
				wait for 3*(CLK_PERIOD/2);             			           -- FSM_DISC->CHECK_LAST						
						
				checkWC('1' ,'1','0', '1', 255 , 7 , 2);  -- -- FSM_DISC->CHECK_LAST
																			-- GO_GURU a cada 2x deslocamentos do DISC
				wait for 3*(CLK_PERIOD);    
				
				checkWC('1' ,'0','0', '1', 255 , 7 , 2);  -- -- FSM_DISC->CHECK_LAST
																			-- GO_GURU a cada 2x deslocamentos do DISC
				wait for 14*CLK_PERIOD;             			           -- FSM_DISC->CHECK_LAST						
						
				checkWC('1' ,'1','0', '1', 255 , 7 , 2);  -- -- FSM_DISC->CHECK_LAST
																			-- GO_GURU a cada 2x deslocamentos do DISC
				wait for 3*(CLK_PERIOD);    
					
				checkWC('0' ,'0','0', '1', 255 , 7 , 2);  -- -- FSM_DISC->CHECK_LAST
         			           -- FSM_DISC->CHECK_LAST	
							   
				wait for 10*CLK_PERIOD;             			           -- FSM_DISC->CHECK_LAST												   
							   
				-- fim da rodada---------------------------------------------------------------------------		
	---------------------------------------------------------------------------------------------------------------	
				wait ;			

			end process sim;
end architecture test;