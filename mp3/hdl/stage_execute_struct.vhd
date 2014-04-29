-- VHDL Entity ece411.stage_execute.symbol
--
-- Created:
--          by - lis2.ews (siebl-0218-26.ews.illinois.edu)
--          at - 17:02:14 04/29/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY stage_execute IS
   PORT( 
      CW2out           : IN     lc3b_dword;
      IR2out           : IN     lc3b_word;
      PC2out           : IN     lc3b_word;
      RESET_L          : IN     std_logic;
      STALL_L          : IN     std_logic;
      STALL_L_B        : IN     std_logic;
      Valid2out        : IN     std_logic;
      clearValid       : IN     std_logic;
      clk              : IN     std_logic;
      memAddress       : IN     lc3b_word;
      memCWORD         : IN     lc3b_dword;
      memIndirect      : IN     std_logic;
      regA2out         : IN     lc3b_word;
      regB2out         : IN     lc3b_word;
      ALU3out          : OUT    lc3b_word;
      CW3out           : OUT    lc3b_dword;
      IR3out           : OUT    lc3b_word;
      PC3out           : OUT    lc3b_word;
      Valid3out        : OUT    std_logic;
      invalidate_fetch : OUT    STD_LOGIC;
      regA3out         : OUT    lc3b_word;
      regB3out         : OUT    lc3b_word
   );

-- Declarations

END stage_execute ;

--
-- VHDL Architecture ece411.stage_execute.struct
--
-- Created:
--          by - lis2.ews (siebl-0218-26.ews.illinois.edu)
--          at - 17:02:14 04/29/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF stage_execute IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADJ6out      : LC3b_word;
   SIGNAL ADJ9out      : lc3b_word;
   SIGNAL ALUop        : lc3b_aluop;
   SIGNAL ALUout       : lc3b_word;
   SIGNAL IR2_5        : std_logic;
   SIGNAL LEA_INST     : std_logic;
   SIGNAL SEXT5out     : LC3b_word;
   SIGNAL SEXT6out     : lc3b_word;
   SIGNAL SRCB_MUX_SEL : lc3b_8mux_sel;
   SIGNAL ZEXT4out     : lc3b_word;
   SIGNAL control_word : lc3b_dword;
   SIGNAL imm4         : lc3b_nibble;
   SIGNAL imm5         : LC3b_imm5;
   SIGNAL index6       : LC3b_index6;
   SIGNAL nextALUout   : lc3b_word;
   SIGNAL offset9      : LC3B_OFFSET9;
   SIGNAL operand2     : LC3b_word;
   SIGNAL sourceA      : lc3b_word;
   SIGNAL sourceB      : LC3b_word;
   SIGNAL trap         : std_logic;


   -- Component Declarations
   COMPONENT ADJ6
   PORT (
      index6  : IN     LC3b_index6;
      ADJ6out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT ADJ9
   PORT (
      offset9 : IN     LC3b_offset9;
      ADJ9out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT CW2sig_ripper
   PORT (
      CW2out       : IN     lc3b_dword ;
      ALUop        : OUT    lc3b_aluop ;
      SRCB_MUX_SEL : OUT    lc3b_8mux_sel ;
      LEA_INST     : OUT    std_logic ;
      trap         : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT DWordMux2
   PORT (
      A   : IN     LC3b_dword ;
      B   : IN     LC3b_dword ;
      Sel : IN     std_logic ;
      C   : OUT    LC3b_dword 
   );
   END COMPONENT;
   COMPONENT IR2sig_ripper
   PORT (
      IR2out  : IN     lc3b_word ;
      IR2_5   : OUT    std_logic ;
      imm4    : OUT    lc3b_nibble ;
      imm5    : OUT    LC3b_imm5 ;
      offset9 : OUT    LC3B_OFFSET9 ;
      index6  : OUT    LC3b_index6 
   );
   END COMPONENT;
   COMPONENT REG32
   PORT (
      A       : IN     lc3b_dword;
      CLK     : IN     STD_LOGIC;
      EN      : IN     STD_LOGIC;
      RESET_L : IN     STD_LOGIC;
      F       : OUT    lc3b_dword
   );
   END COMPONENT;
   COMPONENT SEXT5
   PORT (
      imm5   : IN     LC3b_IMM5 ;
      sext16 : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT SEXT6
   PORT (
      index6   : IN     LC3b_index6;
      SEXT6out : OUT    LC3b_word
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
   COMPONENT WordMux8
   PORT (
      A     : IN     lc3b_word ;
      B     : IN     lc3b_word ;
      C     : IN     lc3b_word ;
      D     : IN     lc3b_word ;
      E     : IN     lc3b_word ;
      F     : IN     lc3b_word ;
      G     : IN     lc3b_word ;
      H     : IN     lc3b_word ;
      Sel   : IN     lc3b_8mux_sel ;
      F_out : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ZEXT4
   PORT (
      imm4     : IN     LC3b_nibble;
      ZEXT4Out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT aMP3ALU
   PORT (
      ALUop   : IN     lc3b_aluop ;
      sourceA : IN     lc3b_word ;
      sourceB : IN     LC3b_word ;
      ALUout  : OUT    lc3b_word 
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
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
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
   FOR ALL : ADJ6 USE ENTITY ece411.ADJ6;
   FOR ALL : ADJ9 USE ENTITY ece411.ADJ9;
   FOR ALL : CW2sig_ripper USE ENTITY ece411.CW2sig_ripper;
   FOR ALL : DWordMux2 USE ENTITY ece411.DWordMux2;
   FOR ALL : IR2sig_ripper USE ENTITY ece411.IR2sig_ripper;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : REG32 USE ENTITY ece411.REG32;
   FOR ALL : SEXT5 USE ENTITY ece411.SEXT5;
   FOR ALL : SEXT6 USE ENTITY ece411.SEXT6;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux8 USE ENTITY ece411.WordMux8;
   FOR ALL : ZEXT4 USE ENTITY ece411.ZEXT4;
   FOR ALL : aMP3ALU USE ENTITY ece411.aMP3ALU;
   FOR ALL : stage_data USE ENTITY ece411.stage_data;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   index6 <= IR2out(5 downto 0);
   imm4 <= IR2out(3 downto 0);
   imm5 <= IR2out(4 downto 0);


   -- Instance port mappings.
   aADJ6 : ADJ6
      PORT MAP (
         index6  => index6,
         ADJ6out => ADJ6out
      );
   U_0 : ADJ9
      PORT MAP (
         offset9 => offset9,
         ADJ9out => ADJ9out
      );
   aCW2sig_ripper : CW2sig_ripper
      PORT MAP (
         CW2out       => CW2out,
         ALUop        => ALUop,
         SRCB_MUX_SEL => SRCB_MUX_SEL,
         LEA_INST     => LEA_INST,
         trap         => trap
      );
   U_2 : DWordMux2
      PORT MAP (
         A   => CW2out,
         B   => memCWORD,
         Sel => memIndirect,
         C   => control_word
      );
   aIR2sig_ripper : IR2sig_ripper
      PORT MAP (
         IR2out  => IR2out,
         IR2_5   => IR2_5,
         imm4    => imm4,
         imm5    => imm5,
         offset9 => offset9,
         index6  => index6
      );
   CWORD : REG32
      PORT MAP (
         RESET_L => RESET_L,
         A       => control_word,
         EN      => STALL_L_B,
         CLK     => clk,
         F       => CW3out
      );
   aSEXT5 : SEXT5
      PORT MAP (
         imm5   => imm5,
         sext16 => SEXT5out
      );
   aSEXT6 : SEXT6
      PORT MAP (
         index6   => index6,
         SEXT6out => SEXT6out
      );
   LEAMUX : WordMux2
      PORT MAP (
         A   => regA2out,
         B   => PC2out,
         Sel => LEA_INST,
         F   => sourceA
      );
   U_3 : WordMux2
      PORT MAP (
         A   => ALUout,
         B   => memAddress,
         Sel => memIndirect,
         F   => nextALUout
      );
   op2MUX : WordMux2
      PORT MAP (
         A   => regB2out,
         B   => SEXT5out,
         Sel => IR2_5,
         F   => operand2
      );
   SRCB_MUX : WordMux8
      PORT MAP (
         A     => operand2,
         B     => ADJ6out,
         C     => ZEXT4out,
         D     => SEXT6out,
         E     => ADJ9out,
         F     => ADJ9out,
         G     => ADJ9out,
         H     => ADJ9out,
         Sel   => SRCB_MUX_SEL,
         F_out => sourceB
      );
   aZEXT4 : ZEXT4
      PORT MAP (
         imm4     => imm4,
         ZEXT4Out => ZEXT4out
      );
   MP3ALU : aMP3ALU
      PORT MAP (
         ALUop   => ALUop,
         sourceA => sourceA,
         sourceB => sourceB,
         ALUout  => ALUout
      );
   stage4data : stage_data
      PORT MAP (
         ClearValid       => clearValid,
         Control_word     => CW2out,
         IR               => IR2out,
         PC               => PC2out,
         RESET_L          => RESET_L,
         STALL_L          => STALL_L,
         Valid            => Valid2out,
         clk              => clk,
         Control_word_out => OPEN,
         IR_out           => IR3out,
         PC_out           => PC3out,
         Valid_out        => Valid3out
      );
   U_1 : NOT1
      PORT MAP (
         A => trap,
         F => invalidate_fetch
      );
   U_8 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => regB2out,
         EN      => STALL_L,
         CLK     => clk,
         F       => regB3out
      );
   U_9 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => regA2out,
         EN      => STALL_L,
         CLK     => clk,
         F       => regA3out
      );
   U_10 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => nextALUout,
         EN      => STALL_L_B,
         CLK     => clk,
         F       => ALU3out
      );

END struct;
