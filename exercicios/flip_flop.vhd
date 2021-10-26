--Sistemas Digitais - Flip Flop JK 
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY FFJK IS

PORT(PRN, CLRN, CLKN, J, K : IN BIT;
     Q : BUFFER BIT);
END FFJK;

ARCHITECTURE MAIN OF FFJK IS

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
END MAIN;
