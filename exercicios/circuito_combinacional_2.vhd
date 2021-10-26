--Sistemas Digitais - Circuito Combinacional II  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY COMB IS

PORT(A, B, C, D : IN BIT;
     S : OUT BIT);
END COMB;

ARCHITECTURE MAIN OF CIRC IS
SIGNAL VAR01, VAR02, VAR03, VAR04, VAR05, VAR06, VAR07, VAR08, VAR09, VAR10, VAR11, VAR12 : BIT;

BEGIN
    VAR01 <= B AND (NOT D);
    VAR02 <= (NOT B) AND D;
    VAR03 <= C AND D;
    VAR04 <= (NOT A) OR C;
    VAR05 <= B NAND D;
    VAR06 <= VAR01 NOR A;
    VAR07 <= VAR02 OR VAR03;
    VAR08 <= VAR04 AND VAR05;
    VAR09 <= VAR06 NAND VAR07;
    VAR10 <= C NOR VAR08;
    S <= VAR09 AND VAR10;
END MAIN;
