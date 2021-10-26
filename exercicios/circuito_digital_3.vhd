--Sistemas Digitais - Circuito Digital III  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY CIRCUITO IS

PORT(E, CLOCK, INICIA : IN BIT;
     S : OUT BIT);
END CIRCUITO;

ARCHITECTURE MAIN OF CIRCUITO IS
SIGNAL AUX : BIT;
SIGNAL QOUT, Y, VET : BIT_VECTOR(2 DOWNTO 0);
SIGNAL Z : BIT_VECTOR(7 DOWNTO 0);
SIGNAL D : BIT_VECTOR(3 DOWNTO 0);
SIGNAL VET1 : BIT_VECTOR(1 DOWNTO 0);

COMPONENT FFJK
PORT(PR, CLR, CLK, J, K : IN BIT;
     Q : BUFFER BIT);
END COMPONENT;

BEGIN
    AUX <= INICIA AND (NOT ((NOT QOUT(0)) AND QOUT(1) AND (NOT QOUT(2))));
    FF0 : FFJK PORT MAP(PR => AUX, CLR => '1', CLK => CLOCK, J => '1', K => '1', Q => QOUT(0));
    FF1 : FFJK PORT MAP(PR => AUX, CLR => '1', CLK => NOT QOUT(0), J => '1', K => '1', Q => QOUT(1));
    FF2 : FFJK PORT MAP(PR => AUX, CLR => '1', CLK => NOT QOUT(1), J => '1', K => '1', Q => QOUT(2));
    FF3 : FFJK PORT MAP(PR => '1', CLR => INICIA, CLK => QOUT(2), J => Y(1), K => Y(1), Q => Y(0));
    FF4 : FFJK PORT MAP(PR => '1', CLR => INICIA, CLK => QOUT(2), J => '1', K => NOT Y(0), Q => Y(1));
    FF5 : FFJK PORT MAP(PR => '1', CLR => INICIA, CLK => QOUT(2), J => Y(1) AND (NOT Y(0)), K => '1', Q => Y(2));

    VET <= QOUT(0) & QOUT(1) & QOUT(2);
    Z(0) <= E WHEN VET = "000" ELSE '1';
    Z(1) <= E WHEN VET = "001" ELSE '1';
    Z(2) <= E WHEN VET = "010" ELSE '1';
    Z(3) <= E WHEN VET = "011" ELSE '1';
    Z(4) <= E WHEN VET = "100" ELSE '1';
    Z(5) <= E WHEN VET = "101" ELSE '1';
    Z(6) <= E WHEN VET = "110" ELSE '1';
    Z(7) <= E WHEN VET = "111" ELSE '1';

    D(0) <= NOT (Z(0) AND Z(1) AND Z(2));
    D(1) <= Z(3) XNOR Z(4);
    D(2) <= Z(5) OR (NOT Z(6));
    D(3) <= NOT Z(7);

    VET1 <= Y(1) & Y(0);
    WITH VET1 SELECT
    S <= D(0) WHEN "00",
         D(1) WHEN "01",
         D(2) WHEN "10",
         D(3) WHEN "11";
END MAIN;

--Componente Flip Flop JK Mestre-Escravo com Preset e Clear
ENTITY FFJK IS

PORT(PR, CLR, CLK, J, K : IN BIT;
     Q : BUFFER BIT);
END FFJK;

ARCHITECTURE MAIN_1 OF FFJK IS

BEGIN
    PROCESS(PR, CLR, CLK)
    BEGIN
	    IF PR = '0' THEN Q <= '1';
	    ELSIF CLR = '0' THEN Q <= '0';
	    ELSIF CLK = '0' AND CLK' EVENT THEN
		    IF J = '1' AND K = '1' THEN Q <= NOT Q;
		    ELSIF J = '1' AND K = '0' THEN Q <= '1';
		    ELSIF J = '0' AND K = '1' THEN Q <= '0';
		    END IF;
	    END IF;
    END PROCESS;
    Q <= Q;
END MAIN_1;
