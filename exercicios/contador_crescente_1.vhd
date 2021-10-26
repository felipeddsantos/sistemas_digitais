--Sistemas Digitais - Contador Assíncrono Crescente I  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY CONT IS

PORT(CLOCK, INICIA : IN BIT;
	 QOUT : BUFFER BIT_VECTOR(2 DOWNTO 0));
END CONT;

ARCHITECTURE MAIN OF CONT IS

COMPONENT FFJK
    PORT(PRN, CLRN, CLKN, J, K : IN BIT;
         Q : BUFFER BIT);
END COMPONENT; 

BEGIN
    FF0 : FFJK PORT MAP(J => '1', K => '1', CLKN => CLOCK, CLRN => INICIA, PRN => '1', Q => QOUT(0));
    FF1 : FFJK PORT MAP(J => '1', K => '1', CLKN => QOUT(0), CLRN => INICIA, PRN => '1', Q => QOUT(1));
    FF2 : FFJK PORT MAP(J => '1', K => '1', CLKN => QOUT(1), CLRN => INICIA, PRN => '1', Q => QOUT(2));
END MAIN;

--Componente Flip Flop JK Mestre Escravo com Preset e Clear
ENTITY FFJK IS

PORT(PRN, CLRN, CLKN, J, K : IN BIT;
     Q : BUFFER BIT);
END FFJK;

ARCHITECTURE MAIN_1 OF FFJK IS

BEGIN
    PROCESS(PRN, CLRN, CLKN)
	BEGIN
		IF PRN = '0' THEN Q <= '1';
		ELSIF CLRN = '0' THEN Q <= '0';
		ELSIF CLKN = '0' AND CLKN 'EVENT THEN 
			IF J = '1' AND K = '1' THEN Q <= NOT Q;
		    ELSIF J = '1' AND K = '0' THEN Q <= '1';
		    ELSIF J = '0' AND K = '1' THEN Q <= '0';
			END IF;
		END IF;
	END PROCESS;
	Q <= Q;
END MAIN_1;
