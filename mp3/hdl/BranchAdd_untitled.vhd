--
-- VHDL Architecture ece411.BranchAdd.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-16.ews.illinois.edu)
--          at - 21:14:12 03/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BranchAdd IS
   PORT( 
      ADJ9out      : IN     LC3b_word;
      clk          : IN     std_logic;
      BranchAddout : OUT    lc3b_word;
      PC4out       : IN     lc3b_word
   );

-- Declarations

END BranchAdd ;

--
ARCHITECTURE untitled OF BranchAdd IS
BEGIN
  BranchAddout <= std_logic_vector(unsigned(ADJ9out) + unsigned(PC4out) + "10") after DELAY_ADDER;
END ARCHITECTURE untitled;

