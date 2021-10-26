--Sistemas Digitais - Circuito Combinacional I  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY COMB IS

PORT(A, B, C, D : IN BIT;
     S : OUT BIT);
END COMB;

ARCHITECTURE MAIN OF CIRC IS

BEGIN
    S <= (((B AND(NOT D)) NOR A) NAND(((NOT B) AND D) OR(C AND D))) AND((((NOT A) OR C) AND(B NAND D)) NOR C);
END MAIN;
