--
-- VHDL Architecture ece411.CW2sig_ripper.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-31.ews.illinois.edu)
--          at - 01:09:50 03/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CW2sig_ripper IS
   PORT( 
      CW2out       : IN     lc3b_dword;
      ALUop        : OUT    lc3b_aluop;
      SRCB_MUX_SEL : OUT    lc3b_8mux_sel;
      LEA_INST     : OUT    std_logic
   );

-- Declarations

END CW2sig_ripper ;

--
ARCHITECTURE untitled OF CW2sig_ripper IS
BEGIN
  ALUop <= CW2out(29 downto 27);
  SRCB_MUX_SEL <= CW2out(26 downto 24);
  LEA_INST <= CW2out(8);
END ARCHITECTURE untitled;

