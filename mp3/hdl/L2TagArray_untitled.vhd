--
-- VHDL Architecture ece411.L2TagArray.untitled
--
-- Created:
--          by - lis2.ews (siebl-0218-26.ews.illinois.edu)
--          at - 18:27:25 04/29/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L2TagArray IS
  PORT(
    RESET_L : IN std_logic;
    TagWrite : IN std_logic;
    Index : IN LC3b_L2_index;
    TagIn : IN LC3B_L2_TAG;
    TagOut : OUT LC3B_L2_TAG
  );
-- Declarations
END L2TagArray ;

--
ARCHITECTURE untitled OF L2TagArray IS
  TYPE TagArray IS array (3 downto 0) of LC3B_L2_TAG;
  SIGNAL Tag : TagArray;
BEGIN
  --------------------------------------------------------------
  ReadFromTagArray : PROCESS (Tag, Index)
  --------------------------------------------------------------
  VARIABLE TagIndex : integer;
  BEGIN
    TagIndex := to_integer(unsigned(Index));
    TagOut <= Tag(TagIndex) after DELAY_512B;
  END PROCESS ReadFromTagArray;
  --------------------------------------------------------------
  WriteToTagArray : PROCESS (RESET_L, Index, TagWrite, TagIn)
  --------------------------------------------------------------
  VARIABLE TagIndex : integer;
  BEGIN
    TagIndex := to_integer(unsigned(Index));
    IF RESET_L = '0' THEN
      Tag(0) <= (OTHERS => 'X');
      Tag(1) <= (OTHERS => 'X');
      Tag(2) <= (OTHERS => 'X');
      Tag(3) <= (OTHERS => 'X');
    END IF;
    IF (TagWrite = '1') THEN
      Tag(TagIndex) <= TagIn;
    END IF;
  END PROCESS WriteToTagArray;
END ARCHITECTURE untitled;
