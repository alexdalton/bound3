-- VHDL Entity ece411.stage_fetch.symbol
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 17:06:38 03/19/14
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
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 17:06:38 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


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
   COMPONENT IR1
   PORT (
      DataIn1 : IN     lc3b_word;
      RESET_L : IN     std_logic;
      STALL_L : IN     std_logic;
      clk     : IN     std_logic;
      IR1out  : OUT    lc3b_word
   );
   END COMPONENT;
   COMPONENT PC1
   PORT (
      PCLoad  : IN     std_logic;
      RESET_L : IN     std_logic;
      clk     : IN     std_logic;
      nextPC  : IN     LC3b_word;
      PC1out  : OUT    lc3b_word
   );
   END COMPONENT;
   COMPONENT Plus2
   PORT (
      PCout      : IN     LC3b_word;
      clk        : IN     std_logic;
      PCPlus2out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT Valid1
   PORT (
      RESET_L    : IN     std_logic;
      STALL_L    : IN     std_logic;
      clearValid : IN     std_logic;
      clk        : IN     std_logic;
      Valid1out  : OUT    std_logic
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
   COMPONENT my_nor2
   PORT (
      A : IN     std_logic;
      B : IN     std_logic;
      F : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT my_or2
   PORT (
      A : IN     std_logic;
      B : IN     std_logic;
      F : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : CROM1 USE ENTITY ece411.CROM1;
   FOR ALL : ControlWord USE ENTITY ece411.ControlWord;
   FOR ALL : IR1 USE ENTITY ece411.IR1;
   FOR ALL : PC1 USE ENTITY ece411.PC1;
   FOR ALL : Plus2 USE ENTITY ece411.Plus2;
   FOR ALL : Valid1 USE ENTITY ece411.Valid1;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : my_nor2 USE ENTITY ece411.my_nor2;
   FOR ALL : my_or2 USE ENTITY ece411.my_or2;
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
   wordReg1 : IR1
      PORT MAP (
         DataIn1 => DataIn1,
         RESET_L => RESET_L,
         STALL_L => STALL_L,
         clk     => clk,
         IR1out  => IR1out
      );
   wordReg : PC1
      PORT MAP (
         PCLoad  => PCLoad,
         RESET_L => RESET_L,
         clk     => clk,
         nextPC  => nextPC,
         PC1out  => PC1out_internal
      );
   U_0 : Plus2
      PORT MAP (
         PCout      => PC1out_internal,
         clk        => clk,
         PCPlus2out => PCPlus2out
      );
   validReg3 : Valid1
      PORT MAP (
         RESET_L    => RESET_L,
         STALL_L    => STALL_L,
         clearValid => clearValid,
         clk        => clk,
         Valid1out  => Valid1out
      );
   U_1 : WordMux2
      PORT MAP (
         A   => PCPlus2out,
         B   => calcPC,
         Sel => PCMuxSel,
         F   => nextPC
      );
   U_2 : my_nor2
      PORT MAP (
         A => CondBR,
         B => STALL_L,
         F => PCLoad
      );
   U_3 : my_or2
      PORT MAP (
         A => BTB_Taken,
         B => UncondBranch,
         F => PCMuxSel
      );

   -- Implicit buffered output assignments
   PC1out <= PC1out_internal;

END struct;