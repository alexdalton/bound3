--
-- VHDL Architecture ece411.BitArray.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-34.ews.illinois.edu)
--          at - 00:22:38 02/14/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BitArray IS
   PORT( 
      Reset_L   : IN     std_logic;
      DataWrite : IN     std_logic;
      Index     : IN     LC3B_C_INDEX;
      DataIn    : IN     std_logic;
      DataOut   : OUT    std_logic
   );
-- Declarations
END BitArray ;

--
ARCHITECTURE untitled OF BitArray IS
	TYPE BitArray IS array (7 downto 0) of std_logic;
	SIGNAL Data : BitArray;
	BEGIN
		--------------------------------------------------------------
		ReadFromDataArray : PROCESS (Data, Index)
		--------------------------------------------------------------
    
			VARIABLE DataIndex : integer;
			BEGIN
				DataIndex := to_integer(unsigned(Index));
				DataOut <= Data(DataIndex) after 20 ns;
		
		END PROCESS ReadFromDataArray;
	
		--------------------------------------------------------------
		WriteToDataArray : PROCESS (RESET_L, Index, DataWrite, DataIn)
		--WriteToDataArray : PROCESS (RESET_L, DataWrite, DataIn)
		-------------------------------------------------------	------	
			VARIABLE DataIndex : integer;
			BEGIN
				DataIndex := to_integer(unsigned(Index));
			IF RESET_L = '0' THEN
				Data(0) <= '0';
				Data(1) <= '0';
				Data(2) <= '0';
				Data(3) <= '0';
				Data(4) <= '0';
				Data(5) <= '0';
				Data(6) <= '0';
				Data(7) <= '0';
			END IF;

			IF (DataWrite = '1') THEN
				Data(DataIndex) <= DataIn;
			END IF;
		
		END PROCESS WriteToDataArray;
END ARCHITECTURE untitled;



