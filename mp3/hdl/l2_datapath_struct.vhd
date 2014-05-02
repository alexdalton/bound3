-- VHDL Entity ece411.L2_datapath.interface
--
-- Created:
--          by - buris2.ews (evrt-252-17.ews.illinois.edu)
--          at - 16:34:05 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L2_datapath IS
   PORT( 
      ADDRESS        : IN     LC3b_word;
      AddrSel        : IN     std_logic;
      CLK            : IN     STD_LOGIC;
      CacheDataInSel : IN     std_logic;
      DATAOUT        : IN     LC3b_oword;
      DirtyWrite     : IN     std_logic;
      Dirtysel       : IN     std_logic;
      LD_Cache       : IN     std_logic;
      MREAD_L        : IN     std_logic;
      MRESPSel       : IN     std_logic;
      MWRITE_L       : IN     std_logic;
      PMDATAIN       : IN     LC3B_OWORD;
      RESET_L        : IN     STD_LOGIC;
      cont_RESP_H    : IN     std_logic;
      ignoreLRU      : IN     std_logic;
      setHit         : IN     std_logic;
      DATAIN         : OUT    LC3b_oword;
      MRESP_H        : OUT    std_logic;
      PMADDRESS      : OUT    LC3B_WORD;
      PMDATAOUT      : OUT    LC3B_OWORD;
      WayMuxDirty    : OUT    std_logic;
      hit            : OUT    std_logic;
      read           : OUT    std_logic;
      write          : OUT    std_logic
   );

-- Declarations

END L2_datapath ;

--
-- VHDL Architecture ece411.L2_datapath.struct
--
-- Created:
--          by - buris2.ews (evrt-252-17.ews.illinois.edu)
--          at - 16:34:05 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF L2_datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL A            : std_logic;
   SIGNAL B2           : std_logic;
   SIGNAL CacheDataIn  : LC3b_oword;
   SIGNAL DataOut0     : LC3b_oword;
   SIGNAL DataOut1     : LC3b_oword;
   SIGNAL DataOut2     : LC3b_oword;
   SIGNAL DataOut3     : LC3b_oword;
   SIGNAL DataOut4     : LC3b_oword;
   SIGNAL DataOut5     : LC3b_oword;
   SIGNAL DataOut6     : LC3b_oword;
   SIGNAL DataOut7     : LC3b_oword;
   SIGNAL DirtyOut0    : std_logic;
   SIGNAL DirtyOut1    : std_logic;
   SIGNAL DirtyOut2    : std_logic;
   SIGNAL DirtyOut3    : std_logic;
   SIGNAL DirtyOut4    : std_logic;
   SIGNAL DirtyOut5    : std_logic;
   SIGNAL DirtyOut6    : std_logic;
   SIGNAL DirtyOut7    : std_logic;
   SIGNAL DirtyWrite0  : std_logic;
   SIGNAL DirtyWrite00 : std_logic;
   SIGNAL DirtyWrite01 : std_logic;
   SIGNAL DirtyWrite1  : std_logic;
   SIGNAL DirtyWrite10 : std_logic;
   SIGNAL DirtyWrite11 : std_logic;
   SIGNAL DirtyWrite2  : std_logic;
   SIGNAL DirtyWrite20 : std_logic;
   SIGNAL DirtyWrite21 : std_logic;
   SIGNAL DirtyWrite3  : std_logic;
   SIGNAL DirtyWrite30 : std_logic;
   SIGNAL DirtyWrite31 : std_logic;
   SIGNAL DirtyWrite4  : std_logic;
   SIGNAL DirtyWrite40 : std_logic;
   SIGNAL DirtyWrite41 : std_logic;
   SIGNAL DirtyWrite5  : std_logic;
   SIGNAL DirtyWrite50 : std_logic;
   SIGNAL DirtyWrite51 : std_logic;
   SIGNAL DirtyWrite6  : std_logic;
   SIGNAL DirtyWrite60 : std_logic;
   SIGNAL DirtyWrite61 : std_logic;
   SIGNAL DirtyWrite7  : std_logic;
   SIGNAL DirtyWrite70 : std_logic;
   SIGNAL DirtyWrite71 : std_logic;
   SIGNAL DirtyWritex  : LC3B_BYTE;
   SIGNAL DirtyWritex0 : LC3B_BYTE;
   SIGNAL DirtyWritex1 : LC3B_BYTE;
   SIGNAL INDEX        : LC3B_L2_INDEX;
   SIGNAL Load0        : std_logic;
   SIGNAL Load1        : std_logic;
   SIGNAL Load2        : std_logic;
   SIGNAL Load3        : std_logic;
   SIGNAL Load4        : std_logic;
   SIGNAL Load5        : std_logic;
   SIGNAL Load6        : std_logic;
   SIGNAL Load7        : std_logic;
   SIGNAL OFFSET       : LC3B_C_OFFSET;
   SIGNAL ReadAndHit   : std_logic;
   SIGNAL TAG          : LC3B_L2_TAG;
   SIGNAL TagAND0      : std_logic;
   SIGNAL TagAND1      : std_logic;
   SIGNAL TagAND2      : std_logic;
   SIGNAL TagAND3      : std_logic;
   SIGNAL TagAND4      : std_logic;
   SIGNAL TagAND5      : std_logic;
   SIGNAL TagAND6      : std_logic;
   SIGNAL TagAND7      : std_logic;
   SIGNAL TagANDx      : lc3b_byte;
   SIGNAL TagMuxOut    : LC3B_L2_TAG;
   SIGNAL TagOut0      : LC3B_L2_TAG;
   SIGNAL TagOut1      : LC3B_L2_TAG;
   SIGNAL TagOut2      : LC3B_L2_TAG;
   SIGNAL TagOut3      : LC3B_L2_TAG;
   SIGNAL TagOut4      : LC3B_L2_TAG;
   SIGNAL TagOut5      : LC3B_L2_TAG;
   SIGNAL TagOut6      : LC3B_L2_TAG;
   SIGNAL TagOut7      : LC3B_L2_TAG;
   SIGNAL TagisEqual0  : std_logic;
   SIGNAL TagisEqual1  : std_logic;
   SIGNAL TagisEqual2  : std_logic;
   SIGNAL TagisEqual3  : std_logic;
   SIGNAL TagisEqual4  : std_logic;
   SIGNAL TagisEqual5  : std_logic;
   SIGNAL TagisEqual6  : std_logic;
   SIGNAL TagisEqual7  : std_logic;
   SIGNAL ValidOut0    : std_logic;
   SIGNAL ValidOut1    : std_logic;
   SIGNAL ValidOut2    : std_logic;
   SIGNAL ValidOut3    : std_logic;
   SIGNAL ValidOut4    : std_logic;
   SIGNAL ValidOut5    : std_logic;
   SIGNAL ValidOut6    : std_logic;
   SIGNAL ValidOut7    : std_logic;
   SIGNAL Way0LRU      : std_logic;
   SIGNAL Way1LRU      : std_logic;
   SIGNAL Way2LRU      : std_logic;
   SIGNAL Way3LRU      : std_logic;
   SIGNAL Way4LRU      : std_logic;
   SIGNAL Way5LRU      : std_logic;
   SIGNAL Way6LRU      : std_logic;
   SIGNAL Way7LRU      : std_logic;
   SIGNAL WayMuxData   : LC3b_oword;
   SIGNAL WayMuxSel    : lc3b_8mux_sel;
   SIGNAL WayMuxTag    : LC3B_L2_TAG;
   SIGNAL WayMuxValid  : std_logic;
   SIGNAL WayxLRU      : LC3B_BYTE;
   SIGNAL WriteAddress : LC3b_word;
   SIGNAL WriteifLd    : LC3B_BYTE;
   SIGNAL WriteifLd0   : std_logic;
   SIGNAL WriteifLd1   : std_logic;
   SIGNAL WriteifLd2   : std_logic;
   SIGNAL WriteifLd3   : std_logic;
   SIGNAL WriteifLd4   : std_logic;
   SIGNAL WriteifLd5   : std_logic;
   SIGNAL WriteifLd6   : std_logic;
   SIGNAL WriteifLd7   : std_logic;
   SIGNAL lru_sel      : lc3b_8mux_sel;
   SIGNAL preHit       : std_logic;
   SIGNAL writtenData  : lc3b_oword;

   -- Implicit buffer signal declarations
   SIGNAL MRESP_H_internal : std_logic;
   SIGNAL hit_internal     : std_logic;
   SIGNAL read_internal    : std_logic;
   SIGNAL write_internal   : std_logic;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT BitMux2
   PORT (
      A   : IN     std_logic;
      B   : IN     std_logic;
      Sel : IN     std_logic;
      C   : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT Decoder3
   PORT (
      Dsel : IN     lc3b_8mux_sel ;
      A    : OUT    std_logic ;
      B    : OUT    std_logic ;
      C    : OUT    std_logic ;
      D    : OUT    std_logic ;
      E    : OUT    std_logic ;
      F    : OUT    std_logic ;
      G    : OUT    std_logic ;
      H    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Encoder8to3
   PORT (
      In0 : IN     std_logic;
      In1 : IN     std_logic;
      In2 : IN     std_logic;
      In3 : IN     std_logic;
      In4 : IN     std_logic;
      In5 : IN     std_logic;
      In6 : IN     std_logic;
      In7 : IN     std_logic;
      F   : OUT    lc3b_8mux_sel
   );
   END COMPONENT;
   COMPONENT L2TagCompare
   PORT (
      TagA    : IN     LC3B_L2_TAG;
      TagB    : IN     LC3B_L2_TAG;
      isEqual : OUT    std_logic  := '0'
   );
   END COMPONENT;
   COMPONENT MUX2_8
   PORT (
      A   : IN     LC3B_BYTE;
      B   : IN     LC3B_BYTE;
      SEL : IN     STD_LOGIC;
      F   : OUT    LC3B_BYTE
   );
   END COMPONENT;
   COMPONENT MUX8_1
   PORT (
      A      : IN     std_logic ;
      B      : IN     std_logic ;
      C      : IN     std_logic ;
      D      : IN     std_logic ;
      E      : IN     std_logic ;
      F      : IN     std_logic ;
      G      : IN     std_logic ;
      H      : IN     std_logic ;
      Result : OUT    std_logic ;
      sel    : IN     lc3b_8mux_sel 
   );
   END COMPONENT;
   COMPONENT MUX8_9
   PORT (
      A      : IN     lc3b_l2_tag ;
      B      : IN     lc3b_l2_tag ;
      C      : IN     lc3b_l2_tag ;
      D      : IN     lc3b_l2_tag ;
      E      : IN     lc3b_l2_tag ;
      F      : IN     lc3b_l2_tag ;
      G      : IN     lc3b_l2_tag ;
      H      : IN     lc3b_l2_tag ;
      Sel    : IN     lc3b_8mux_sel ;
      Result : OUT    lc3b_l2_tag 
   );
   END COMPONENT;
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC;
      F : OUT    STD_LOGIC
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT OR4
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : IN     std_logic ;
      D : IN     std_logic ;
      E : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT OWordMux2
   PORT (
      A   : IN     LC3b_oword ;
      B   : IN     LC3b_oword ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_oword 
   );
   END COMPONENT;
   COMPONENT True8LRU
   PORT (
      CLK     : IN     std_logic ;
      Hit0    : IN     std_logic ;
      Hit1    : IN     std_logic ;
      Hit2    : IN     std_logic ;
      Hit3    : IN     std_logic ;
      Hit4    : IN     std_logic ;
      Hit5    : IN     std_logic ;
      Hit6    : IN     std_logic ;
      Hit7    : IN     std_logic ;
      Index   : IN     LC3b_L2_index ;
      L2_RESP : IN     std_logic ;
      RESET_L : IN     std_logic ;
      LRU     : OUT    lc3b_8mux_sel 
   );
   END COMPONENT;
   COMPONENT WayMux8
   PORT (
      DataOut0    : IN     LC3b_oword ;
      DataOut1    : IN     LC3b_oword ;
      DataOut2    : IN     LC3b_oword ;
      DataOut3    : IN     LC3b_oword ;
      DataOut4    : IN     LC3b_oword ;
      DataOut5    : IN     LC3b_oword ;
      DataOut7    : IN     LC3b_oword ;
      TagOut0     : IN     LC3B_L2_TAG ;
      TagOut1     : IN     LC3B_L2_TAG ;
      TagOut2     : IN     LC3B_L2_TAG ;
      TagOut3     : IN     LC3B_L2_TAG ;
      TagOut4     : IN     LC3B_L2_TAG ;
      TagOut6     : IN     LC3B_L2_TAG ;
      ValidOut0   : IN     std_logic ;
      ValidOut1   : IN     std_logic ;
      ValidOut2   : IN     std_logic ;
      ValidOut3   : IN     std_logic ;
      ValidOut4   : IN     std_logic ;
      ValidOut5   : IN     std_logic ;
      ValidOut7   : IN     std_logic ;
      WayMuxData  : OUT    LC3b_oword ;
      WayMuxTag   : OUT    LC3B_L2_TAG ;
      WayMuxValid : OUT    std_logic ;
      WayMuxSel   : IN     lc3b_8mux_sel ;
      TagOut5     : IN     LC3B_L2_TAG ;
      ValidOut6   : IN     std_logic ;
      DataOut6    : IN     LC3b_oword ;
      TagOut7     : IN     LC3B_L2_TAG 
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
   COMPONENT l2way
   PORT (
      CacheWrite : IN     std_logic ;
      DataIn     : IN     LC3b_oword ;
      DirtyIn    : IN     std_logic ;
      DirtyWrite : IN     std_logic ;
      Index      : IN     LC3b_L2_index ;
      RESET_L    : IN     std_logic ;
      TagIn      : IN     LC3B_L2_TAG ;
      DataOut    : OUT    LC3b_oword ;
      DirtyOut   : OUT    std_logic ;
      TagOut     : OUT    LC3B_L2_TAG ;
      ValidOut   : OUT    std_logic  := '0'
   );
   END COMPONENT;
   COMPONENT oWordMux8
   PORT (
      In0 : IN     lc3b_oword ;
      In1 : IN     lc3b_oword ;
      In2 : IN     lc3b_oword ;
      In3 : IN     lc3b_oword ;
      In4 : IN     lc3b_oword ;
      In5 : IN     lc3b_oword ;
      In6 : IN     lc3b_oword ;
      In7 : IN     lc3b_oword ;
      Sel : IN     lc3b_8mux_sel ;
      F   : OUT    lc3b_oword 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : BitMux2 USE ENTITY ece411.BitMux2;
   FOR ALL : Decoder3 USE ENTITY ece411.Decoder3;
   FOR ALL : Encoder8to3 USE ENTITY ece411.Encoder8to3;
   FOR ALL : L2TagCompare USE ENTITY ece411.L2TagCompare;
   FOR ALL : MUX2_8 USE ENTITY ece411.MUX2_8;
   FOR ALL : MUX8_1 USE ENTITY ece411.MUX8_1;
   FOR ALL : MUX8_9 USE ENTITY ece411.MUX8_9;
   FOR ALL : NOT1 USE ENTITY ece411.NOT1;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : OR4 USE ENTITY ece411.OR4;
   FOR ALL : OWordMux2 USE ENTITY ece411.OWordMux2;
   FOR ALL : True8LRU USE ENTITY ece411.True8LRU;
   FOR ALL : WayMux8 USE ENTITY ece411.WayMux8;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : l2way USE ENTITY ece411.l2way;
   FOR ALL : oWordMux8 USE ENTITY ece411.oWordMux8;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   DATAIN <= WayMuxData;

   -- HDL Embedded Text Block 2 DirtyWritex01combiner
   DirtyWritex0 <= DirtyWrite70
   & DirtyWrite60 & DirtyWrite50 
   & DirtyWrite40 & DirtyWrite30
   & DirtyWrite20 & DirtyWrite10
   & DirtyWrite00;
   DirtyWritex1 <= DirtyWrite71
   & DirtyWrite61 & DirtyWrite51 
   & DirtyWrite41 & DirtyWrite31
   & DirtyWrite21 & DirtyWrite11
   & DirtyWrite01;

   -- HDL Embedded Text Block 3 DirtyWritexSplitter
   DirtyWrite0 <= DirtyWritex(0);
   DirtyWrite1 <= DirtyWritex(1);
   DirtyWrite2 <= DirtyWritex(2);
   DirtyWrite3 <= DirtyWritex(3);
   DirtyWrite4 <= DirtyWritex(4);
   DirtyWrite5 <= DirtyWritex(5);
   DirtyWrite6 <= DirtyWritex(6);
   DirtyWrite7 <= DirtyWritex(7);

   -- HDL Embedded Text Block 4 preLRUmuxCombiner
   WayxLRU <= Way7LRU & Way6LRU & 
   Way5LRU & Way4LRU & Way3LRU & 
   Way2LRU & Way1LRU & Way0LRU;
   TagANDx <= TagAND7 & TagAND6 & 
   TagAND5 & TagAND4 & TagAND3 & 
   TagAND2 & TagAND1 & TagAND0;

   -- HDL Embedded Text Block 5 preLRUmuxCombiner1
   WriteifLd0 <= WriteifLd(0);
   WriteifLd1 <= WriteifLd(1);
   WriteifLd2 <= WriteifLd(2);
   WriteifLd3 <= WriteifLd(3);
   WriteifLd4 <= WriteifLd(4);
   WriteifLd5 <= WriteifLd(5);
   WriteifLd6 <= WriteifLd(6);
   WriteifLd7 <= WriteifLd(7);

   -- HDL Embedded Text Block 6 eb2
   WriteAddress <= TagMuxOut & INDEX & "0000";

   -- HDL Embedded Text Block 7 address_splitter
   Offset <= ADDRESS(3 downto 0);
   Index <= ADDRESS(5 downto 4);
   Tag <= ADDRESS(15 downto 6);


   -- Instance port mappings.
   Tag1AND : AND2
      PORT MAP (
         A => TagisEqual0,
         B => ValidOut0,
         C => TagAND0
      );
   Tag1AND1 : AND2
      PORT MAP (
         A => TagisEqual2,
         B => ValidOut2,
         C => TagAND2
      );
   Tag1AND2 : AND2
      PORT MAP (
         A => TagisEqual4,
         B => ValidOut4,
         C => TagAND4
      );
   Tag1AND3 : AND2
      PORT MAP (
         A => TagisEqual6,
         B => ValidOut6,
         C => TagAND6
      );
   Tag2AND : AND2
      PORT MAP (
         A => TagisEqual1,
         B => ValidOut1,
         C => TagAND1
      );
   Tag2AND1 : AND2
      PORT MAP (
         A => preHit,
         B => setHit,
         C => hit_internal
      );
   Tag2AND2 : AND2
      PORT MAP (
         A => TagisEqual3,
         B => ValidOut3,
         C => TagAND3
      );
   Tag2AND3 : AND2
      PORT MAP (
         A => TagisEqual5,
         B => ValidOut5,
         C => TagAND5
      );
   Tag2AND4 : AND2
      PORT MAP (
         A => TagisEqual7,
         B => ValidOut7,
         C => TagAND7
      );
   U_0 : AND2
      PORT MAP (
         A => read_internal,
         B => hit_internal,
         C => ReadAndHit
      );
   U_5 : AND2
      PORT MAP (
         A => LD_Cache,
         B => WriteifLd0,
         C => Load0
      );
   U_7 : AND2
      PORT MAP (
         A => LD_Cache,
         B => WriteifLd1,
         C => Load1
      );
   U_9 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => Way0LRU,
         C => DirtyWrite01
      );
   U_10 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => TagAND1,
         C => DirtyWrite10
      );
   U_11 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => TagAND0,
         C => DirtyWrite00
      );
   U_12 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => Way1LRU,
         C => DirtyWrite11
      );
   U_13 : AND2
      PORT MAP (
         A => LD_Cache,
         B => WriteifLd2,
         C => Load2
      );
   U_16 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => TagAND2,
         C => DirtyWrite20
      );
   U_17 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => TagAND3,
         C => DirtyWrite30
      );
   U_18 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => TagAND4,
         C => DirtyWrite40
      );
   U_19 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => TagAND5,
         C => DirtyWrite50
      );
   U_20 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => TagAND6,
         C => DirtyWrite60
      );
   U_21 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => TagAND7,
         C => DirtyWrite70
      );
   U_22 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => Way2LRU,
         C => DirtyWrite21
      );
   U_23 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => Way3LRU,
         C => DirtyWrite31
      );
   U_24 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => Way4LRU,
         C => DirtyWrite41
      );
   U_25 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => Way5LRU,
         C => DirtyWrite51
      );
   U_26 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => Way6LRU,
         C => DirtyWrite61
      );
   U_27 : AND2
      PORT MAP (
         A => DirtyWrite,
         B => Way7LRU,
         C => DirtyWrite71
      );
   U_28 : AND2
      PORT MAP (
         A => LD_Cache,
         B => WriteifLd4,
         C => Load4
      );
   U_29 : AND2
      PORT MAP (
         A => LD_Cache,
         B => WriteifLd5,
         C => Load5
      );
   U_30 : AND2
      PORT MAP (
         A => LD_Cache,
         B => WriteifLd6,
         C => Load6
      );
   U_31 : AND2
      PORT MAP (
         A => LD_Cache,
         B => WriteifLd7,
         C => Load7
      );
   U_32 : AND2
      PORT MAP (
         A => LD_Cache,
         B => WriteifLd3,
         C => Load3
      );
   MRESP_MUX : BitMux2
      PORT MAP (
         A   => cont_RESP_H,
         B   => ReadAndHit,
         Sel => MRESPSel,
         C   => MRESP_H_internal
      );
   U_1 : Decoder3
      PORT MAP (
         Dsel => lru_sel,
         A    => Way0LRU,
         B    => Way1LRU,
         C    => Way2LRU,
         D    => Way3LRU,
         E    => Way4LRU,
         F    => Way5LRU,
         G    => Way6LRU,
         H    => Way7LRU
      );
   a8to3Encoder : Encoder8to3
      PORT MAP (
         In0 => TagAND0,
         In1 => TagAND1,
         In2 => TagAND2,
         In3 => TagAND3,
         In4 => TagAND4,
         In5 => TagAND5,
         In6 => TagAND6,
         In7 => TagAND7,
         F   => WayMuxSel
      );
   Tag0Compare : L2TagCompare
      PORT MAP (
         TagA    => TAG,
         TagB    => TagOut0,
         isEqual => TagisEqual0
      );
   Tag1Compare : L2TagCompare
      PORT MAP (
         TagA    => TAG,
         TagB    => TagOut1,
         isEqual => TagisEqual1
      );
   Tag2Compare : L2TagCompare
      PORT MAP (
         TagA    => TAG,
         TagB    => TagOut2,
         isEqual => TagisEqual2
      );
   Tag3Compare : L2TagCompare
      PORT MAP (
         TagA    => TAG,
         TagB    => TagOut3,
         isEqual => TagisEqual3
      );
   Tag4Compare : L2TagCompare
      PORT MAP (
         TagA    => TAG,
         TagB    => TagOut4,
         isEqual => TagisEqual4
      );
   Tag5Compare : L2TagCompare
      PORT MAP (
         TagA    => TAG,
         TagB    => TagOut5,
         isEqual => TagisEqual5
      );
   Tag6Compare : L2TagCompare
      PORT MAP (
         TagA    => TAG,
         TagB    => TagOut6,
         isEqual => TagisEqual6
      );
   Tag7Compare : L2TagCompare
      PORT MAP (
         TagA    => TAG,
         TagB    => TagOut7,
         isEqual => TagisEqual7
      );
   LRUmux : MUX2_8
      PORT MAP (
         A   => WayxLRU,
         B   => TagANDx,
         SEL => ignoreLRU,
         F   => WriteifLd
      );
   U_4 : MUX2_8
      PORT MAP (
         A   => DirtyWritex0,
         B   => DirtyWritex1,
         SEL => Dirtysel,
         F   => DirtyWritex
      );
   dirtyMux : MUX8_1
      PORT MAP (
         A      => DirtyOut0,
         B      => DirtyOut1,
         C      => DirtyOut2,
         D      => DirtyOut3,
         E      => DirtyOut4,
         F      => DirtyOut5,
         G      => DirtyOut6,
         H      => DirtyOut7,
         Result => WayMuxDirty,
         sel    => lru_sel
      );
   TagLRUMUX : MUX8_9
      PORT MAP (
         A      => TagOut0,
         B      => TagOut1,
         C      => TagOut2,
         D      => TagOut3,
         E      => TagOut4,
         F      => TagOut5,
         G      => TagOut6,
         H      => TagOut7,
         Sel    => lru_sel,
         Result => TagMuxOut
      );
   U_2 : NOT1
      PORT MAP (
         A => MWRITE_L,
         F => write_internal
      );
   U_3 : NOT1
      PORT MAP (
         A => MREAD_L,
         F => read_internal
      );
   TagOR : OR2
      PORT MAP (
         A => A,
         B => B2,
         C => preHit
      );
   U_14 : OR4
      PORT MAP (
         A => TagAND0,
         B => TagAND1,
         C => TagAND2,
         D => TagAND3,
         E => A
      );
   U_15 : OR4
      PORT MAP (
         A => TagAND4,
         B => TagAND5,
         C => TagAND6,
         D => TagAND7,
         E => B2
      );
   U_6 : OWordMux2
      PORT MAP (
         A   => DATAOUT,
         B   => WayMuxData,
         Sel => MWRITE_L,
         F   => writtenData
      );
   CacheDataMux : ENTITY ece411.OwordMux2
      PORT MAP (
         A   => PMDATAIN,
         B   => writtenData,
         Sel => CacheDataInSel,
         F   => CacheDataIn
      );
   aTrue8LRU : True8LRU
      PORT MAP (
         CLK     => CLK,
         Hit0    => TagAND0,
         Hit1    => TagAND1,
         Hit2    => TagAND2,
         Hit3    => TagAND3,
         Hit4    => TagAND4,
         Hit5    => TagAND5,
         Hit6    => TagAND6,
         Hit7    => TagAND7,
         Index   => INDEX,
         L2_RESP => MRESP_H_internal,
         RESET_L => RESET_L,
         LRU     => lru_sel
      );
   aWayMux8 : WayMux8
      PORT MAP (
         DataOut0    => DataOut0,
         DataOut1    => DataOut1,
         DataOut2    => DataOut2,
         DataOut3    => DataOut3,
         DataOut4    => DataOut4,
         DataOut5    => DataOut5,
         DataOut7    => DataOut7,
         TagOut0     => TagOut0,
         TagOut1     => TagOut1,
         TagOut2     => TagOut2,
         TagOut3     => TagOut3,
         TagOut4     => TagOut4,
         TagOut6     => TagOut6,
         ValidOut0   => ValidOut0,
         ValidOut1   => ValidOut1,
         ValidOut2   => ValidOut2,
         ValidOut3   => ValidOut3,
         ValidOut4   => ValidOut4,
         ValidOut5   => ValidOut5,
         ValidOut7   => ValidOut7,
         WayMuxData  => WayMuxData,
         WayMuxTag   => WayMuxTag,
         WayMuxValid => WayMuxValid,
         WayMuxSel   => WayMuxSel,
         TagOut5     => TagOut5,
         ValidOut6   => ValidOut6,
         DataOut6    => DataOut6,
         TagOut7     => TagOut7
      );
   AddressMux : WordMux2
      PORT MAP (
         A   => ADDRESS,
         B   => WriteAddress,
         Sel => AddrSel,
         F   => PMADDRESS
      );
   Way0 : l2way
      PORT MAP (
         CacheWrite => Load0,
         DataIn     => CacheDataIn,
         DirtyIn    => write_internal,
         DirtyWrite => DirtyWrite0,
         Index      => INDEX,
         RESET_L    => RESET_L,
         TagIn      => TAG,
         DataOut    => DataOut0,
         DirtyOut   => DirtyOut0,
         TagOut     => TagOut0,
         ValidOut   => ValidOut0
      );
   Way1 : l2way
      PORT MAP (
         CacheWrite => Load1,
         DataIn     => CacheDataIn,
         DirtyIn    => write_internal,
         DirtyWrite => DirtyWrite1,
         Index      => INDEX,
         RESET_L    => RESET_L,
         TagIn      => TAG,
         DataOut    => DataOut1,
         DirtyOut   => DirtyOut1,
         TagOut     => TagOut1,
         ValidOut   => ValidOut1
      );
   Way2 : l2way
      PORT MAP (
         CacheWrite => Load2,
         DataIn     => CacheDataIn,
         DirtyIn    => write_internal,
         DirtyWrite => DirtyWrite2,
         Index      => INDEX,
         RESET_L    => RESET_L,
         TagIn      => TAG,
         DataOut    => DataOut2,
         DirtyOut   => DirtyOut2,
         TagOut     => TagOut2,
         ValidOut   => ValidOut2
      );
   Way3 : l2way
      PORT MAP (
         CacheWrite => Load3,
         DataIn     => CacheDataIn,
         DirtyIn    => write_internal,
         DirtyWrite => DirtyWrite3,
         Index      => INDEX,
         RESET_L    => RESET_L,
         TagIn      => TAG,
         DataOut    => DataOut3,
         DirtyOut   => DirtyOut3,
         TagOut     => TagOut3,
         ValidOut   => ValidOut3
      );
   Way4 : l2way
      PORT MAP (
         CacheWrite => Load4,
         DataIn     => CacheDataIn,
         DirtyIn    => write_internal,
         DirtyWrite => DirtyWrite4,
         Index      => INDEX,
         RESET_L    => RESET_L,
         TagIn      => TAG,
         DataOut    => DataOut4,
         DirtyOut   => DirtyOut4,
         TagOut     => TagOut4,
         ValidOut   => ValidOut4
      );
   Way5 : l2way
      PORT MAP (
         CacheWrite => Load5,
         DataIn     => CacheDataIn,
         DirtyIn    => write_internal,
         DirtyWrite => DirtyWrite5,
         Index      => INDEX,
         RESET_L    => RESET_L,
         TagIn      => TAG,
         DataOut    => DataOut5,
         DirtyOut   => DirtyOut5,
         TagOut     => TagOut5,
         ValidOut   => ValidOut5
      );
   Way6 : l2way
      PORT MAP (
         CacheWrite => Load6,
         DataIn     => CacheDataIn,
         DirtyIn    => write_internal,
         DirtyWrite => DirtyWrite6,
         Index      => INDEX,
         RESET_L    => RESET_L,
         TagIn      => TAG,
         DataOut    => DataOut6,
         DirtyOut   => DirtyOut6,
         TagOut     => TagOut6,
         ValidOut   => ValidOut6
      );
   Way7 : l2way
      PORT MAP (
         CacheWrite => Load7,
         DataIn     => CacheDataIn,
         DirtyIn    => write_internal,
         DirtyWrite => DirtyWrite7,
         Index      => INDEX,
         RESET_L    => RESET_L,
         TagIn      => TAG,
         DataOut    => DataOut7,
         DirtyOut   => DirtyOut7,
         TagOut     => TagOut7,
         ValidOut   => ValidOut7
      );
   PMDATAMUX : oWordMux8
      PORT MAP (
         In0 => DataOut0,
         In1 => DataOut1,
         In2 => DataOut2,
         In3 => DataOut3,
         In4 => DataOut4,
         In5 => DataOut5,
         In6 => DataOut6,
         In7 => DataOut7,
         Sel => lru_sel,
         F   => PMDATAOUT
      );

   -- Implicit buffered output assignments
   MRESP_H <= MRESP_H_internal;
   hit     <= hit_internal;
   read    <= read_internal;
   write   <= write_internal;

END struct;
