-- VHDL Entity ece411.Cache_Datapath.interface
--
-- Created:
--          by - adalton2.ews (evrt-252-26.ews.illinois.edu)
--          at - 15:29:46 04/04/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Cache_Datapath IS
   PORT( 
      ADDRESS        : IN     LC3b_word;
      AddrSel        : IN     std_logic;
      CLK            : IN     STD_LOGIC;
      CacheDataInSel : IN     std_logic;
      DATAOUT        : IN     LC3b_word;
      DirtyWrite     : IN     std_logic;
      Dirtysel       : IN     std_logic;
      LD_Cache       : IN     std_logic;
      MREAD_L        : IN     std_logic;
      MRESPSel       : IN     std_logic;
      MWRITEH_L      : IN     std_logic;
      MWRITEL_L      : IN     std_logic;
      PMDATAIN       : IN     LC3B_OWORD;
      RESET_L        : IN     STD_LOGIC;
      cont_RESP_H    : IN     std_logic;
      ignoreLRU      : IN     std_logic;
      setHit         : IN     std_logic;
      DATAIN         : OUT    LC3b_word;
      MRESP_H        : OUT    std_logic;
      PMADDRESS      : OUT    LC3B_WORD;
      PMDATAOUT      : OUT    LC3B_OWORD;
      WayMuxDirty    : OUT    std_logic;
      hit            : OUT    std_logic;
      read           : OUT    std_logic;
      write          : OUT    std_logic
   );

-- Declarations

END Cache_Datapath ;

--
-- VHDL Architecture ece411.Cache_Datapath.struct
--
-- Created:
--          by - adalton2.ews (evrt-252-26.ews.illinois.edu)
--          at - 15:29:46 04/04/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Cache_Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL B            : std_logic;
   SIGNAL B1           : std_logic;
   SIGNAL C0           : std_logic;
   SIGNAL C1           : std_logic;
   SIGNAL CacheDataIn  : LC3b_oword;
   SIGNAL DataOut0     : LC3b_oword;
   SIGNAL DataOut1     : LC3b_oword;
   SIGNAL DirtyOut0    : std_logic;
   SIGNAL DirtyOut1    : std_logic;
   SIGNAL DirtyWrite0  : std_logic;
   SIGNAL DirtyWrite00 : std_logic;
   SIGNAL DirtyWrite01 : std_logic;
   SIGNAL DirtyWrite1  : std_logic;
   SIGNAL DirtyWrite10 : std_logic;
   SIGNAL DirtyWrite11 : std_logic;
   SIGNAL INDEX        : LC3B_C_INDEX;
   SIGNAL LRUIn        : STD_LOGIC;
   SIGNAL LRUOut       : std_logic;
   SIGNAL Load0        : std_logic;
   SIGNAL Load1        : std_logic;
   SIGNAL OFFSET       : LC3B_C_OFFSET;
   SIGNAL ReadAndHit   : std_logic;
   SIGNAL TAG          : LC3B_C_TAG;
   SIGNAL TagAND0      : std_logic;
   SIGNAL TagAND1      : std_logic;
   SIGNAL TagMuxOut    : LC3B_C_TAG;
   SIGNAL TagOut0      : LC3B_C_TAG;
   SIGNAL TagOut1      : LC3B_C_TAG;
   SIGNAL TagisEqual0  : std_logic;
   SIGNAL TagisEqual1  : std_logic;
   SIGNAL ValidOut0    : std_logic;
   SIGNAL ValidOut1    : std_logic;
   SIGNAL Way0LRU      : std_logic;
   SIGNAL Way0Write    : STD_LOGIC;
   SIGNAL Way1LRU      : std_logic;
   SIGNAL Way1Write    : STD_LOGIC;
   SIGNAL WayMuxData   : LC3b_oword;
   SIGNAL WayMuxTag    : LC3B_C_TAG;
   SIGNAL WayMuxValid  : std_logic;
   SIGNAL WriteAddress : LC3b_word;
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
   COMPONENT AddressJoin
   PORT (
      INDEX        : IN     LC3B_C_INDEX;
      TagMuxOut    : IN     LC3B_C_TAG;
      WriteAddress : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT AddressSplit
   PORT (
      ADDRESS : IN     LC3b_word;
      INDEX   : OUT    LC3B_C_INDEX;
      OFFSET  : OUT    LC3B_C_OFFSET;
      TAG     : OUT    LC3B_C_TAG
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
   COMPONENT Data16Mux
   PORT (
      OFFSET     : IN     LC3B_C_OFFSET;
      WayMuxData : IN     LC3b_oword;
      DATAIN     : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT Decode2
   PORT (
      A : IN     std_logic;
      B : OUT    std_logic;
      C : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT DirtyMUX
   PORT (
      A   : IN     std_logic;
      B   : IN     std_logic;
      Sel : IN     std_logic;
      C   : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT LRUArray
   PORT (
      CLK      : IN     std_logic;
      Index    : IN     LC3b_c_index;
      LRUIn    : IN     std_logic;
      LRUWrite : IN     std_logic;
      RESET_L  : IN     std_logic;
      LRUOut   : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT LRUDecode
   PORT (
      LD_Cache  : IN     std_logic;
      LRUOut    : IN     std_logic;
      TagAND0   : IN     std_logic;
      TagAND1   : IN     std_logic;
      LRUIn     : OUT    STD_LOGIC;
      Way0Write : OUT    STD_LOGIC;
      Way1Write : OUT    STD_LOGIC
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
   COMPONENT OwordMux2
   PORT (
      A   : IN     LC3b_oword;
      B   : IN     LC3b_oword;
      Sel : IN     std_logic;
      F   : OUT    LC3b_oword
   );
   END COMPONENT;
   COMPONENT TagCompare
   PORT (
      TagA    : IN     LC3B_C_TAG;
      TagB    : IN     LC3B_C_TAG;
      isEqual : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT TagMux
   PORT (
      LRUOut    : IN     std_logic;
      TagOut0   : IN     LC3B_C_TAG;
      TagOut1   : IN     LC3B_C_TAG;
      TagMuxOut : OUT    LC3B_C_TAG
   );
   END COMPONENT;
   COMPONENT TwoBitMux2
   PORT (
      A0  : IN     std_logic;
      A1  : IN     std_logic;
      B0  : IN     std_logic;
      B1  : IN     std_logic;
      sel : IN     std_logic;
      C0  : OUT    std_logic;
      C1  : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT WayMux
   PORT (
      DataOut0    : IN     LC3b_oword;
      DataOut1    : IN     LC3b_oword;
      DirtyOut0   : IN     std_logic;
      DirtyOut1   : IN     std_logic;
      TagAND0     : IN     std_logic;
      TagAND1     : IN     std_logic;
      TagOut0     : IN     LC3B_C_TAG;
      TagOut1     : IN     LC3B_C_TAG;
      ValidOut0   : IN     std_logic;
      ValidOut1   : IN     std_logic;
      WayMuxData  : OUT    LC3b_oword;
      WayMuxTag   : OUT    LC3B_C_TAG;
      WayMuxValid : OUT    std_logic
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
   COMPONENT WriteLogic
   PORT (
      DATAOUT     : IN     LC3b_word;
      MWRITEH_L   : IN     std_logic;
      MWRITEL_L   : IN     std_logic;
      OFFSET      : IN     LC3B_C_OFFSET;
      WayMuxData  : IN     LC3b_oword;
      writtenData : OUT    lc3b_oword
   );
   END COMPONENT;
   COMPONENT way
   PORT (
      CacheWrite : IN     std_logic;
      DataIn     : IN     LC3b_oword;
      DirtyIn    : IN     std_logic;
      DirtyWrite : IN     std_logic;
      Index      : IN     LC3b_c_index;
      RESET_L    : IN     std_logic;
      TagIn      : IN     LC3B_C_TAG;
      DataOut    : OUT    LC3b_oword;
      DirtyOut   : OUT    std_logic;
      TagOut     : OUT    LC3B_C_TAG;
      ValidOut   : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : AddressJoin USE ENTITY ece411.AddressJoin;
   FOR ALL : AddressSplit USE ENTITY ece411.AddressSplit;
   FOR ALL : BitMux2 USE ENTITY ece411.BitMux2;
   FOR ALL : Data16Mux USE ENTITY ece411.Data16Mux;
   FOR ALL : Decode2 USE ENTITY ece411.Decode2;
   FOR ALL : DirtyMUX USE ENTITY ece411.DirtyMUX;
   FOR ALL : LRUArray USE ENTITY ece411.LRUArray;
   FOR ALL : LRUDecode USE ENTITY ece411.LRUDecode;
   FOR ALL : NOT1 USE ENTITY ece411.NOT1;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : OwordMux2 USE ENTITY ece411.OwordMux2;
   FOR ALL : TagCompare USE ENTITY ece411.TagCompare;
   FOR ALL : TagMux USE ENTITY ece411.TagMux;
   FOR ALL : TwoBitMux2 USE ENTITY ece411.TwoBitMux2;
   FOR ALL : WayMux USE ENTITY ece411.WayMux;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WriteLogic USE ENTITY ece411.WriteLogic;
   FOR ALL : way USE ENTITY ece411.way;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Tag1AND : AND2
      PORT MAP (
         A => TagisEqual0,
         B => ValidOut0,
         C => TagAND0
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
   U_0 : AND2
      PORT MAP (
         A => read_internal,
         B => hit_internal,
         C => ReadAndHit
      );
   U_5 : AND2
      PORT MAP (
         A => LD_Cache,
         B => C0,
         C => Load0
      );
   U_7 : AND2
      PORT MAP (
         A => LD_Cache,
         B => C1,
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
   aAddressJoin : AddressJoin
      PORT MAP (
         INDEX        => INDEX,
         TagMuxOut    => TagMuxOut,
         WriteAddress => WriteAddress
      );
   aAddressSplit : AddressSplit
      PORT MAP (
         ADDRESS => ADDRESS,
         OFFSET  => OFFSET,
         INDEX   => INDEX,
         TAG     => TAG
      );
   MRESP_MUX : BitMux2
      PORT MAP (
         A   => cont_RESP_H,
         B   => ReadAndHit,
         Sel => MRESPSel,
         C   => MRESP_H_internal
      );
   aData16Mux : Data16Mux
      PORT MAP (
         OFFSET     => OFFSET,
         DATAIN     => DATAIN,
         WayMuxData => WayMuxData
      );
   U_8 : Decode2
      PORT MAP (
         A => LRUOut,
         B => Way0LRU,
         C => Way1LRU
      );
   aDirtyMux : DirtyMUX
      PORT MAP (
         A   => DirtyOut0,
         B   => DirtyOut1,
         Sel => LRUOut,
         C   => WayMuxDirty
      );
   aLRUArray : LRUArray
      PORT MAP (
         RESET_L  => RESET_L,
         LRUWrite => MRESP_H_internal,
         CLK      => CLK,
         Index    => INDEX,
         LRUIn    => LRUIn,
         LRUOut   => LRUOut
      );
   aLRUDecode : LRUDecode
      PORT MAP (
         LRUOut    => LRUOut,
         Way0Write => Way0Write,
         Way1Write => Way1Write,
         LRUIn     => LRUIn,
         TagAND0   => TagAND0,
         TagAND1   => TagAND1,
         LD_Cache  => LD_Cache
      );
   U_1 : NOT1
      PORT MAP (
         A => MWRITEH_L,
         F => B
      );
   U_2 : NOT1
      PORT MAP (
         A => MWRITEL_L,
         F => B1
      );
   U_3 : NOT1
      PORT MAP (
         A => MREAD_L,
         F => read_internal
      );
   TagOR : OR2
      PORT MAP (
         A => TagAND0,
         B => TagAND1,
         C => preHit
      );
   U_4 : OR2
      PORT MAP (
         A => B,
         B => B1,
         C => write_internal
      );
   CacheDataMux : OwordMux2
      PORT MAP (
         A   => PMDATAIN,
         B   => writtenData,
         Sel => CacheDataInSel,
         F   => CacheDataIn
      );
   PMDATAMUX : OwordMux2
      PORT MAP (
         A   => DataOut0,
         B   => DataOut1,
         Sel => LRUOut,
         F   => PMDATAOUT
      );
   Tag1Compare : TagCompare
      PORT MAP (
         TagA    => TAG,
         TagB    => TagOut0,
         isEqual => TagisEqual0
      );
   Tag2Compare : TagCompare
      PORT MAP (
         TagA    => TAG,
         TagB    => TagOut1,
         isEqual => TagisEqual1
      );
   aTagMux : TagMux
      PORT MAP (
         LRUOut    => LRUOut,
         TagOut0   => TagOut0,
         TagOut1   => TagOut1,
         TagMuxOut => TagMuxOut
      );
   U_6 : TwoBitMux2
      PORT MAP (
         A0  => Way0Write,
         A1  => Way1Write,
         B0  => TagAND0,
         B1  => TagAND1,
         sel => ignoreLRU,
         C0  => C0,
         C1  => C1
      );
   U_13 : TwoBitMux2
      PORT MAP (
         A0  => DirtyWrite00,
         A1  => DirtyWrite10,
         B0  => DirtyWrite01,
         B1  => DirtyWrite11,
         sel => Dirtysel,
         C0  => DirtyWrite0,
         C1  => DirtyWrite1
      );
   aWayMux : WayMux
      PORT MAP (
         DataOut0    => DataOut0,
         DataOut1    => DataOut1,
         DirtyOut0   => DirtyOut0,
         DirtyOut1   => DirtyOut1,
         TagAND0     => TagAND0,
         TagAND1     => TagAND1,
         TagOut0     => TagOut0,
         TagOut1     => TagOut1,
         ValidOut0   => ValidOut0,
         ValidOut1   => ValidOut1,
         WayMuxData  => WayMuxData,
         WayMuxTag   => WayMuxTag,
         WayMuxValid => WayMuxValid
      );
   AddressMux : WordMux2
      PORT MAP (
         A   => ADDRESS,
         B   => WriteAddress,
         Sel => AddrSel,
         F   => PMADDRESS
      );
   aWriteLogic : WriteLogic
      PORT MAP (
         DATAOUT     => DATAOUT,
         MWRITEH_L   => MWRITEH_L,
         MWRITEL_L   => MWRITEL_L,
         OFFSET      => OFFSET,
         WayMuxData  => WayMuxData,
         writtenData => writtenData
      );
   Way0 : way
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
   Way1 : way
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

   -- Implicit buffered output assignments
   MRESP_H <= MRESP_H_internal;
   hit     <= hit_internal;
   read    <= read_internal;
   write   <= write_internal;

END struct;
