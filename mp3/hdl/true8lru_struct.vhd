-- VHDL Entity ece411.True8LRU.symbol
--
-- Created:
--          by - lis2.ews (siebl-0220-17.ews.illinois.edu)
--          at - 06:13:02 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY True8LRU IS
   PORT( 
      CLK     : IN     std_logic;
      Hit0    : IN     std_logic;
      Hit1    : IN     std_logic;
      Hit2    : IN     std_logic;
      Hit3    : IN     std_logic;
      Hit4    : IN     std_logic;
      Hit5    : IN     std_logic;
      Hit6    : IN     std_logic;
      Hit7    : IN     std_logic;
      Index   : IN     LC3b_c_index;
      L2_RESP : IN     std_logic;
      RESET_L : IN     std_logic;
      LRU     : OUT    lc3b_8mux_sel
   );

-- Declarations

END True8LRU ;

--
-- VHDL Architecture ece411.True8LRU.struct
--
-- Created:
--          by - lis2.ews (siebl-0220-17.ews.illinois.edu)
--          at - 06:13:03 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF True8LRU IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL A           : std_logic;
   SIGNAL D           : std_logic;
   SIGNAL DataOut     : LC3b_LRULINE;
   SIGNAL Equal       : std_logic;
   SIGNAL Equal1      : std_logic;
   SIGNAL Equal2      : std_logic;
   SIGNAL Equal3      : std_logic;
   SIGNAL Hit_encoded : lc3b_8mux_sel;
   SIGNAL In1         : std_logic;
   SIGNAL In3         : std_logic;
   SIGNAL In5         : std_logic;
   SIGNAL Shift0to1   : std_logic;
   SIGNAL Shift1to2   : std_logic;
   SIGNAL Shift2to3   : std_logic;
   SIGNAL Shift3to4   : std_logic;
   SIGNAL Shift4to5   : std_logic;
   SIGNAL Shift5to6   : std_logic;
   SIGNAL Shift6to7   : std_logic;
   SIGNAL SpotHit     : lc3b_8mux_sel;
   SIGNAL new1        : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL new2        : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL new3        : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL new4        : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL new5        : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL new6        : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL new7        : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL newData     : LC3b_LRULINE;
   SIGNAL new_MRU     : lc3b_8mux_sel;
   SIGNAL spot0       : std_logic_vector(2 DOWNTO 0);
   SIGNAL spot1       : std_logic_vector(2 DOWNTO 0);
   SIGNAL spot2       : std_logic_vector(2 DOWNTO 0);
   SIGNAL spot3       : std_logic_vector(2 DOWNTO 0);
   SIGNAL spot4       : std_logic_vector(2 DOWNTO 0);
   SIGNAL spot5       : std_logic_vector(2 DOWNTO 0);
   SIGNAL spot6       : std_logic_vector(2 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL LRU_internal : lc3b_8mux_sel;


   -- Component Declarations
   COMPONENT COMP3
   PORT (
      A     : IN     std_logic_vector (2 DOWNTO 0);
      B     : IN     std_logic_vector (2 DOWNTO 0);
      Equal : OUT    std_logic 
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
   COMPONENT MUX2_3
   PORT (
      A   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      B   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      SEL : IN     STD_LOGIC;
      F   : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT MUX8_3
   PORT (
      A      : IN     lc3b_8mux_sel ;
      B      : IN     lc3b_8mux_sel ;
      C      : IN     lc3b_8mux_sel ;
      D      : IN     lc3b_8mux_sel ;
      E      : IN     lc3b_8mux_sel ;
      F      : IN     lc3b_8mux_sel ;
      G      : IN     lc3b_8mux_sel ;
      H      : IN     lc3b_8mux_sel ;
      sel    : IN     lc3b_8mux_sel ;
      result : OUT    lc3b_8mux_sel 
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
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
   COMPONENT OR4
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : IN     std_logic ;
      D : IN     std_logic ;
      E : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT TRUE8LRUArray
   PORT (
      CLK       : IN     std_logic;
      DataIn    : IN     LC3b_LRULINE;
      DataWrite : IN     std_logic;
      Index     : IN     LC3b_c_index;
      RESET_L   : IN     std_logic;
      DataOut   : OUT    LC3b_LRULINE
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : COMP3 USE ENTITY ece411.COMP3;
   FOR ALL : Encoder8to3 USE ENTITY ece411.Encoder8to3;
   FOR ALL : MUX2_3 USE ENTITY ece411.MUX2_3;
   FOR ALL : MUX8_3 USE ENTITY ece411.MUX8_3;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : OR3 USE ENTITY ece411.OR3;
   FOR ALL : OR4 USE ENTITY ece411.OR4;
   FOR ALL : TRUE8LRUArray USE ENTITY ece411.TRUE8LRUArray;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 LRUripper
   spot0 <= DataOut(2 downto 0);
   spot1 <= DataOut(5 downto 3);
   spot2 <= DataOut(8 downto 6);
   spot3 <= DataOut(11 downto 9);
   spot4 <= DataOut(14 downto 12);
   spot5 <= DataOut(17 downto 15);
   spot6 <= DataOut(20 downto 18);
   LRU_internal <= DataOut(23 downto 21);                   

   -- HDL Embedded Text Block 2 new_assembler
   newData <= new7 & new6 &
   new5 & new4 & new3 & new2
   & new1 & new_MRU;


   -- Instance port mappings.
   U_2 : COMP3
      PORT MAP (
         A     => Hit_encoded,
         B     => spot0,
         Equal => Equal
      );
   U_3 : COMP3
      PORT MAP (
         A     => Hit_encoded,
         B     => spot1,
         Equal => In1
      );
   U_4 : COMP3
      PORT MAP (
         A     => Hit_encoded,
         B     => spot2,
         Equal => Equal1
      );
   U_5 : COMP3
      PORT MAP (
         A     => Hit_encoded,
         B     => spot3,
         Equal => In3
      );
   U_6 : COMP3
      PORT MAP (
         A     => Hit_encoded,
         B     => spot4,
         Equal => Equal2
      );
   U_7 : COMP3
      PORT MAP (
         A     => Hit_encoded,
         B     => spot5,
         Equal => In5
      );
   U_8 : COMP3
      PORT MAP (
         A     => Hit_encoded,
         B     => spot6,
         Equal => Equal3
      );
   U_9 : COMP3
      PORT MAP (
         A     => Hit_encoded,
         B     => LRU_internal,
         Equal => Shift6to7
      );
   HitEncoder : Encoder8to3
      PORT MAP (
         In0 => Hit0,
         In1 => Hit1,
         In2 => Hit2,
         In3 => Hit3,
         In4 => Hit4,
         In5 => Hit5,
         In6 => Hit6,
         In7 => Hit7,
         F   => Hit_encoded
      );
   spotEncoder : Encoder8to3
      PORT MAP (
         In0 => Equal,
         In1 => In1,
         In2 => Equal1,
         In3 => In3,
         In4 => Equal2,
         In5 => In5,
         In6 => Equal3,
         In7 => Shift6to7,
         F   => SpotHit
      );
   pos1 : MUX2_3
      PORT MAP (
         A   => spot1,
         B   => spot0,
         SEL => Shift0to1,
         F   => new1
      );
   pos2 : MUX2_3
      PORT MAP (
         A   => spot2,
         B   => spot1,
         SEL => Shift1to2,
         F   => new2
      );
   pos3 : MUX2_3
      PORT MAP (
         A   => spot3,
         B   => spot2,
         SEL => Shift2to3,
         F   => new3
      );
   pos4 : MUX2_3
      PORT MAP (
         A   => spot4,
         B   => spot3,
         SEL => Shift3to4,
         F   => new4
      );
   pos5 : MUX2_3
      PORT MAP (
         A   => spot5,
         B   => spot4,
         SEL => Shift4to5,
         F   => new5
      );
   pos6 : MUX2_3
      PORT MAP (
         A   => spot6,
         B   => spot5,
         SEL => Shift5to6,
         F   => new6
      );
   pos7 : MUX2_3
      PORT MAP (
         A   => LRU_internal,
         B   => spot6,
         SEL => Shift6to7,
         F   => new7
      );
   U_11 : MUX8_3
      PORT MAP (
         A      => spot0,
         B      => spot1,
         C      => spot2,
         D      => spot3,
         E      => spot4,
         F      => spot5,
         G      => spot6,
         H      => LRU_internal,
         sel    => SpotHit,
         result => new_MRU
      );
   U_12 : OR2
      PORT MAP (
         A => Equal3,
         B => Shift6to7,
         C => Shift5to6
      );
   U_15 : OR2
      PORT MAP (
         A => In3,
         B => Shift3to4,
         C => Shift2to3
      );
   U_16 : OR2
      PORT MAP (
         A => Equal1,
         B => In3,
         C => A
      );
   U_17 : OR2
      PORT MAP (
         A => A,
         B => Shift3to4,
         C => Shift1to2
      );
   U_19 : OR2
      PORT MAP (
         A => D,
         B => Shift3to4,
         C => Shift0to1
      );
   U_13 : OR3
      PORT MAP (
         A => In5,
         B => Equal3,
         C => Shift6to7,
         D => Shift4to5
      );
   U_18 : OR3
      PORT MAP (
         A => In1,
         B => Equal1,
         C => In3,
         D => D
      );
   U_14 : OR4
      PORT MAP (
         A => Equal2,
         B => In5,
         C => Equal3,
         D => Shift6to7,
         E => Shift3to4
      );
   aArray : TRUE8LRUArray
      PORT MAP (
         RESET_L   => RESET_L,
         DataWrite => L2_RESP,
         Index     => Index,
         CLK       => CLK,
         DataIn    => newData,
         DataOut   => DataOut
      );

   -- Implicit buffered output assignments
   LRU <= LRU_internal;

END struct;
