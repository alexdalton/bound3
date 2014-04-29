--
-- VHDL Architecture ece411.WayMux8.untitled
--
-- Created:
--          by - lis2.ews (gelib-057-16.ews.illinois.edu)
--          at - 22:02:50 04/17/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WayMux8 IS
   PORT( 
      DataOut0    : IN     LC3b_oword;
      DataOut1    : IN     LC3b_oword;
      DataOut2    : IN     LC3b_oword;
      DataOut3    : IN     LC3b_oword;
      DataOut4    : IN     LC3b_oword;
      DataOut5    : IN     LC3b_oword;
      DataOut6    : IN     LC3b_oword;
      DataOut7    : IN     LC3b_oword;
      TagOut0     : IN     LC3B_C_TAG;
      TagOut1     : IN     LC3B_C_TAG;
      TagOut2     : IN     LC3B_C_TAG;
      TagOut3     : IN     LC3B_C_TAG;
      TagOut4     : IN     LC3B_C_TAG;
      TagOut5     : IN     LC3B_C_TAG;
      TagOut6     : IN     LC3B_C_TAG;
      TagOut7     : IN     LC3B_C_TAG;
      ValidOut0   : IN     std_logic;
      ValidOut1   : IN     std_logic;
      ValidOut2   : IN     std_logic;
      ValidOut3   : IN     std_logic;
      ValidOut4   : IN     std_logic;
      ValidOut5   : IN     std_logic;
      ValidOut6   : IN     std_logic;
      ValidOut7   : IN     std_logic;
      WayMuxData  : OUT    LC3b_oword;
      WayMuxTag   : OUT    LC3B_C_TAG;
      WayMuxValid : OUT    std_logic;
      WayMuxSel   : IN     lc3b_8mux_sel
   );

-- Declarations

END WayMux8 ;

--
ARCHITECTURE untitled OF WayMux8 IS
BEGIN
  PROCESS (DataOut0, DataOut1, DataOut2, DataOut3, DataOut4, DataOut5, DataOut6, DataOut7, TagOut0, TagOut1, TagOut2, TagOut3, TagOut4, TagOut5, TagOut6, TagOut7, ValidOut0, ValidOut1, ValidOut2, ValidOut3, ValidOut4, ValidOut5, ValidOut6, ValidOut7, WayMuxSel)
    variable stateData : LC3b_oword;
    variable stateTag : LC3B_C_TAG;
    variable stateValid : std_logic;
  BEGIN
    case WayMuxSel is 
      when "000" =>
        stateData  := DataOut0;
	stateTag   := TagOut0;
	stateValid := ValidOut0;
      when "001" =>
        stateData  := DataOut1;
	stateTag   := TagOut1;
	stateValid := ValidOut1;
      when "010" =>
        stateData  := DataOut2;
	stateTag   := TagOut2;
	stateValid := ValidOut2;
      when "011" =>
        stateData  := DataOut3;
	stateTag   := TagOut3;
	stateValid := ValidOut3;
      when "100" =>
        stateData  := DataOut4;
	stateTag   := TagOut4;
	stateValid := ValidOut4;
      when "101" =>
        stateData  := DataOut5;
	stateTag   := TagOut5;
	stateValid := ValidOut5;
      when "110" =>
        stateData  := DataOut6;
	stateTag   := TagOut6;
	stateValid := ValidOut6;
      when "111" =>
        stateData  := DataOut7;
	stateTag   := TagOut7;
	stateValid := ValidOut7;
      when others =>
        stateData  := (OTHERS => 'X');
	stateTag   := (OTHERS => 'X');
	stateValid := 'X';
      end case;

      WayMuxData <= stateData after delay_MUX8;
      WayMuxTag <= stateTag after delay_MUX8;
      WayMuxValid <= stateValid after delay_MUX8;
  END PROCESS;
END ARCHITECTURE untitled;

