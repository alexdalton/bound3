--
-- VHDL Architecture ece411.NZP.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-11.ews.illinois.edu)
--          at - 16:26:55 01/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NZP IS
   PORT( 
      LoadNZP  : IN     std_logic;
      clk      : IN     std_logic;
      genCCout : IN     LC3b_CC;
      RESET_L  : IN     STD_LOGIC;
      n        : OUT    std_logic;
      p        : OUT    std_logic;
      z        : OUT    std_logic
   );

-- Declarations

END NZP ;

--
ARCHITECTURE untitled OF NZP IS
SIGNAL PRE_NZP : STD_LOGIC_VECTOR (2 DOWNTO 0);
BEGIN
	------------------------------
	VHDL_NZP : PROCESS (CLK, GENCCOUT, RESET_L)
	------------------------------
	BEGIN
	  IF (RESET_L = '0') THEN
	    PRE_NZP <= "111";
	  END IF;
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (LOADNZP = '1') THEN
				PRE_NZP <= GENCCOUT;
			END IF;
		END IF;
	END PROCESS VHDL_NZP;
	N <= PRE_NZP(2) AFTER DELAY_REG;
	Z <= PRE_NZP(1) AFTER DELAY_REG;
	P <= PRE_NZP(0) AFTER DELAY_REG;
END ARCHITECTURE untitled;

