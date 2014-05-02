--
-- VHDL Architecture ece411.L2DataArray.untitled
--
-- Created:
--          by - lis2.ews (siebl-0218-26.ews.illinois.edu)
--          at - 18:06:30 04/29/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L2DataArray IS
  PORT(
    RESET_L : IN std_logic;
    DataWrite : IN std_logic;
    Index : IN LC3b_L2_index;
    DataIn : IN LC3b_oword;
    DataOut : OUT LC3b_oword);
END L2DataArray;

--
ARCHITECTURE untitled OF L2DataArray IS
  TYPE DataArray IS array (3 downto 0) of LC3b_oword;
  SIGNAL Data : DataArray;
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
  WriteToDataArray : PROCESS (RESET_L, Index, DataWrite, DataIn)
  --------------------------------------------------------------
  VARIABLE DataIndex : integer;
  BEGIN
    DataIndex := to_integer(unsigned(Index));
    IF RESET_L = '0' THEN
      Data(0) <= (OTHERS => 'X');
      Data(1) <= (OTHERS => 'X');
      Data(2) <= (OTHERS => 'X');
      Data(3) <= (OTHERS => 'X');
    END IF;
    IF (DataWrite = '1') THEN
      Data(DataIndex) <= DataIn;
    END IF;
  END PROCESS WriteToDataArray;
END ARCHITECTURE untitled;

