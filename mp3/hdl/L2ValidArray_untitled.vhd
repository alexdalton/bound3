--
-- VHDL Architecture ece411.L2ValidArray.untitled
--
-- Created:
--          by - lis2.ews (siebl-0218-26.ews.illinois.edu)
--          at - 18:31:34 04/29/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L2ValidArray IS
  PORT(
    RESET_L : IN std_logic;
    ValidWrite : IN std_logic;
    Index : IN LC3b_L2_index;
    ValidOut : OUT std_logic := '0'
  );
-- Declarations
END L2ValidArray ;

--
ARCHITECTURE untitled OF L2ValidArray IS
  SIGNAL Valid : std_logic_vector(3 downto 0);
BEGIN
  --------------------------------------------------------------
  ReadFromValidArray : PROCESS (Valid, Index)
  --------------------------------------------------------------
  VARIABLE ValidIndex : integer;
  BEGIN
    ValidIndex := to_integer(unsigned(Index));
    ValidOut <= Valid(ValidIndex) after DELAY_512B;
  END PROCESS ReadFromValidArray;
  --------------------------------------------------------------
  WriteToValidArray : PROCESS (RESET_L, Index, ValidWrite)
  --------------------------------------------------------------
  VARIABLE ValidIndex : integer;
  BEGIN
    ValidIndex := to_integer(unsigned(Index));
    IF RESET_L = '0' THEN
      Valid(0) <= '0';
      Valid(1) <= '0';
      Valid(2) <= '0';
      Valid(3) <= '0';
    END IF;
    IF (ValidWrite = '1') THEN
      Valid(ValidIndex) <= '1';
    END IF;
  END PROCESS WriteToValidArray;
END ARCHITECTURE untitled;
