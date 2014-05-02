--
-- VHDL Architecture ece411.SEXT9.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-31.ews.illinois.edu)
--          at - 18:13:21 02/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SEXT9 IS
   PORT( 
      offset9 : IN     lc3b_offset9;
      sext16  : OUT    lc3b_word
   );

-- Declarations

END SEXT9 ;

--
ARCHITECTURE untitled OF SEXT9 IS
BEGIN
    sext16<= offset9(8) & offset9(8) & offset9(8) & offset9(8) & offset9(8) & offset9(8) & offset9(8) & offset after delay_mux2;
END ARCHITECTURE untitled;

