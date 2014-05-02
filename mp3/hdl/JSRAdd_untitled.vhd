--
-- VHDL Architecture ece411.JSRAdd.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-40.ews.illinois.edu)
--          at - 18:28:23 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY JSRAdd IS
   PORT( 
      ADJ11out   : IN     LC3b_word;
      PC1out     : IN     lc3b_word;
      clk        : IN     std_logic;
      JSRAddout : OUT    lc3b_word
   );

-- Declarations

END JSRAdd ;

--
ARCHITECTURE untitled OF JSRAdd IS
BEGIN
  JSRAddout <= std_logic_vector(unsigned(ADJ11out) + unsigned(PC1out)) after DELAY_ADDER;
END ARCHITECTURE untitled;

