--
-- VHDL Architecture ece411.aMP3ALU.untitled
--
-- Created:
--          by - lis2.ews (gelib-057-37.ews.illinois.edu)
--          at - 15:56:01 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY aMP3ALU IS
   PORT( 
      ALUop    : IN     lc3b_aluop;
      regA2out : IN     lc3b_word;
      sourceB  : IN     LC3b_word;
      ALUout   : OUT    lc3b_word
   );

-- Declarations

END aMP3ALU ;

--
ARCHITECTURE untitled OF aMP3ALU IS
BEGIN

    PROCESS(regA2out, sourceB, ALUop)
        variable temp : LC3b_word;
    BEGIN
        case ALUop is
            when alu_add =>
                temp := std_logic_vector(signed(regA2out) + signed(sourceB));
            when alu_and =>
                temp := (regA2out AND sourceB);
            when alu_not =>
                temp := NOT regA2out;
            when alu_pass =>
                temp := regA2out;
            when others =>
                temp := (OTHERS => 'X');
        end case;
        
        ALUout <= temp after delay_ALU;

    END PROCESS;


END ARCHITECTURE untitled;
