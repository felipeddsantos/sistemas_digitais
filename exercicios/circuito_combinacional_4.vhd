--Sistemas Digitais - Circuito Combinacional IV  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY COMB IS

PORT(A : IN BIT_VECTOR(2 DOWNTO 0);
     S : OUT BIT);
END COMB;

ARCHITECTURE MAIN OF CIRC IS

BEGIN
    WITH A SELECT
    S <= '1' WHEN "000",
         '0' WHEN "001",
         '1' WHEN "010",
         '1' WHEN "011",
         '1' WHEN "100",
         '0' WHEN "101",
         '1' WHEN "110",
         '0' WHEN "111";
END MAIN;
