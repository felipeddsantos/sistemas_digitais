--Sistemas Digitais - Demultiplexador I  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY DEMUX IS

PORT(E : IN BIT; 
     A : IN INTEGER RANGE 0 TO 3;
     S0, S1, S2, S3 : OUT BIT);
END DEMUX;

ARCHITECTURE MAIN OF DEMUX IS

BEGIN
    S0 <= E WHEN A = 0 ELSE '1';
    S1 <= E WHEN A = 1 ELSE '1';
    S2 <= E WHEN A = 2 ELSE '1';
    S3 <= E WHEN A = 3 ELSE '1';
END MAIN;
