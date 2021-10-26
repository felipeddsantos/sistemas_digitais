--Sistemas Digitais - Multiplexador I  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY MUX IS

PORT(D0, D1, D2, D3 : IN BIT; 
     A : IN INTEGER RANGE 0 TO 3;
     S : OUT BIT);
END MUX;

ARCHITECTURE MAIN OF MUX IS

BEGIN 
    WITH A SELECT
    S <= D0 WHEN 0,
         D1 WHEN 1,
         D2 WHEN 2,
         D3 WHEN 3;    
END MAIN;
