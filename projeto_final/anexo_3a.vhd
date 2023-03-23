-- SIM 2 :  -- Cenarios descritos em 7
		--a) guru sozinho (jogador não age)
		--b) guru e discípulo (velocidade 1 qualquer) sem interação entre si.
		--c) guru e discípulo (velocidade 2 ? 1) com encontro formando duo.
		--d) guru e discípulo (velocidade 3 ? 2 ? 1) com "guru right behid".
			-- Rodada com o botao DE-pressionado  e velocidade X1 (não importa - irrelevante) . Deve-se observar apenas a movimentacao do GURU 
			checkWC('0',1);  
			
			file_open (f_status, l_file, "wisdom_log.txt", write_mode);
			write(msg,LF & LF & "--------------------------" & LF & "*   Botão apertado com velocidade 1   *" & LF & "--------------------------",right, 0);
			writeline(l_file, msg);
			file_close (l_file);		

			wait for 9500*CLK_PERIOD; 	
 
 			-- -- Rodada com o botao pressionado  e velocidade X2 . Deve-se observar a movimentacao do GURU e  DISCIPULO formando duo
			checkWC('1',2);	
			
			wait for 7346*CLK_PERIOD; 

 			-- -- Rodada com o botao pressionado  e velocidade X4 . Deve-se observar a movimentacao do GURU e  DISCIPULO sem interação
			checkWC('1',4);	--na proxima rodada
			wait for 11521*CLK_PERIOD;
			
			checkWC('0',4);	--para o discipulo não sair quando guru começar
			wait for 4915*CLK_PERIOD; 
			
 			-- Rodada com o botao pressionado  e velocidade X8 . Deve-se observar a movimentacao do GURU e  DISCIPULO com guru_behind = 1
			checkWC('1',8);	-- para discipulo sair no momento esperado para guru_behind = 1
			
			wait for 20000*CLK_PERIOD;               -- tempo suficiente para várias rodadas do jogo 
		----------------------------------------------------------------------------------------------------------	