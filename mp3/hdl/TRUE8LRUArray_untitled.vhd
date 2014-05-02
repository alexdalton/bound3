--
-- VHDL Architecture ece411.TRUE8LRUArray.untitled
--
-- Created:
--          by - lis2.ews (gelib-057-16.ews.illinois.edu)
--          at - 00:03:24 04/18/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TRUE8LRUArray IS
  PORT(
    RESET_L : IN std_logic;
    DataWrite : IN std_logic;
    Index : IN LC3b_L2_index;
    clk   : IN std_logic;
    DataIn : IN LC3b_LRULINE;
    DataOut : OUT LC3b_LRULINE
  );
-- Declarations
END TRUE8LRUArray ;

--
ARCHITECTURE untitled OF TRUE8LRUArray IS
  TYPE TRUELRUArray IS array (3 downto 0) of LC3b_LRULINE;
  SIGNAL Data : TRUELRUArray;
BEGIN
  --------------------------------------------------------------
  ReadFromDataArray : PROCESS (Data, Index)
  --------------------------------------------------------------
  VARIABLE DataIndex : integer;
  BEGIN
    DataIndex := to_integer(unsigned(Index));
    DataOut <= Data(DataIndex) after DELAY_512B;
  END PROCESS ReadFromDataArray;
  --------------------------------------------------------------
  WriteToDataArray : PROCESS (RESET_L, Index, DataWrite, DataIn, clk)
  --------------------------------------------------------------
  VARIABLE DataIndex : integer;
  BEGIN
    DataIndex := to_integer(unsigned(Index));
    IF RESET_L = '0' THEN
      Data(0) <= "000001010011100101110111"; -- the top is the rightmost, or lowest order bits. Start by replacing the 0th way
      Data(1) <= "000001010011100101110111";
      Data(2) <= "000001010011100101110111";
      Data(3) <= "000001010011100101110111";
    END IF;
    IF (DataWrite = '1' and rising_edge(clk)) THEN
      Data(DataIndex) <= DataIn;
    END IF;
  END PROCESS WriteToDataArray;
END ARCHITECTURE untitled;


