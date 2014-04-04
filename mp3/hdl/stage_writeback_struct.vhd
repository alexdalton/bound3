-- VHDL Entity ece411.stage_writeback.symbol
--
-- Created:
--          by - lis2.ews (siebl-0218-20.ews.illinois.edu)
--          at - 22:08:30 04/03/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY stage_writeback IS
   PORT( 
      ALU4out     : IN     lc3b_word;
      CW4out      : IN     lc3b_dword;
      IR4out      : IN     lc3b_word;
      MEMdata4out : IN     lc3b_word;
      PC4out      : IN     lc3b_word;
      RESET_L     : IN     std_logic;
      STALL_L     : IN     std_logic;
      Valid4out   : IN     std_logic;
      clearValid5 : IN     std_logic;
      clk         : IN     std_logic;
      regA4out    : IN     lc3b_word;
      regB4out    : IN     lc3b_word;
      RegWrite5   : OUT    std_logic;
      destreg5    : OUT    lc3b_reg;
      destsel5    : OUT    std_logic;
      regdata5in  : OUT    lc3b_word
   );

-- Declarations

END stage_writeback ;

--
-- VHDL Architecture ece411.stage_writeback.struct
--
-- Created:
--          by - lis2.ews (siebl-0218-20.ews.illinois.edu)
--          at - 22:08:30 04/03/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF stage_writeback IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL RegDataInSel : std_logic;


   -- Component Declarations
   COMPONENT CW4sig_ripper
   PORT (
      CW4out       : IN     lc3b_dword ;
      clk          : IN     std_logic ;
      RegDataInSel : OUT    std_logic ;
      RegWrite5    : OUT    std_logic ;
      destsel5     : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT IRdest_ripper
   PORT (
      IR4out   : IN     lc3b_word ;
      clk      : IN     std_logic ;
      destreg5 : OUT    lc3b_reg 
   );
   END COMPONENT;
   COMPONENT WordMux2
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : CW4sig_ripper USE ENTITY ece411.CW4sig_ripper;
   FOR ALL : IRdest_ripper USE ENTITY ece411.IRdest_ripper;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aCW4sig_ripper : CW4sig_ripper
      PORT MAP (
         CW4out       => CW4out,
         clk          => clk,
         RegDataInSel => RegDataInSel,
         RegWrite5    => RegWrite5,
         destsel5     => destsel5
      );
   aIRdest_ripper : IRdest_ripper
      PORT MAP (
         IR4out   => IR4out,
         clk      => clk,
         destreg5 => destreg5
      );
   RegDataInMUX : WordMux2
      PORT MAP (
         A   => ALU4out,
         B   => MEMdata4out,
         Sel => RegDataInSel,
         F   => regdata5in
      );

END struct;
