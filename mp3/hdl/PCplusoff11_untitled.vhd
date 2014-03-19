--
-- VHDL Architecture ece411.PCplusoff11.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-21.ews.illinois.edu)
--          at - 23:21:44 02/06/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PCplusoff11 IS
   PORT( 
      ADJ11out       : IN     lc3b_word;
      PCOUT          : IN     lc3b_word;
      clk            : IN     std_logic;
      PCplusoffset11 : OUT    lc3b_word
   );

-- Declarations

END PCplusoff11 ;

--
ARCHITECTURE untitled OF PCplusoff11 IS
BEGIN
 	VHDL_ADD_2 : PROCESS (PCOUT, ADJ11out)
	BEGIN  -- PROCESS
		PCplusoffset11 <= STD_LOGIC_VECTOR(SIGNED(PCOUT) + SIGNED(ADJ11out)) AFTER DELAY_ADDER;
	END PROCESS;
END ARCHITECTURE untitled;

