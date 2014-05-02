--
-- VHDL Architecture ece411.TagMux.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-09.ews.illinois.edu)
--          at - 01:42:27 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TagMux IS
   PORT( 
      LRUOut    : IN     std_logic;
      TagOut0   : IN     LC3B_C_TAG;
      TagOut1   : IN     LC3B_C_TAG;
      TagMuxOut : OUT    LC3B_C_TAG
   );

-- Declarations

END TagMux ;

--
ARCHITECTURE untitled OF TagMux IS
BEGIN
  PROCESS (LRUOut, TagOut0, TagOut1)
    variable state : LC3b_C_TAG;
  BEGIN
    case LRUOut is
      when '0' =>
        state := TagOut0;
      when '1' =>
        state := TagOut1;
      when others =>
        state := (OTHERS => 'X');
    end case;
    TagMuxOut <= state after delay_MUX2;
  END PROCESS;
END ARCHITECTURE untitled;
