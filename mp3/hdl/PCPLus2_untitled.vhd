--
-- VHDL Architecture ece411.PCPLus2.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 15:05:11 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PCPLus2 IS
   PORT( 
      PCPlus2out : OUT    LC3b_word;
      PC1        : IN     lc3b_word
   );

-- Declarations

END PCPLus2 ;

--
ARCHITECTURE untitled OF PCPlus2 IS
BEGIN
	VHDL_ADD_2 : PROCESS (PC1)
	BEGIN  -- PROCESS
		PCPLUS2OUT <= STD_LOGIC_VECTOR(UNSIGNED(PC1) + 2 ) AFTER DELAY_ADDER;
	END PROCESS;
END ARCHITECTURE untitled;

