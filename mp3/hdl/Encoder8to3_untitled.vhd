--
-- VHDL Architecture ece411.Encoder8to3.untitled
--
-- Created:
--          by - lis2.ews (gelib-057-16.ews.illinois.edu)
--          at - 21:48:37 04/17/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Encoder8to3 IS
   PORT( 
      In0   : IN     std_logic;
      In1   : IN     std_logic;
      In2   : IN     std_logic;
      In3   : IN     std_logic;
      In4   : IN     std_logic;
      In5   : IN     std_logic;
      In6   : IN     std_logic;
      In7   : IN     std_logic;
      F : OUT    lc3b_8mux_sel
   );

-- Declarations

END Encoder8to3 ;

--
ARCHITECTURE untitled OF Encoder8to3 IS
SIGNAL TEMP : LC3B_8MUX_SEL;
BEGIN
	PROCESS(In0, In1, In2, In3, In4, In5, In6, In7)
	variable incombined: std_logic_vector(7 downto 0) := In7 & In6 & In5 & In4 & In3 & In2 & In1 & In0;
	BEGIN
		CASE incombined IS
		WHEN "00000001" =>
			TEMP <= "000";
		WHEN "00000010" =>
			TEMP <= "001";
		WHEN "00000100" =>
			TEMP <= "010";
		WHEN "00001000" =>
			TEMP <= "011";
		WHEN "00010000" =>
			TEMP <= "100";
		WHEN "00100000" =>
			TEMP <= "101";
		WHEN "01000000" =>
			TEMP <= "110";
		WHEN "10000000" =>
			TEMP <= "111";
		WHEN OTHERS =>
			TEMP <= (OTHERS => 'X');
		END CASE;
	END PROCESS;
	F <= TEMP AFTER DELAY_DECODE3;
END ARCHITECTURE untitled;

