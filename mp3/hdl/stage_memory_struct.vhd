-- VHDL Entity ece411.stage_memory.symbol
--
-- Created:
--          by - adalton2.ews (gelib-057-27.ews.illinois.edu)
--          at - 21:33:00 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY stage_memory IS
   PORT( 
      ALU3out     : IN     lc3b_word;
      CW3out      : IN     lc3b_word;
      D_DATAIN    : IN     lc3b_word;
      IR3out      : IN     lc3b_word;
      PC3out      : IN     lc3b_word;
      RESET_L     : IN     std_logic;
      STALL_L     : IN     std_logic;
      Valid3out   : IN     std_logic;
      clearValid4 : IN     std_logic;
      clk         : IN     std_logic;
      regA3out    : IN     lc3b_word;
      regB3out    : IN     lc3b_word;
      ADDRESS2    : OUT    lc3b_word;
      ALU4out     : OUT    lc3b_word;
      CW4out      : OUT    lc3b_word;
      DATAOUT     : OUT    lc3b_word;
      IR4out      : OUT    lc3b_word;
      MEMdata4out : OUT    lc3b_word;
      MREADD_L    : OUT    std_logic;
      MWRITEH_L   : OUT    std_logic;
      MWRITEL_L   : OUT    std_logic;
      PC4out      : OUT    lc3b_word;
      Valid4out   : OUT    lc3b_word;
      regA4out    : OUT    lc3b_word;
      regB4out    : OUT    lc3b_word
   );

-- Declarations

END stage_memory ;

--
-- VHDL Architecture ece411.stage_memory.struct
--
-- Created:
--          by - adalton2.ews (gelib-057-27.ews.illinois.edu)
--          at - 21:33:00 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF stage_memory IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL BEN                  : std_logic;
   SIGNAL CCdata               : LC3b_word;
   SIGNAL CCdatasel            : std_logic;
   SIGNAL CheckN               : std_logic;
   SIGNAL CheckP               : std_logic;
   SIGNAL CheckZ               : std_logic;
   SIGNAL LoadNZP              : std_logic;
   SIGNAL NZPin                : LC3b_CC;
   SIGNAL Ncond                : std_logic;
   SIGNAL Pcond                : std_logic;
   SIGNAL SOME_SIGNAL_FROM_CW3 : lc3b_word;
   SIGNAL Zcond                : std_logic;
   SIGNAL genCCout             : LC3b_CC;
   SIGNAL n                    : std_logic;
   SIGNAL p                    : std_logic;
   SIGNAL z                    : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL ADDRESS2_internal    : lc3b_word;
   SIGNAL MEMdata4out_internal : lc3b_word;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT CW3sig_ripper
   PORT (
      CW3out    : IN     lc3b_word;
      clk       : IN     std_logic;
      CCdatasel : OUT    std_logic;
      LoadNZP   : OUT    std_logic;
      MREADD_L  : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT IRnzp_ripper
   PORT (
      IR3out : IN     lc3b_word ;
      clk    : IN     std_logic ;
      NZPin  : OUT    LC3b_CC 
   );
   END COMPONENT;
   COMPONENT NZP
   PORT (
      LoadNZP  : IN     std_logic;
      clk      : IN     std_logic;
      genCCout : IN     LC3b_CC;
      n        : OUT    std_logic;
      p        : OUT    std_logic;
      z        : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT NZPsplit
   PORT (
      dest   : IN     LC3b_reg;
      CheckN : OUT    std_logic;
      CheckP : OUT    std_logic;
      CheckZ : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT OR3
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : IN     std_logic ;
      D : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT WRbyte_sel
   PORT (
      ADDRESS2             : IN     lc3b_word;
      SOME_SIGNAL_FROM_CW3 : IN     lc3b_word;
      Valid3out            : IN     std_logic;
      clk                  : IN     std_logic;
      MWRITEH_L            : OUT    std_logic;
      MWRITEL_L            : OUT    std_logic
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
   COMPONENT generateCC
   PORT (
      CCdata   : IN     LC3b_word ;
      clk      : IN     std_logic ;
      genCCout : OUT    LC3b_CC 
   );
   END COMPONENT;
   COMPONENT stage_data
   PORT (
      Control_word     : IN     lc3b_word ;
      IR               : IN     lc3b_word ;
      PC               : IN     lc3b_word ;
      RESET_L          : IN     std_logic ;
      STALL_L          : IN     std_logic ;
      Valid            : IN     std_logic ;
      clearValid       : IN     std_logic ;
      clk              : IN     std_logic ;
      Control_word_out : OUT    std_logic ;
      IR_out           : OUT    lc3b_word ;
      PC_out           : OUT    lc3b_word ;
      Valid_out        : OUT    std_logic 
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
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : CW3sig_ripper USE ENTITY ece411.CW3sig_ripper;
   FOR ALL : IRnzp_ripper USE ENTITY ece411.IRnzp_ripper;
   FOR ALL : NZP USE ENTITY ece411.NZP;
   FOR ALL : NZPsplit USE ENTITY ece411.NZPsplit;
   FOR ALL : OR3 USE ENTITY ece411.OR3;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : WRbyte_sel USE ENTITY ece411.WRbyte_sel;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : generateCC USE ENTITY ece411.generateCC;
   FOR ALL : stage_data USE ENTITY ece411.stage_data;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_2 : AND2
      PORT MAP (
         A => CheckN,
         B => n,
         C => Ncond
      );
   U_3 : AND2
      PORT MAP (
         A => CheckP,
         B => p,
         C => Pcond
      );
   U_4 : AND2
      PORT MAP (
         A => CheckZ,
         B => z,
         C => Zcond
      );
   aCW3sig_ripper : CW3sig_ripper
      PORT MAP (
         CW3out    => CW3out,
         clk       => clk,
         CCdatasel => CCdatasel,
         LoadNZP   => LoadNZP,
         MREADD_L  => MREADD_L
      );
   aIRnzpripper : IRnzp_ripper
      PORT MAP (
         IR3out => IR3out,
         clk    => clk,
         NZPin  => NZPin
      );
   aNZP : NZP
      PORT MAP (
         LoadNZP  => LoadNZP,
         clk      => clk,
         genCCout => genCCout,
         n        => n,
         p        => p,
         z        => z
      );
   aNZPsplit : NZPsplit
      PORT MAP (
         dest   => NZPin,
         CheckN => CheckN,
         CheckP => CheckP,
         CheckZ => CheckZ
      );
   U_0 : OR3
      PORT MAP (
         A => Ncond,
         B => Pcond,
         C => Zcond,
         D => BEN
      );
   write_logic : WRbyte_sel
      PORT MAP (
         ADDRESS2             => ADDRESS2_internal,
         SOME_SIGNAL_FROM_CW3 => SOME_SIGNAL_FROM_CW3,
         Valid3out            => Valid3out,
         clk                  => clk,
         MWRITEH_L            => MWRITEH_L,
         MWRITEL_L            => MWRITEL_L
      );
   CCdataMux : WordMux2
      PORT MAP (
         A   => ALU3out,
         B   => MEMdata4out_internal,
         Sel => CCdatasel,
         F   => CCdata
      );
   agenerateCC : generateCC
      PORT MAP (
         CCdata   => CCdata,
         clk      => clk,
         genCCout => genCCout
      );
   stage2data : stage_data
      PORT MAP (
         Control_word     => CW3out,
         IR               => IR3out,
         PC               => PC3out,
         RESET_L          => RESET_L,
         STALL_L          => STALL_L,
         Valid            => Valid3out,
         clearValid       => clearValid4,
         clk              => clk,
         Control_word_out => CW4out,
         IR_out           => IR4out,
         PC_out           => PC4out,
         Valid_out        => Valid4out
      );
   U_9 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => regA3out,
         EN      => STALL_L,
         CLK     => clk,
         F       => regA4out
      );
   U_10 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => regB3out,
         EN      => STALL_L,
         CLK     => clk,
         F       => regB4out
      );
   U_11 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => ALU3out,
         EN      => STALL_L,
         CLK     => clk,
         F       => ALU4out
      );
   U_12 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => D_DATAIN,
         EN      => STALL_L,
         CLK     => clk,
         F       => MEMdata4out_internal
      );

   -- Implicit buffered output assignments
   ADDRESS2    <= ADDRESS2_internal;
   MEMdata4out <= MEMdata4out_internal;

END struct;