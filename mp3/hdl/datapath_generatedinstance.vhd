-- VHDL Entity ece411.Datapath.generatedInstance
--
-- Created:
--          by - buris2.ews (gelib-057-31.ews.illinois.edu)
--          at - 15:13:08 02/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Datapath IS
   PORT( 
      ADDRESS   : OUT    LC3b_word;
      ALUMuxSel : IN     std_logic;
      ALUop     : IN     LC3b_aluop;
      CheckN    : OUT    std_logic;
      CheckP    : OUT    std_logic;
      CheckZ    : OUT    std_logic;
      clk       : IN     std_logic;
      DATAIN    : IN     LC3b_word;
      DATAOUT   : OUT    LC3b_word;
      LoadIR    : IN     std_logic;
      LoadMAR   : IN     std_logic;
      LoadMDR   : IN     std_logic;
      LoadNZP   : IN     std_logic;
      LoadPC    : IN     std_logic;
      MARMuxSel : IN     std_logic;
      MDRMuxSel : IN     std_logic;
      n         : OUT    std_logic;
      Opcode    : OUT    LC3b_opcode;
      p         : OUT    std_logic;
      PCMuxSel  : IN     std_logic;
      RegWrite  : IN     std_logic;
      RESET_L   : IN     std_logic;
      RFMuxSel  : IN     std_logic;
      StoreSR   : IN     std_logic;
      z         : OUT    std_logic
   );

END Datapath ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF Datapath IS 
BEGIN


END generatedInstance;
