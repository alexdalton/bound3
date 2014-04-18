--
-- VHDL Architecture ece411.DeMUX3_8.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-12.ews.illinois.edu)
--          at - 16:00:54 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY ECE411;
USE ECE411.LC3B_TYPES.ALL;

ENTITY DeMUX3_8 IS
   PORT( 
      A  : IN     lc3b_reg;
      EN : IN     std_logic;
      F  : OUT    LC3B_BYTE
   );

-- Declarations

END DeMUX3_8;

-- HDS INTERFACE_END
ARCHITECTURE UNTITLED OF DeMUX3_8 IS
BEGIN
	DeMUX3_8: PROCESS(A, EN)
	VARIABLE STATE : LC3B_BYTE;
	BEGIN
		IF (EN = '0') THEN
		  STATE := "00000000";
		ELSIF (EN = '1') THEN	  
    		CASE A IS
    			WHEN "000" => STATE := "00000001"; 
    			WHEN "001" => STATE := "00000010"; 
    			WHEN "010" => STATE := "00000100"; 
    			WHEN "011" => STATE := "00001000"; 
    			WHEN "100" => STATE := "00010000"; 
    			WHEN "101" => STATE := "00100000"; 
    			WHEN "110" => STATE := "01000000"; 
    			WHEN "111" => STATE := "10000000"; 
    			WHEN OTHERS => STATE := (OTHERS => 'X');
    		END CASE;
		ELSE
      STATE := (OTHERS => 'X');
		END IF;
		--A DeMUX is basically a decoder with a bunch of AND-gates
		F <= STATE AFTER 4ns;-- 4ns = delay_decode3 (3ns) + delay_logic2 (1ns)
	END PROCESS DeMUX3_8;
END UNTITLED;

