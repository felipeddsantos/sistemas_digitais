--Sistemas Digitais - Circuito Digital I  
--Felipe Daniel Dias dos Santos - 11711ECP004
--Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

ENTITY CIRCUITO IS

PORT(PWM, ENT1, ENT2: IN BIT;
     VET : IN BIT_VECTOR(1 DOWNTO 0);
     S : OUT BIT);
END CIRCUITO;

ARCHITECTURE MAIN OF CIRCUITO IS
SIGNAL VAR : BIT_VECTOR(1 DOWNTO 0);
SIGNAL E, D0, D1, D2, D3, D4, D5, D6, D7 : BIT;
SIGNAL VAR1 : BIT_VECTOR(2 DOWNTO 0);
 
BEGIN

    --Tabela Verdade
    VAR <= PWM & ENT1;
    WITH VAR SELECT
    E <= '0' WHEN "00",
         '1' WHEN "01",
         '0' WHEN "10",
         '0' WHEN "11";

    --Demultiplexador 1x4
    D0 <= E WHEN VET = "00" ELSE '0';
    D1 <= E WHEN VET = "01" ELSE '0';
    D2 <= E WHEN VET = "10" ELSE '0';
    D3 <= E WHEN VET = "11" ELSE '0';

    --Circuito Combinacional
    D4 <= PWM;
    D5 <= VET(1);
    D6 <= PWM AND VET(1);
    D7 <= D6 XNOR ENT2;

    --Multiplexador 8x1
    VAR1 <= VET(1) & ENT1 & ENT2;
    WITH VAR1 SELECT
    S <= D0 WHEN "000",
         D1 WHEN "001",
         D2 WHEN "010",
         D3 WHEN "011",
         D4 WHEN "100",
         D5 WHEN "101",
         D6 WHEN "110",
         D7 WHEN "111";
END MAIN;
