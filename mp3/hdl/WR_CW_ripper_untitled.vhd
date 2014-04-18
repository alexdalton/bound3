--
-- VHDL Architecture ece411.WR_CW_ripper.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-12.ews.illinois.edu)
--          at - 16:34:21 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WR_CW_ripper IS
   PORT( 
      WR_CW     : IN     lc3b_dword;
      WR_R7     : OUT     std_logic;
      dest_used : OUT    std_logic
   );

-- Declarations

END WR_CW_ripper ;

--
ARCHITECTURE untitled OF WR_CW_ripper IS
BEGIN
  dest_used <= WR_CW(14); -- dest used if regwrite
  WR_R7 <= WR_CW(3);
END ARCHITECTURE untitled;

