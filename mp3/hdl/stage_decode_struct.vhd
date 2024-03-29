-- VHDL Entity ece411.stage_decode.symbol
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

ENTITY stage_decode IS
   PORT( 
      EXEC_ALUout : IN     lc3b_word;
      IR1out      : IN     lc3b_word;
      MEM_ALUout  : IN     lc3b_word;
      MEM_dataout : IN     lc3b_word;
      PC1out      : IN     lc3b_word;
      RESET_L     : IN     std_logic;
      RegWrite5   : IN     std_logic;
      STALL_L     : IN     std_logic;
      Valid1out   : IN     std_logic;
      clearValid2 : IN     std_logic;
      clk         : IN     std_logic;
      destreg5    : IN     lc3b_reg;
      destsel5    : IN     std_logic;
      regdata5in  : IN     lc3b_word;
      srcAMUXsel  : IN     lc3b_4mux_sel;
      srcBMUXsel  : IN     lc3b_4mux_sel;
      CW1out      : OUT    LC3B_DWORD;
      CW2out      : OUT    lc3b_dword;
      IR2out      : OUT    lc3b_word;
      PC2out      : OUT    lc3b_word;
      Valid2out   : OUT    std_logic;
      regA2out    : OUT    lc3b_word;
      regB2out    : OUT    lc3b_word
   );

-- Declarations

END stage_decode ;

--
-- VHDL Architecture ece411.stage_decode.struct
--
-- Created:
--          by - buris2.ews (evrt-252-17.ews.illinois.edu)
--          at - 16:34:08 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF stage_decode IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL DEST       : LC3b_reg;
   SIGNAL IR11       : std_logic;
   SIGNAL IR11_9     : lc3b_reg;
   SIGNAL IR2_0      : lc3b_reg;
   SIGNAL IR5        : std_logic;
   SIGNAL IR5_4      : LC3B_SHFTOP;
   SIGNAL IR8_6      : lc3b_reg;
   SIGNAL OFFSET11   : lc3b_OFFSET11;
   SIGNAL OFFSET9    : LC3B_OFFSET9;
   SIGNAL OPCODE     : LC3B_OPCODE;
   SIGNAL SRCA       : LC3b_reg;
   SIGNAL SRCAout    : LC3B_WORD;
   SIGNAL SRCB       : LC3b_reg;
   SIGNAL SRCBout    : LC3B_WORD;
   SIGNAL branch     : std_logic;
   SIGNAL const111   : lc3b_reg;
   SIGNAL srcAMUXout : lc3b_word;
   SIGNAL srcAsel    : std_logic;
   SIGNAL srcBMUXout : lc3b_word;
   SIGNAL srcBsel    : std_logic;
   SIGNAL trap       : STD_LOGIC;
   SIGNAL uncondJMP  : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL CW1out_internal : LC3B_DWORD;


   -- Component Declarations
   COMPONENT CW1sig_ripper
   PORT (
      CW1out    : IN     LC3B_DWORD ;
      clk       : IN     std_logic ;
      srcAsel   : OUT    std_logic ;
      srcBsel   : OUT    std_logic ;
      uncondJMP : OUT    std_logic ;
      branch    : OUT    std_logic ;
      trap      : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT CW_ROM
   PORT (
      OPCODE : IN     LC3B_OPCODE ;
      IR5_4  : IN     LC3B_SHFTOP ;
      clk    : IN     std_logic ;
      CW1out : OUT    LC3B_DWORD ;
      IR11   : IN     std_logic ;
      IR5    : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT IRregsplitter
   PORT (
      IR1out   : IN     lc3b_word ;
      clk      : IN     std_logic ;
      IR11_9   : OUT    lc3b_reg ;
      IR8_6    : OUT    lc3b_reg ;
      IR2_0    : OUT    lc3b_reg ;
      IR5_4    : OUT    LC3B_SHFTOP ;
      IR11     : OUT    std_logic ;
      IR5      : OUT    std_logic ;
      OPCODE   : OUT    LC3B_OPCODE ;
      OFFSET9  : OUT    LC3B_OFFSET9 ;
      OFFSET11 : OUT    lc3b_OFFSET11 ;
      const111 : OUT    lc3b_reg 
   );
   END COMPONENT;
   COMPONENT RegMux2
   PORT (
      A   : IN     LC3b_reg ;
      B   : IN     LC3b_reg ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_reg 
   );
   END COMPONENT;
   COMPONENT WordMux4
   PORT (
      A   : IN     lc3b_word ;
      B   : IN     lc3b_word ;
      C   : IN     lc3b_word ;
      D   : IN     lc3b_word ;
      Sel : IN     lc3b_4mux_sel ;
      F   : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT stage_data
   PORT (
      ClearValid       : IN     std_logic ;
      Control_word     : IN     lc3b_dword ;
      IR               : IN     lc3b_word ;
      PC               : IN     lc3b_word ;
      RESET_L          : IN     std_logic ;
      STALL_L          : IN     std_logic ;
      Valid            : IN     std_logic ;
      clk              : IN     std_logic ;
      Control_word_out : OUT    lc3b_dword ;
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
   COMPONENT REGFILE
   PORT (
      CLK      : IN     STD_LOGIC ;
      DEST     : IN     LC3B_REG ;
      DIN      : IN     LC3B_WORD ;
      RESET_L  : IN     STD_LOGIC ;
      REGWRITE : IN     STD_LOGIC ;
      SRCA     : IN     LC3B_REG ;
      SRCB     : IN     LC3B_REG ;
      A        : OUT    LC3B_WORD ;
      B        : OUT    LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : CW1sig_ripper USE ENTITY ece411.CW1sig_ripper;
   FOR ALL : CW_ROM USE ENTITY ece411.CW_ROM;
   FOR ALL : IRregsplitter USE ENTITY ece411.IRregsplitter;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : REGFILE USE ENTITY mp3lib.REGFILE;
   FOR ALL : RegMux2 USE ENTITY ece411.RegMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   FOR ALL : stage_data USE ENTITY ece411.stage_data;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aCW1sig_ripper : CW1sig_ripper
      PORT MAP (
         CW1out    => CW1out_internal,
         clk       => clk,
         srcAsel   => srcAsel,
         srcBsel   => srcBsel,
         uncondJMP => uncondJMP,
         branch    => branch,
         trap      => trap
      );
   aCW_ROM : CW_ROM
      PORT MAP (
         OPCODE => OPCODE,
         IR5_4  => IR5_4,
         clk    => clk,
         CW1out => CW1out_internal,
         IR11   => IR11,
         IR5    => IR5
      );
   REGselector : IRregsplitter
      PORT MAP (
         IR1out   => IR1out,
         clk      => clk,
         IR11_9   => IR11_9,
         IR8_6    => IR8_6,
         IR2_0    => IR2_0,
         IR5_4    => IR5_4,
         IR11     => IR11,
         IR5      => IR5,
         OPCODE   => OPCODE,
         OFFSET9  => OFFSET9,
         OFFSET11 => OFFSET11,
         const111 => const111
      );
   DESTMUX : RegMux2
      PORT MAP (
         A   => destreg5,
         B   => const111,
         Sel => destsel5,
         F   => DEST
      );
   SRCAMUX : RegMux2
      PORT MAP (
         A   => IR11_9,
         B   => IR8_6,
         Sel => srcAsel,
         F   => SRCA
      );
   SRCBMUX : RegMux2
      PORT MAP (
         A   => IR2_0,
         B   => IR11_9,
         Sel => srcBsel,
         F   => SRCB
      );
   SRCAoutMUX : WordMux4
      PORT MAP (
         A   => SRCAout,
         B   => EXEC_ALUout,
         C   => MEM_ALUout,
         D   => MEM_dataout,
         Sel => srcAMUXsel,
         F   => srcAMUXout
      );
   SRCBoutMUX : WordMux4
      PORT MAP (
         A   => SRCBout,
         B   => EXEC_ALUout,
         C   => MEM_ALUout,
         D   => MEM_dataout,
         Sel => srcBMUXsel,
         F   => srcBMUXout
      );
   stage2data : stage_data
      PORT MAP (
         ClearValid       => clearValid2,
         Control_word     => CW1out_internal,
         IR               => IR1out,
         PC               => PC1out,
         RESET_L          => RESET_L,
         STALL_L          => STALL_L,
         Valid            => Valid1out,
         clk              => clk,
         Control_word_out => CW2out,
         IR_out           => IR2out,
         PC_out           => PC2out,
         Valid_out        => Valid2out
      );
   U_9 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => srcAMUXout,
         EN      => STALL_L,
         CLK     => clk,
         F       => regA2out
      );
   U_10 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => srcBMUXout,
         EN      => STALL_L,
         CLK     => clk,
         F       => regB2out
      );
   aREGFILE : REGFILE
      PORT MAP (
         CLK      => clk,
         DEST     => DEST,
         DIN      => regdata5in,
         RESET_L  => RESET_L,
         REGWRITE => RegWrite5,
         SRCA     => SRCA,
         SRCB     => SRCB,
         A        => SRCAout,
         B        => SRCBout
      );

   -- Implicit buffered output assignments
   CW1out <= CW1out_internal;

END struct;
