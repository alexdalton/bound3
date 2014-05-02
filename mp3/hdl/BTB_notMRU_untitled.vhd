--
-- VHDL Architecture ece411.BTB_notMRU.untitled
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 02:47:34 05/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTB_notMRU IS
  PORT(
    RESET_L : IN std_logic;
    DataWrite : IN std_logic;
    Index : IN std_logic;
    DataIn : IN LC3b_4mux_sel;
    CLK    : IN std_logic;
    DataOut : OUT LC3b_4mux_sel
  );
-- Declarations
END BTB_notMRU ;

--
ARCHITECTURE untitled OF BTB_notMRU IS
  TYPE DataArray IS array (1 downto 0) of LC3b_4mux_sel;
  SIGNAL Data : DataArray;
BEGIN
  --------------------------------------------------------------
  ReadFromDataArray : PROCESS (Data, Index)
  --------------------------------------------------------------
  VARIABLE DataIndex : integer;
  BEGIN
    if(Index = '1') then
	DataIndex := 1;
    else
	DataIndex := 0;
    end if;
    DataOut <= Data(DataIndex) after DELAY_128B;
  END PROCESS ReadFromDataArray;
  --------------------------------------------------------------
  WriteToDataArray : PROCESS (RESET_L, CLK, Index, DataWrite, DataIn)
  --------------------------------------------------------------
  VARIABLE DataIndex : integer;
  BEGIN
    if(Index = '1') then
	DataIndex := 1;
    else
	DataIndex := 0;
    end if;
    IF RESET_L = '0' THEN
      Data(0) <= "11"; -- make it start on 00 = way 0
      Data(1) <= "11";
    END IF;
    IF (DataWrite = '1' and CLK = '1' AND CLK'EVENT) THEN
      Data(DataIndex) <= DataIn;
    END IF;
  END PROCESS WriteToDataArray;
END ARCHITECTURE untitled;
