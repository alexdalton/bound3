--
-- VHDL Architecture ece411.mem_op_ripper.untitled
--
-- Created:
--          by - buris2.ews (siebl-0222-02.ews.illinois.edu)
--          at - 00:12:33 04/30/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mem_op_ripper IS
   PORT( 
      WR_CW1     : IN     lc3b_dword;
      EXEC_memOP : OUT    std_logic
   );

-- Declarations

END mem_op_ripper ;

--
ARCHITECTURE untitled OF mem_op_ripper IS
BEGIN
  EXEC_memOP <= WR_CW1(20);
END ARCHITECTURE untitled;

