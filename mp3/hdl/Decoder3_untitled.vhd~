--
-- VHDL Architecture ece411.Decoder3.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-13.ews.illinois.edu)
--          at - 10:54:41 02/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Decoder3 IS
   PORT( 
      Dsel : IN     lc3b_8mux_sel;
      A    : OUT    std_logic;
      B    : OUT    std_logic;
      C    : OUT    std_logic;
      D    : OUT    std_logic;
      E    : OUT    std_logic;
      F    : OUT    std_logic;
      G    : OUT    std_logic;
      H    : OUT    std_logic
   );

-- Declarations

END Decoder3 ;

--
ARCHITECTURE untitled OF Decoder3 IS
BEGIN
  A <= '1' WHEN (Dsel = "000") ELSE
       '0' AFTER DELAY_DECODE3;
  B <= '1' WHEN (Dsel = "001") ELSE
       '0' AFTER DELAY_DECODE3;
  C <= '1' WHEN (Dsel = "010") ELSE
       '0' AFTER DELAY_DECODE3;
  D <= '1' WHEN (Dsel = "011") ELSE
       '0' AFTER DELAY_DECODE3;
  E <= '1' WHEN (Dsel = "100") ELSE
       '0' AFTER DELAY_DECODE3;
  F <= '1' WHEN (Dsel = "101") ELSE
       '0' AFTER DELAY_DECODE3;
  G <= '1' WHEN (Dsel = "110") ELSE
       '0' AFTER DELAY_DECODE3;
  H <= '1' WHEN (Dsel = "111") ELSE
       '0' AFTER DELAY_DECODE3;
END ARCHITECTURE untitled;

