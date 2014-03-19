-- VHDL Entity ece411.WordWrite.symbol
--
-- Created:
--          by - buris2.ews (evrt-252-10.ews.illinois.edu)
--          at - 15:10:17 02/28/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordWrite IS
   PORT( 
      DATAOUT       : IN     LC3b_word;
      MWRITEH_L     : IN     std_logic;
      MWRITEL_L     : IN     std_logic;
      PMDATAIN      : IN     LC3B_OWORD;
      offset3_1     : IN     lc3b_8mux_sel;
      wordwrite_out : OUT    lc3b_oword
   );

-- Declarations

END WordWrite ;

--
-- VHDL Architecture ece411.WordWrite.struct
--
-- Created:
--          by - buris2.ews (evrt-252-10.ews.illinois.edu)
--          at - 15:10:18 02/28/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF WordWrite IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Dout0 : LC3b_word;
   SIGNAL Dout1 : LC3b_word;
   SIGNAL Dout2 : LC3b_word;
   SIGNAL Dout3 : LC3b_word;
   SIGNAL Dout4 : LC3b_word;
   SIGNAL Dout5 : LC3b_word;
   SIGNAL Dout6 : LC3b_word;
   SIGNAL Dout7 : LC3b_word;
   SIGNAL WR0   : std_logic;
   SIGNAL WR1   : std_logic;
   SIGNAL WR2   : std_logic;
   SIGNAL WR3   : std_logic;
   SIGNAL WR4   : std_logic;
   SIGNAL WR5   : std_logic;
   SIGNAL WR6   : std_logic;
   SIGNAL WR7   : std_logic;
   SIGNAL word0 : LC3B_WORD;
   SIGNAL word1 : LC3B_WORD;
   SIGNAL word2 : LC3B_WORD;
   SIGNAL word3 : LC3B_WORD;
   SIGNAL word4 : LC3B_WORD;
   SIGNAL word5 : LC3B_WORD;
   SIGNAL word6 : LC3B_WORD;
   SIGNAL word7 : LC3B_WORD;


   -- Component Declarations
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
   COMPONENT OWord_split
   PORT (
      PMDATAOUT : IN     LC3B_OWORD;
      word0     : OUT    LC3B_WORD;
      word1     : OUT    LC3B_WORD;
      word2     : OUT    LC3B_WORD;
      word3     : OUT    LC3B_WORD;
      word4     : OUT    LC3B_WORD;
      word5     : OUT    LC3B_WORD;
      word6     : OUT    LC3B_WORD;
      word7     : OUT    LC3B_WORD
   );
   END COMPONENT;
   COMPONENT WRtoWord
   PORT (
      DATAOUT   : IN     LC3b_word ;
      MWRITEH_L : IN     std_logic ;
      MWRITEL_L : IN     std_logic ;
      WR        : IN     std_logic ;
      word_in   : IN     lc3b_word ;
      Dout      : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT WordJoin8
   PORT (
      Dout0         : IN     LC3b_word;
      Dout1         : IN     LC3b_word;
      Dout2         : IN     LC3b_word;
      Dout3         : IN     LC3b_word;
      Dout4         : IN     LC3b_word;
      Dout5         : IN     LC3b_word;
      Dout6         : IN     LC3b_word;
      Dout7         : IN     LC3b_word;
      wordwrite_out : OUT    lc3b_oword
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Decoder3 USE ENTITY ece411.Decoder3;
   FOR ALL : OWord_split USE ENTITY ece411.OWord_split;
   FOR ALL : WRtoWord USE ENTITY ece411.WRtoWord;
   FOR ALL : WordJoin8 USE ENTITY ece411.WordJoin8;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : Decoder3
      PORT MAP (
         Dsel => offset3_1,
         A    => WR0,
         B    => WR1,
         C    => WR2,
         D    => WR3,
         E    => WR4,
         F    => WR5,
         G    => WR6,
         H    => WR7
      );
   U_0 : OWord_split
      PORT MAP (
         word0     => word0,
         word1     => word1,
         word2     => word2,
         word3     => word3,
         word4     => word4,
         word5     => word5,
         word6     => word6,
         word7     => word7,
         PMDATAOUT => PMDATAIN
      );
   U_3 : WRtoWord
      PORT MAP (
         DATAOUT   => DATAOUT,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         WR        => WR0,
         word_in   => word0,
         Dout      => Dout0
      );
   U_4 : WRtoWord
      PORT MAP (
         DATAOUT   => DATAOUT,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         WR        => WR1,
         word_in   => word1,
         Dout      => Dout1
      );
   U_5 : WRtoWord
      PORT MAP (
         DATAOUT   => DATAOUT,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         WR        => WR2,
         word_in   => word2,
         Dout      => Dout2
      );
   U_6 : WRtoWord
      PORT MAP (
         DATAOUT   => DATAOUT,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         WR        => WR3,
         word_in   => word3,
         Dout      => Dout3
      );
   U_7 : WRtoWord
      PORT MAP (
         DATAOUT   => DATAOUT,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         WR        => WR4,
         word_in   => word4,
         Dout      => Dout4
      );
   U_8 : WRtoWord
      PORT MAP (
         DATAOUT   => DATAOUT,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         WR        => WR5,
         word_in   => word5,
         Dout      => Dout5
      );
   U_9 : WRtoWord
      PORT MAP (
         DATAOUT   => DATAOUT,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         WR        => WR6,
         word_in   => word6,
         Dout      => Dout6
      );
   U_10 : WRtoWord
      PORT MAP (
         DATAOUT   => DATAOUT,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         WR        => WR7,
         word_in   => word7,
         Dout      => Dout7
      );
   U_11 : WordJoin8
      PORT MAP (
         Dout0         => Dout0,
         Dout1         => Dout1,
         Dout2         => Dout2,
         Dout3         => Dout3,
         Dout4         => Dout4,
         Dout5         => Dout5,
         Dout6         => Dout6,
         Dout7         => Dout7,
         wordwrite_out => wordwrite_out
      );

END struct;
