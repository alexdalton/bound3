--
-- VHDL Architecture ece411.GenCC.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-11.ews.illinois.edu)
--          at - 16:24:09 01/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY GenCC IS
   PORT( 
      RFMuxout : IN     LC3b_word;
      clk      : IN     std_logic;
      genCCout : OUT    LC3b_CC
   );

-- Declarations

END GenCC ;

--
ARCHITECTURE untitled OF GenCC IS
BEGIN
	VHDL_GENCC : PROCESS (RFMUXOUT)
	BEGIN    
		IF (RFMUXOUT = "0000000000000000") THEN
			GENCCOUT <= "010" AFTER DELAY_GENCC;
		ELSIF (RFMUXOUT(15) = '1') THEN
			GENCCOUT <= "100" AFTER DELAY_GENCC;
		ELSE
			GENCCOUT <= "001" AFTER DELAY_GENCC;
		END IF;
	END PROCESS VHDL_GENCC;
END ARCHITECTURE untitled;

