--
-- VHDL Architecture ece411.ALU.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-11.ews.illinois.edu)
--          at - 16:23:29 01/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ALU IS
   PORT( 
      ALUop      : IN     LC3b_aluop;
      RFAout     : IN     LC3b_word;
      ALUMuxout2 : IN     LC3b_word;
      clk        : IN     std_logic;
      ALUout     : OUT    LC3b_word
   );

-- Declarations

END ALU ;

--
ARCHITECTURE untitled OF ALU IS
BEGIN
	----------------------------------------
	VHDL_ALU : PROCESS (RFAOUT, ALUMUXOUT2, ALUOP)
	----------------------------------------
	VARIABLE TEMP_ALUOUT : LC3B_WORD;
	VARIABLE COUNT : INTEGER;
	BEGIN
		-- CHECK FOR ALU OPERATION TYPE, AND EXECUTE
		CASE ALUOP IS
			WHEN ALU_ADD =>
				TEMP_ALUOUT := STD_LOGIC_VECTOR(SIGNED(RFAOUT) + SIGNED(ALUMUXOUT2));
			WHEN ALU_AND =>
				TEMP_ALUOUT := (RFAOUT AND ALUMUXOUT2);
			WHEN ALU_NOT =>
				TEMP_ALUOUT := (RFAOUT XOR "1111111111111111");
			WHEN ALU_PASS =>
				TEMP_ALUOUT := (RFAOUT);
			WHEN ALU_SLL =>
			  TEMP_ALUOUT := std_logic_vector("sll"(unsigned(RFAOUT), to_integer(unsigned(ALUMUXOUT2(3 DOWNTO 0)))));
			WHEN ALU_SRL =>
			  TEMP_ALUOUT := std_logic_vector("srl"(unsigned(RFAOUT), to_integer(unsigned(ALUMUXOUT2(3 DOWNTO 0)))));
			WHEN ALU_SRA =>
			  COUNT := to_integer(unsigned(ALUMUXOUT2(3 DOWNTO 0)));
        if (ALUMUXOUT2(3 DOWNTO 0) = "0000") then
          TEMP_ALUOUT := RFAOUT; --Perform no shifting
        else
          TEMP_ALUOUT(15 - COUNT downto 0) := RFAOUT(15 downto COUNT);
          TEMP_ALUOUT(15 downto (15 - COUNT + 1)) := (others => RFAOUT(15));
        end if;
			WHEN OTHERS =>
		END CASE;
	--SET OUTPUT VALUE ALUOUT TO BE THE TEMPORARY VALUE CALCULATED WITHIN THE PROCESS AFTER A DELAY
	ALUOUT <= TEMP_ALUOUT AFTER DELAY_ALU;
	END PROCESS VHDL_ALU;
END ARCHITECTURE untitled;

