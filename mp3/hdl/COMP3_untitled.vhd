--
-- VHDL Architecture ece411.COMP3.untitled
--
-- Created:
--          by - lis2.ews (gelib-057-16.ews.illinois.edu)
--          at - 00:30:53 04/18/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY COMP3 IS
   PORT( 
      A     : IN     std_logic_vector (2 DOWNTO 0);
      B     : IN     std_logic_vector (2 DOWNTO 0);
      Equal : OUT    std_logic
   );

-- Declarations

END COMP3 ;

--
ARCHITECTURE untitled OF COMP3 IS
BEGIN
	COMP3: PROCESS (A, B)
	BEGIN 
		IF (A = B) THEN
			Equal <= '1' AFTER DELAY_COMPARE8;
		ELSE
			Equal <= '0' AFTER DELAY_COMPARE8;
		END IF;
	END PROCESS COMP3;
END ARCHITECTURE untitled;

