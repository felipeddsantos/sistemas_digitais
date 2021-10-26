--Sistemas Digitais - Circuito Combinacional VI  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY COMB IS

PORT(D : IN BIT_VECTOR(3 DOWNTO 0);
     A, B : IN BIT_VECTOR(1 DOWNTO 0);
     S : OUT BIT);
END COMB;

ARCHITECTURE MAIN OF CIRC IS
SIGNAL E, S0, S1, S2, S3, AUX1, AUX2, AUX3, AUX4 : BIT;

BEGIN

    --Componente Multiplexador 4x1
    WITH A SELECT
    E <= D(0) WHEN "00",
         D(1) WHEN "01",
         D(2) WHEN "10",
         D(3) WHEN "11";

    --Componente Demultiplexador 1x4
    S0 <= E WHEN B = "00" ELSE '1';
    S1 <= E WHEN B = "01" ELSE '1';
    S2 <= E WHEN B = "10" ELSE '1';
    S3 <= E WHEN B = "11" ELSE '1';

    AUX1 <= S0 XOR S1;
    AUX2 <= S2 XNOR S3;
    AUX3 <= A(1) XNOR B(0);
    AUX4 <= AUX1 AND AUX2;
    S <= AUX4 NOR AUX3;
END MAIN;
