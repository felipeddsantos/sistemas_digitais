--Sistemas Digitais - Circuito Digital II  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY CIRCUITO IS

PORT(D : IN BIT_VECTOR(7 DOWNTO 0);
     CLOCK, INICIA : IN BIT;
	 S0, S1 : OUT BIT);
END CIRCUITO ;

ARCHITECTURE MAIN OF CIRCUITO IS
SIGNAL VET1, KS, X, Y : BIT_VECTOR(2 DOWNTO 0);
SIGNAL E, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7, AUX1 : BIT;

COMPONENT FFJK
PORT(PRN, CLRN, CLKN, J, K : IN BIT;
     Q : BUFFER BIT);
END COMPONENT; 

BEGIN

    --Contador Síncrono I
    FF0 : FFJK PORT MAP(J => X(1) AND X(0), K => '1', CLKN => CLOCK, CLRN => INICIA, PRN => '1', Q => X(2));
    FF1 : FFJK PORT MAP(J => X(0), K => '1', CLKN => CLOCK, CLRN => INICIA, PRN => '1', Q => X(1));
    FF2 : FFJK PORT MAP(J => '1', K => X(2), CLKN => CLOCK, CLRN => INICIA, PRN => '1', Q => X(0));

    --Contador Assíncrono Decrescente
    AUX1 <= INICIA AND (NOT((NOT KS(0)) AND KS(1) AND (NOT KS(2))));
    FF3 : FFJK PORT MAP(J => '1', K => '1', CLKN => X(0), CLRN => '1', PRN => AUX1, Q => KS(0));
    FF4 : FFJK PORT MAP(J => '1', K => '1', CLKN => NOT KS(0), CLRN => '1', PRN => AUX1, Q => KS(1));
    FF5 : FFJK PORT MAP(J => '1', K => '1', CLKN => NOT KS(1), CLRN => '1', PRN => AUX1, Q => KS(2));

    --Contador Síncrono II
    FF6 : FFJK PORT MAP(J => Y(1) AND (NOT Y(0)), K => '1', CLKN => KS(0), CLRN => INICIA, PRN => '1', Q => Y(2));
    FF7 : FFJK PORT MAP(J => '1', K => NOT Y(0), CLKN => KS(0), CLRN => INICIA, PRN => '1', Q => Y(1));
    FF8 : FFJK PORT MAP(J => Y(1), K => Y(1), CLKN => KS(0), CLRN => INICIA, PRN => '1', Q => Y(0));

    --Multiplexado 8x1
    VET1 <= KS(0) & KS(1) & KS(2);
    WITH VET1 SELECT
    E <= D(0) WHEN "000",
         D(1) WHEN "001",
         D(2) WHEN "010",
         D(3) WHEN "011",
         D(4) WHEN "100",
         D(5) WHEN "101",
         D(6) WHEN "110",
         D(7) WHEN "111";

    --Demultiplexado 1x8
    Z0 <= E WHEN Y = "000" ELSE '1';
    Z1 <= E WHEN Y = "001" ELSE '1';
    Z2 <= E WHEN Y = "010" ELSE '1';
    Z3 <= E WHEN Y = "011" ELSE '1';
    Z4 <= E WHEN Y = "100" ELSE '1';
    Z5 <= E WHEN Y = "101" ELSE '1';
    Z6 <= E WHEN Y = "110" ELSE '1';
    Z7 <= E WHEN Y = "111" ELSE '1';

    --Circuito Combinacional
    S0 <= NOT(Z0 AND Z1 AND Z2 AND Z3);
    S1 <= (Z4 XNOR Z5) XNOR (Z6 XOR Z7);
END MAIN;

--Componente Flip Flop JK Mestre-Escravo com Preset e Clear
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
