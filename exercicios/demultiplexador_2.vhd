--Sistemas Digitais - Demultiplexador II  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY DEMUX IS

PORT(E : IN BIT; 
     A : IN INTEGER RANGE 0 TO 3;
     S : OUT BIT_VECTOR( 3 DOWNTO 0));
END DEMUX;

ARCHITECTURE MAIN OF DEMUX IS

BEGIN
    S(0) <= E WHEN A = 0 ELSE '1';
    S(1) <= E WHEN A = 1 ELSE '1';
    S(2) <= E WHEN A = 2 ELSE '1';
    S(3) <= E WHEN A = 3 ELSE '1';     
END MAIN;
