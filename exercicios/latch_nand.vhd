--Sistemas Digitais - Latch NAND  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY LATCH IS

PORT(SETA, RESETA : IN BIT;
     Q : BUFFER BIT);
END LATCH;

ARCHITECTURE MAIN OF LATCH IS

BEGIN
    PROCESS(SETA, RESETA)
	BEGIN
		IF SETA = '1' THEN Q <= '1';
		ELSIF RESETA = '1' THEN Q <= '0';
		ELSE Q <= Q;
		END IF;
	END PROCESS;
END MAIN;
