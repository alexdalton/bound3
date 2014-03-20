--
-- VHDL Architecture ece411.generateCC.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 19:36:08 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY generateCC IS
   PORT( 
      CCdata   : IN     LC3b_word;
      clk      : IN     std_logic;
      genCCout : OUT    LC3b_CC
   );

-- Declarations

END generateCC ;

--
ARCHITECTURE untitled OF generateCC IS
BEGIN
	VHDL_GENERATECC : PROCESS (CCdata)
	BEGIN    
		IF (CCdata = "0000000000000000") THEN
			genCCout <= "010" AFTER DELAY_GENCC;
		ELSIF (CCdata(15) = '1') THEN
			genCCout <= "100" AFTER DELAY_GENCC;
		ELSE
			genCCout <= "001" AFTER DELAY_GENCC;
		END IF;
	END PROCESS VHDL_GENERATECC;
END ARCHITECTURE untitled;
