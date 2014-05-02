--
-- VHDL Architecture ece411.MEMalignment.untitled
--
-- Created:
--          by - buris2.ews (siebl-0218-16.ews.illinois.edu)
--          at - 20:13:48 02/05/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MEMalign IS
   PORT( 
      ADDRESS : IN     LC3b_word;
      M_align : OUT    std_logic
   );

-- Declarations

END MEMalign ;

--gets whether or not the memory address computed by the ALU is byte-aligned
--
--IMPLEMENTATION BELOW NO LONGER USED
--m_align is pulled from MARMuxout because by the time MAR has been loaded
--(state transition when LoadMAR = '0' again), state has already transitioned
--m_align is not updated in time to branch the decision.
----> alternate implementation: add a new state before STB0a/STB1a branch
--    just to condition on m_align. This makes sure ADDRESS has been set
ARCHITECTURE untitled OF MEMalign IS
BEGIN
  M_align <= ADDRESS(0);
END ARCHITECTURE untitled;

