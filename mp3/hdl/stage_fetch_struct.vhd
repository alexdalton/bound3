-- VHDL Entity ece411.stage_fetch.symbol
--
-- Created:
--          by - buris2.ews (evrt-252-17.ews.illinois.edu)
--          at - 16:34:07 05/02/14
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
      BRprediction : IN     std_logic;
      DataIn1      : IN     lc3b_word;
      PC4out       : IN     lc3b_word;
      PCmismatch   : IN     std_logic;
      RESET_L      : IN     std_logic;
      STALL_L      : IN     std_logic;
      calcPC       : IN     LC3b_word;
      clearValid   : IN     std_logic;
      clk          : IN     std_logic;
      writeBTB     : IN     std_logic;
      ADDRESS1     : OUT    lc3b_word;
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
--          by - buris2.ews (evrt-252-17.ews.illinois.edu)
--          at - 16:34:07 05/02/14
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
   SIGNAL BTBtargetAddress : LC3b_word;
   SIGNAL F                : STD_LOGIC;
   SIGNAL PCPlus2out       : LC3b_word;
   SIGNAL RESET_L_HOLD     : std_logic;
   SIGNAL STALL_L_clked    : STD_LOGIC;
   SIGNAL const1           : STD_LOGIC;
   SIGNAL nextPC           : LC3b_word;
   SIGNAL predictedPC      : LC3b_word;
   SIGNAL takePrediction   : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL PC1out_internal : lc3b_word;


   -- Component Declarations
   COMPONENT BTB
   PORT (
      CLK             : IN     std_logic ;
      DataIn          : IN     LC3b_word ;
      DataWrite       : IN     std_logic ;
      PCRead          : IN     lc3b_word ;
      RESET_L         : IN     std_logic ;
      TagWrite        : IN     LC3b_word ;
      TakenIn         : IN     std_logic ;
      DataOut         : OUT    LC3B_WORD ;
      Predict_Taken_H : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Plus2
   PORT (
      PCout      : IN     LC3b_word;
      clk        : IN     std_logic;
      PCPlus2out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT RESET_HOLD
   PORT (
      RESET_L      : IN     std_logic ;
      RESET_L_HOLD : OUT    std_logic 
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
   COMPONENT NOR2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
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
   FOR ALL : BTB USE ENTITY ece411.BTB;
   FOR ALL : NOR2 USE ENTITY mp3lib.NOR2;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : Plus2 USE ENTITY ece411.Plus2;
   FOR ALL : REG1 USE ENTITY mp3lib.REG1;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : RESET_HOLD USE ENTITY ece411.RESET_HOLD;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   ADDRESS1 <= PC1out_internal;
   const1 <= '1';
   --takePrediction <= '0'; -- comment out later


   -- Instance port mappings.
   aBTB : BTB
      PORT MAP (
         CLK             => clk,
         DataIn          => calcPC,
         DataWrite       => writeBTB,
         PCRead          => PC1out_internal,
         RESET_L         => RESET_L,
         TagWrite        => PC4out,
         TakenIn         => BRprediction,
         DataOut         => BTBtargetAddress,
         Predict_Taken_H => takePrediction
      );
   aPlus2 : Plus2
      PORT MAP (
         PCout      => PC1out_internal,
         clk        => clk,
         PCPlus2out => PCPlus2out
      );
   ahold : RESET_HOLD
      PORT MAP (
         RESET_L      => RESET_L,
         RESET_L_HOLD => RESET_L_HOLD
      );
   PCMUX : WordMux2
      PORT MAP (
         A   => predictedPC,
         B   => calcPC,
         Sel => PCmismatch,
         F   => nextPC
      );
   PCMUX1 : WordMux2
      PORT MAP (
         A   => PCPlus2out,
         B   => BTBtargetAddress,
         Sel => takePrediction,
         F   => predictedPC
      );
   U_1 : NOR2
      PORT MAP (
         A => F,
         B => STALL_L_clked,
         F => MREADI_L
      );
   U_0 : NOT1
      PORT MAP (
         A => RESET_L_HOLD,
         F => F
      );
   U_6 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => clearValid,
         EN      => STALL_L,
         CLK     => clk,
         F       => Valid1out
      );
   U_7 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => STALL_L,
         EN      => const1,
         CLK     => clk,
         F       => STALL_L_clked
      );
   U_3 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => nextPC,
         EN      => STALL_L,
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
