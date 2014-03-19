--
-- VHDL Architecture ece411.sll8_const.untitled
--
-- Created:
--          by - buris2.ews (siebl-0218-16.ews.illinois.edu)
--          at - 22:59:57 02/05/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY sll8_const IS
   PORT( 
      clk   : IN     std_logic;
      const : OUT    lc3b_word
   );

-- Declarations

END sll8_const ;

--sets a constant to left shift 8
ARCHITECTURE untitled OF sll8_const IS
BEGIN
  const <= "1101000000001000";
END ARCHITECTURE untitled;

