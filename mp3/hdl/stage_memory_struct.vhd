-- VHDL Entity ece411.stage_memory.symbol
--
-- Created:
--          by - adalton2.ews (gelib-057-40.ews.illinois.edu)
--          at - 00:27:23 04/17/14
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
      ALU3out          : IN     lc3b_word;
      CW3out           : IN     lc3b_dword;
      D_DATAIN         : IN     lc3b_word;
      IR3out           : IN     lc3b_word;
      PC3out           : IN     lc3b_word;
      RESET_L          : IN     std_logic;
      STALL_L          : IN     std_logic;
      Valid3out        : IN     std_logic;
      clearValid4      : IN     std_logic;
      clk              : IN     std_logic;
      regA3out         : IN     lc3b_word;
      regB3out         : IN     lc3b_word;
      ADDRESS2         : OUT    lc3b_word;
      ALU4out          : OUT    lc3b_word;
      CW4out           : OUT    lc3b_dword;
      DATAOUT          : OUT    lc3b_word;
      IR4out           : OUT    lc3b_word;
      MEMdata4out      : OUT    lc3b_word;
      MREADD_L         : OUT    std_logic;
      MWRITEH_L        : OUT    std_logic;
      MWRITEL_L        : OUT    std_logic;
      PC4out           : OUT    lc3b_word;
      Valid4out        : OUT    std_logic;
      invalidate_fetch : OUT    STD_LOGIC;
      memAddress       : OUT    lc3b_word;
      memCWORD         : OUT    lc3b_dword;
      memIndirect      : OUT    std_logic;
      memoryOP         : OUT    std_logic;
      n                : OUT    std_logic;
      p                : OUT    std_logic;
      regA4out         : OUT    lc3b_word;
      regB4out         : OUT    lc3b_word;
      trap             : OUT    std_logic;
      trapPC           : OUT    lc3b_word;
      z                : OUT    std_logic
   );

-- Declarations

END stage_memory ;

--
-- VHDL Architecture ece411.stage_memory.struct
--
-- Created:
--          by - adalton2.ews (gelib-057-40.ews.illinois.edu)
--          at - 00:27:23 04/17/14
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
   SIGNAL ADDRESS2_SEL : lc3b_4mux_sel;
   SIGNAL CCdata       : LC3b_word;
   SIGNAL CCdatasel    : std_logic;
   SIGNAL F            : LC3b_word;
   SIGNAL LDB_word     : lc3b_word;
   SIGNAL LDIOP        : std_logic;
   SIGNAL LoadNZP      : std_logic;
   SIGNAL M_align      : std_logic;
   SIGNAL STB_data     : LC3b_word;
   SIGNAL STIOP        : std_logic;
   SIGNAL byteOP       : std_logic;
   SIGNAL byteOut      : lc3b_word;
   SIGNAL genCCout     : LC3b_CC;
   SIGNAL readOP       : std_logic;
   SIGNAL regB_shft    : lc3b_word;
   SIGNAL writeType    : std_logic_vector(1 DOWNTO 0);
   SIGNAL zext8out     : lc3b_word;

   -- Implicit buffer signal declarations
   SIGNAL ADDRESS2_internal    : lc3b_word;
   SIGNAL MEMdata4out_internal : lc3b_word;
   SIGNAL trap_internal        : std_logic;


   -- Component Declarations
   COMPONENT CW3sig_ripper
   PORT (
      CW3out       : IN     lc3b_dword ;
      ADDRESS2_SEL : OUT    lc3b_4mux_sel ;
      CCdatasel    : OUT    std_logic ;
      LoadNZP      : OUT    std_logic ;
      memoryOP     : OUT    std_logic ;
      readOP       : OUT    std_logic ;
      byteOP       : OUT    std_logic ;
      trap         : OUT    std_logic ;
      STIOP        : OUT    std_logic ;
      LDIOP        : OUT    std_logic ;
      writeType    : OUT    std_logic_vector (1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT LDB_align
   PORT (
      D_DATAIN : IN     lc3b_word ;
      M_align  : IN     std_logic ;
      byteOut  : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT LDISTIROM
   PORT (
      LDIOP    : IN     std_logic ;
      STIOP    : IN     std_logic ;
      memCWORD : OUT    lc3b_dword 
   );
   END COMPONENT;
   COMPONENT LSHFT_8
   PORT (
      regB3out  : IN     lc3b_word ;
      regB_shft : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT MEMalign
   PORT (
      ADDRESS : IN     LC3b_word;
      M_align : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT NAND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NZP
   PORT (
      LoadNZP  : IN     std_logic;
      RESET_L  : IN     STD_LOGIC;
      clk      : IN     std_logic;
      genCCout : IN     LC3b_CC;
      n        : OUT    std_logic;
      p        : OUT    std_logic;
      z        : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT WRbyte_sel
   PORT (
      M_align   : IN     std_logic ;
      Valid3out : IN     std_logic ;
      writeType : IN     std_logic_vector (1 DOWNTO 0);
      MWRITEH_L : OUT    std_logic ;
      MWRITEL_L : OUT    std_logic 
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
   COMPONENT ZEXT8
   PORT (
      zext8in  : IN     lc3b_word ;
      zext8out : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ZEXTtrap
   PORT (
      IR3out   : IN     lc3b_word ;
      zext8out : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT generateCC
   PORT (
      CCdata   : IN     LC3b_word;
      genCCout : OUT    LC3b_CC
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
   FOR ALL : CW3sig_ripper USE ENTITY ece411.CW3sig_ripper;
   FOR ALL : LDB_align USE ENTITY ece411.LDB_align;
   FOR ALL : LDISTIROM USE ENTITY ece411.LDISTIROM;
   FOR ALL : LSHFT_8 USE ENTITY ece411.LSHFT_8;
   FOR ALL : MEMalign USE ENTITY ece411.MEMalign;
   FOR ALL : NAND2 USE ENTITY ece411.NAND2;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : NZP USE ENTITY ece411.NZP;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : WRbyte_sel USE ENTITY ece411.WRbyte_sel;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   FOR ALL : ZEXT8 USE ENTITY ece411.ZEXT8;
   FOR ALL : ZEXTtrap USE ENTITY ece411.ZEXTtrap;
   FOR ALL : generateCC USE ENTITY ece411.generateCC;
   FOR ALL : stage_data USE ENTITY ece411.stage_data;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- eb1 1    
   trapPC <= D_DATAIN;
   memAddress <= D_DATAIN;


   -- Instance port mappings.
   aCW3sig_ripper : CW3sig_ripper
      PORT MAP (
         CW3out       => CW3out,
         ADDRESS2_SEL => ADDRESS2_SEL,
         CCdatasel    => CCdatasel,
         LoadNZP      => LoadNZP,
         memoryOP     => memoryOP,
         readOP       => readOP,
         byteOP       => byteOP,
         trap         => trap_internal,
         STIOP        => STIOP,
         LDIOP        => LDIOP,
         writeType    => writeType
      );
   aLDB_align : LDB_align
      PORT MAP (
         D_DATAIN => D_DATAIN,
         M_align  => M_align,
         byteOut  => byteOut
      );
   aLDISTIROM : LDISTIROM
      PORT MAP (
         LDIOP    => LDIOP,
         STIOP    => STIOP,
         memCWORD => memCWORD
      );
   aLSHFT_8 : LSHFT_8
      PORT MAP (
         regB3out  => regB3out,
         regB_shft => regB_shft
      );
   aMemalign : MEMalign
      PORT MAP (
         ADDRESS => ADDRESS2_internal,
         M_align => M_align
      );
   U_1 : NAND2
      PORT MAP (
         A => Valid3out,
         B => readOP,
         C => MREADD_L
      );
   aNZP : NZP
      PORT MAP (
         LoadNZP  => LoadNZP,
         clk      => clk,
         genCCout => genCCout,
         RESET_L  => RESET_L,
         n        => n,
         p        => p,
         z        => z
      );
   U_6 : OR2
      PORT MAP (
         A => STIOP,
         B => LDIOP,
         C => memIndirect
      );
   write_logic : WRbyte_sel
      PORT MAP (
         M_align   => M_align,
         Valid3out => Valid3out,
         writeType => writeType,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L
      );
   CCdataMux : WordMux2
      PORT MAP (
         A   => ALU3out,
         B   => MEMdata4out_internal,
         Sel => CCdatasel,
         F   => CCdata
      );
   U_2 : WordMux2
      PORT MAP (
         A   => D_DATAIN,
         B   => LDB_word,
         Sel => byteOP,
         F   => F
      );
   U_3 : WordMux2
      PORT MAP (
         A   => regB3out,
         B   => regB_shft,
         Sel => M_align,
         F   => STB_data
      );
   U_4 : WordMux2
      PORT MAP (
         A   => regB3out,
         B   => STB_data,
         Sel => byteOP,
         F   => DATAOUT
      );
   ADDRESS2MUX : WordMux4
      PORT MAP (
         A   => ALU3out,
         B   => MEMdata4out_internal,
         C   => zext8out,
         D   => zext8out,
         Sel => ADDRESS2_SEL,
         F   => ADDRESS2_internal
      );
   U_0 : ZEXT8
      PORT MAP (
         zext8in  => byteOut,
         zext8out => LDB_word
      );
   aZEXTtrap : ZEXTtrap
      PORT MAP (
         IR3out   => IR3out,
         zext8out => zext8out
      );
   agenerateCC : generateCC
      PORT MAP (
         CCdata   => CCdata,
         genCCout => genCCout
      );
   stage4data : stage_data
      PORT MAP (
         ClearValid       => clearValid4,
         Control_word     => CW3out,
         IR               => IR3out,
         PC               => PC3out,
         RESET_L          => RESET_L,
         STALL_L          => STALL_L,
         Valid            => Valid3out,
         clk              => clk,
         Control_word_out => CW4out,
         IR_out           => IR4out,
         PC_out           => PC4out,
         Valid_out        => Valid4out
      );
   U_5 : NOT1
      PORT MAP (
         A => trap_internal,
         F => invalidate_fetch
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
         A       => F,
         EN      => STALL_L,
         CLK     => clk,
         F       => MEMdata4out_internal
      );

   -- Implicit buffered output assignments
   ADDRESS2    <= ADDRESS2_internal;
   MEMdata4out <= MEMdata4out_internal;
   trap        <= trap_internal;

END struct;
