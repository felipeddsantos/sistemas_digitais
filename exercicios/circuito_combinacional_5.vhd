--Sistemas Digitais - Circuito Combinacional V  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Gradua��o em Engenharia de Computa��o - Faculdade de Engenharia El�trica - Universidade Federal de Uberl�ndia

ENTITY COMB IS

PORT(A : IN INTEGER RANGE 0 TO 7;
     S : OUT BIT);
END COMB;

ARCHITECTURE MAIN OF CIRC IS

BEGIN
    WITH A SELECT
    S <= '1' WHEN 0,
         '0' WHEN 1,
         '1' WHEN 2,
         '1' WHEN 3,
         '1' WHEN 4,
         '0' WHEN 5,
         '1' WHEN 6,
         '0' WHEN 7;
END MAIN;
