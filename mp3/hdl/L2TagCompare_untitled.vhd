--
-- VHDL Architecture ece411.TagCompare.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-31.ews.illinois.edu)
--          at - 21:58:28 02/13/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L2TagCompare IS
  PORT(
    TagA : IN LC3B_L2_TAG;
    TagB : IN LC3B_L2_TAG;
    isEqual : OUT std_logic := '0'
  );
END ENTITY L2TagCompare;

--
ARCHITECTURE untitled OF L2TagCompare IS
BEGIN
  isEqual <= '1' after DELAY_COMPARE16 when (to_integer(unsigned(TagA)) = to_integer(unsigned(TagB))) else
             '0' after DELAY_COMPARE16;
END ARCHITECTURE untitled;

