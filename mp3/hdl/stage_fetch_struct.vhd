-- VHDL Entity ece411.stage_fetch.symbol
--
-- Created:
--          by - adalton2.ews (gelib-057-27.ews.illinois.edu)
--          at - 21:18:01 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY stage_fetch IS
   PORT( 
      BTB_Taken    : IN     std_logic;
      CondBR       : IN     std_logic;
      DataIn1      : IN     lc3b_word;
      RESET_L      : IN     std_logic;
      STALL_L      : IN     std_logic;
      UncondBranch : IN     std_logic;
      calcPC       : IN     LC3b_word;
      clearValid   : IN     std_logic;
      clk          : IN     std_logic;
      ADDRESS1     : OUT    lc3b_word;
      CW1out       : OUT    lc3b_oword;
      IR1out       : OUT    lc3b_word;
      MREADI_L     : OUT    std_logic;
      PC1out       : OUT    lc3b_word;
      Valid1out    : OUT    std_logic
   );

-- Declarations

END stage_fetch ;

--
-- VHDL Architecture ece411.stage_fetch.struct
--
-- Created:
--          by - adalton2.ews (gelib-057-27.ews.illinois.edu)
--          at - 21:18:01 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF stage_fetch IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ControlWord : lc3b_oword;
   SIGNAL PCLoad      : std_logic;
   SIGNAL PCMuxSel    : std_logic;
   SIGNAL PCPlus2out  : LC3b_word;
   SIGNAL nextPC      : LC3b_word;
   SIGNAL opcode      : lc3b_opcode;

   -- Implicit buffer signal declarations
   SIGNAL PC1out_internal : lc3b_word;


   -- Component Declarations
   COMPONENT CROM1
   PORT (
      STALL_L     : IN     std_logic;
      clk         : IN     std_logic;
      opcode      : IN     lc3b_opcode;
      ControlWord : OUT    lc3b_oword
   );
   END COMPONENT;
   COMPONENT ControlWord
   PORT (
      ControlWord : IN     lc3b_oword;
      RESET_L     : IN     std_logic;
      STALL_L     : IN     std_logic;
      clk         : IN     std_logic;
      CW1out      : OUT    lc3b_oword
   );
   END COMPONENT;
   COMPONENT NOR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Plus2
   PORT (
      PCout      : IN     LC3b_word;
      clk        : IN     std_logic;
      PCPlus2out : OUT    LC3b_word
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
   COMPONENT REG1
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC ;
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT REG16
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC_VECTOR (15 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : CROM1 USE ENTITY ece411.CROM1;
   FOR ALL : ControlWord USE ENTITY ece411.ControlWord;
   FOR ALL : NOR2 USE ENTITY ece411.NOR2;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : Plus2 USE ENTITY ece411.Plus2;
   FOR ALL : REG1 USE ENTITY mp3lib.REG1;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   ADDRESS <= PC1out_internal;
   MREADI_L <= STALL_L;

   -- HDL Embedded Text Block 2 eb2
   opcode <= DataIn1(15 DOWNTO 12);


   -- Instance port mappings.
   ControlROM : CROM1
      PORT MAP (
         STALL_L     => STALL_L,
         clk         => clk,
         opcode      => opcode,
         ControlWord => ControlWord
      );
   wordReg2 : ControlWord
      PORT MAP (
         ControlWord => ControlWord,
         RESET_L     => RESET_L,
         STALL_L     => STALL_L,
         clk         => clk,
         CW1out      => CW1out
      );
   U_2 : NOR2
      PORT MAP (
         A => CondBR,
         B => STALL_L,
         C => PCLoad
      );
   U_4 : OR2
      PORT MAP (
         A => BTB_Taken,
         B => UncondBranch,
         C => PCMuxSel
      );
   U_0 : Plus2
      PORT MAP (
         PCout      => PC1out_internal,
         clk        => clk,
         PCPlus2out => PCPlus2out
      );
   U_1 : WordMux2
      PORT MAP (
         A   => PCPlus2out,
         B   => calcPC,
         Sel => PCMuxSel,
         F   => nextPC
      );
   U_6 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => clearValid,
         EN      => STALL_L,
         CLK     => clk,
         F       => Valid1out
      );
   U_3 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => nextPC,
         EN      => PCLoad,
         CLK     => clk,
         F       => PC1out_internal
      );
   U_5 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => DataIn1,
         EN      => STALL_L,
         CLK     => clk,
         F       => IR1out
      );

   -- Implicit buffered output assignments
   PC1out <= PC1out_internal;

END struct;
