--
-- VHDL Architecture ece411.BTB_TagArray.untitled
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 00:41:09 05/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTB_TagArray IS
  PORT(
    RESET_L : IN std_logic;
    DataWrite : IN std_logic;
    WriteIndex : IN std_logic;
    ReadIndex : IN std_logic;
    DataIn : IN LC3b_word;
    CLK    : IN std_logic;
    DataOut : OUT LC3b_word;
    WriteTag : OUT LC3b_word
  );
-- Declarations
END BTB_TagArray ;

--
ARCHITECTURE untitled OF BTB_TagArray IS
  TYPE DataArray IS array (1 downto 0) of LC3b_word;
  SIGNAL Data : DataArray;
BEGIN
  --------------------------------------------------------------
  ReadFromDataArray : PROCESS (Data, ReadIndex)
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
    WriteTag <= Data(WriteTagIndex) after DELAY_128B; -- used to check if there is a hit on write so we don't overwrite multiple ways with the same data
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
      Data(0) <= (OTHERS => 'X');
      Data(1) <= (OTHERS => 'X');
    END IF;
    IF (DataWrite = '1' and CLK = '1' AND CLK'EVENT) THEN
      Data(DataIndex) <= DataIn;
    END IF;
  END PROCESS WriteToDataArray;
END ARCHITECTURE untitled;
