--Sistemas Digitais - Multiplexador II  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY MUX IS

PORT(D0, D1, D2, D3 : IN BIT; 
     A : IN BIT_VECTOR(1 DOWNTO 0);
     S : OUT BIT);
END MUX;

ARCHITECTURE MAIN OF MUX IS

BEGIN
    WITH A SELECT
    S <= D0 WHEN "00",
         D1 WHEN "01",
         D2 WHEN "10",
         D3 WHEN "11";
END MAIN;
