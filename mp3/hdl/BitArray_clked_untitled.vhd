--
-- VHDL Architecture ece411.BitArray_clked.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-37.ews.illinois.edu)
--          at - 01:02:29 02/28/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BitArray_clked IS
   PORT( 
      clk       : IN     std_logic;
      Reset_L   : IN     std_logic;
      DataWrite : IN     std_logic;
      Index     : IN     LC3B_C_INDEX;
      DataIn    : IN     std_logic;
      DataOut   : OUT    std_logic
   );

-- Declarations

END BitArray_clked ;

--
ARCHITECTURE untitled OF BitArray_clked IS
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
		WriteToDataArray : PROCESS (RESET_L, Index, DataWrite, DataIn, clk)
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

      elsif (clk'event and clk = '1') then 
    			 IF (DataWrite = '1') THEN
    				  Data(DataIndex) <= DataIn;
    			 END IF;
			 end if;
		
		END PROCESS WriteToDataArray;
END ARCHITECTURE untitled;

