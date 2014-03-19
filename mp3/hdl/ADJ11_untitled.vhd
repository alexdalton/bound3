--
-- VHDL Architecture ece411.ADJ11.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 17:14:28 02/03/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ11 IS
   PORT( 
      clk      : IN     std_logic;
      offset11 : IN     lc3b_offset11;
      ADJ11out : OUT    lc3b_word
   );

-- Declarations

END ADJ11 ;

--
ARCHITECTURE untitled OF ADJ11 IS
BEGIN
    ADJ11out <= offset11(10) & offset11(10) & offset11(10) & offset11(10) & offset11 & '0' after delay_mux2;
END ARCHITECTURE untitled;
