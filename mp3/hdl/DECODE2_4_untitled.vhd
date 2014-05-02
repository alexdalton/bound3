--
-- VHDL Architecture ece411.DECODE2_4.untitled
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 02:34:48 05/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DECODE2_4 IS
PORT( 
	A : IN     lc3b_4mux_sel;
	F : OUT    lc3b_nibble
);
-- DECLARATIONS
END DECODE2_4 ;

-- HDS INTERFACE_END
ARCHITECTURE UNTITLED OF DECODE2_4 IS
BEGIN
	DECODE2_4: PROCESS(A)
	VARIABLE STATE : LC3B_NIBBLE;
	BEGIN
		CASE A IS
			WHEN "00" => STATE := "0001"; 
			WHEN "01" => STATE := "0010"; 
			WHEN "10" => STATE := "0100"; 
			WHEN "11" => STATE := "1000"; 
			WHEN OTHERS => STATE := (OTHERS => 'X');
		END CASE;
		F <= STATE AFTER DELAY_LOGIC2 + DELAY_LOGIC2; -- combination of NOTs and ANDS to give output = 2ns
	END PROCESS DECODE2_4;
END UNTITLED;
