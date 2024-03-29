--
-- VHDL Architecture ece411.BTB_ValidArray.untitled
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 00:54:32 05/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTB_ValidArray IS
  PORT(
    RESET_L : IN std_logic;
    DataWrite : IN std_logic;
    WriteIndex : IN std_logic;
    ReadIndex : IN std_logic;
    DataIn : IN std_logic;
    CLK    : IN std_logic;
    DataOut : OUT std_logic;
    WriteValid : OUT std_logic
  );
-- Declarations
END BTB_ValidArray ;

--
ARCHITECTURE untitled OF BTB_ValidArray IS
  TYPE DataArray IS array (1 downto 0) of std_logic;
  SIGNAL Data : DataArray;
BEGIN
  --------------------------------------------------------------
  ReadFromDataArray : PROCESS (Data, ReadIndex, WriteIndex)
  --------------------------------------------------------------
  VARIABLE DataIndex : integer;
  VARIABLE WriteTagIndex : integer;
  BEGIN
    if(ReadIndex = '1') then
	DataIndex := 1;
    else
	DataIndex := 0;
    end if;
    if(WriteIndex = '1') then
	WriteTagIndex := 1;
    else
	WriteTagIndex := 0;
    end if;
    DataOut <= Data(DataIndex) after DELAY_128B;
    WriteValid <= Data(WriteTagIndex) after DELAY_128B; -- used to check if there is a hit on write so we don't overwrite multiple ways with the same data
  END PROCESS ReadFromDataArray;
  --------------------------------------------------------------
  WriteToDataArray : PROCESS (RESET_L, CLK, WriteIndex, DataWrite, DataIn)
  --------------------------------------------------------------
  VARIABLE DataIndex : integer;
  BEGIN
    if(WriteIndex = '1') then
	DataIndex := 1;
    else
	DataIndex := 0;
    end if;
    IF RESET_L = '0' THEN
      Data(0) <= '0';
      Data(1) <= '0';
    END IF;
    IF (DataWrite = '1' and CLK = '1' AND CLK'EVENT) THEN
      Data(DataIndex) <= DataIn;
    END IF;
  END PROCESS WriteToDataArray;
END ARCHITECTURE untitled;
