--Sistemas Digitais - Contador Síncrono de Década  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY CONT IS

PORT(CLOCK, CLEAR : IN BIT;
	 QOUT : BUFFER BIT_VECTOR(3 DOWNTO 0));
END CONT;

ARCHITECTURE MAIN OF CONT IS

COMPONENT FFJK
PORT(PRN, CLRN, CLKN, J, K : IN BIT;
     Q : BUFFER BIT);
END COMPONENT; 

BEGIN
    FF0 : FFJK PORT MAP(J => '1', K => '1', PRN => '1', CLRN => CLEAR, CLKN => CLOCK, Q => QOUT(0));
    FF1 : FFJK PORT MAP(J => QOUT(0) AND (NOT QOUT(3)), K => QOUT(0), PRN => '1', CLRN => CLEAR, CLKN => CLOCK, Q => QOUT(1));
    FF2 : FFJK PORT MAP(J => QOUT(1) AND QOUT(0), K => QOUT(1) AND QOUT(0), PRN => '1', CLRN => CLEAR, CLKN => CLOCK, Q => QOUT(2));
    FF3 : FFJK PORT MAP(J => QOUT(2) AND QOUT(1) AND QOUT(0), K => QOUT(0), PRN => '1', CLRN => CLEAR, CLKN => CLOCK, Q => QOUT(3));
END MAIN;

--Componente Flip Flop JK Mestre-Escravo com Preset e Clear
ENTITY FFJK IS

PORT(PRN, CLRN, CLKN, J, K : IN BIT;
     Q : BUFFER BIT);
END FFJK;

ARCHITECTURE MAIN_1 OF FFJK IS

BEGIN
    PROCESS(PRN, CLRN, CLKN )
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
END MAIN_C;
