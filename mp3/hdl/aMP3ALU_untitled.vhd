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
      ALUop   : IN     lc3b_aluop;
      sourceA : IN     lc3b_word;
      sourceB : IN     LC3b_word;
      ALUout  : OUT    lc3b_word
   );

-- Declarations

END aMP3ALU ;

--
ARCHITECTURE untitled OF aMP3ALU IS
BEGIN

    PROCESS(sourceA, sourceB, ALUop)
        variable temp : LC3b_word;
        VARIABLE count : INTEGER;
    BEGIN
        case ALUop is
            when alu_add =>
                temp := std_logic_vector(signed(sourceA) + signed(sourceB));
            when alu_and =>
                temp := (sourceA AND sourceB);
            when alu_not =>
                temp := NOT sourceA;
            when alu_pass =>
                temp := sourceA;
			      when alu_sll =>
			          temp := LC3B_WORD("sll"(unsigned(sourceA), to_integer(unsigned(sourceB))));
			      when alu_srl =>
			          temp := LC3B_WORD("srl"(unsigned(sourceA), to_integer(unsigned(sourceB))));
			      when alu_sra =>
			          count := to_integer(unsigned(sourceB(3 downto 0)));
			          if (sourceB(3 downto 0) = "0000") then
			               temp := sourceA;
			          else
			               temp(15 - count downto 0) := sourceA(15 downto count);
			               temp(15 downto (15 - count + 1)) := (others => sourceA(15));
			          end if;                
            when others =>
                temp := (OTHERS => 'X');
        end case;
        
        ALUout <= temp after delay_ALU;

    END PROCESS;


END ARCHITECTURE untitled;
