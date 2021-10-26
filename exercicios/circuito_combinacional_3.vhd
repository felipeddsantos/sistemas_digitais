--Sistemas Digitais - Circuito Combinacional III  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY COMB IS

PORT(A, B, C : IN  BIT;
     S : OUT BIT);
END COMB;

ARCHITECTURE MAIN OF CIRC IS
SIGNAL VAR01 : BIT_VECTOR(2 DOWNTO 0);

BEGIN
    VAR01 <= A & B & C;
    WITH VAR01 SELECT
    S <= '1' WHEN "000",
         '0' WHEN "001",
         '1' WHEN "010",
         '1' WHEN "011",
         '1' WHEN "100",
         '0' WHEN "101",
         '1' WHEN "110",
         '0' WHEN "111";
END MAIN;
