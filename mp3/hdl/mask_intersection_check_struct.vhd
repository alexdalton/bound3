-- VHDL Entity ece411.mask_intersection_check.symbol
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 03:57:46 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mask_intersection_check IS
   PORT( 
      maskA   : IN     lc3b_byte;
      maskB   : IN     lc3b_byte;
      match   : OUT    std_logic;
      match_L : OUT    std_logic
   );

-- Declarations

END mask_intersection_check ;

--
-- VHDL Architecture ece411.mask_intersection_check.struct
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 03:57:47 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF mask_intersection_check IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL A                : std_logic;
   SIGNAL B                : std_logic;
   SIGNAL C                : std_logic;
   SIGNAL D                : std_logic;
   SIGNAL E                : std_logic;
   SIGNAL F                : std_logic;
   SIGNAL G                : std_logic;
   SIGNAL H                : std_logic;
   SIGNAL intersectionMask : lc3b_byte;
   SIGNAL lower            : std_logic;
   SIGNAL upper            : std_logic;


   -- Component Declarations
   COMPONENT AND2_byte
   PORT (
      A : IN     lc3b_byte ;
      B : IN     lc3b_byte ;
      C : OUT    lc3b_byte 
   );
   END COMPONENT;
   COMPONENT NOR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
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
   COMPONENT byte_splitter
   PORT (
      intersectionMask : IN     lc3b_byte;
      A                : OUT    std_logic;
      B                : OUT    std_logic;
      C                : OUT    std_logic;
      D                : OUT    std_logic;
      E                : OUT    std_logic;
      F                : OUT    std_logic;
      G                : OUT    std_logic;
      H                : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2_byte USE ENTITY ece411.AND2_byte;
   FOR ALL : NOR2 USE ENTITY ece411.NOR2;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : OR4 USE ENTITY ece411.OR4;
   FOR ALL : byte_splitter USE ENTITY ece411.byte_splitter;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_5 : AND2_byte
      PORT MAP (
         A => maskB,
         B => maskA,
         C => intersectionMask
      );
   U_10 : NOR2
      PORT MAP (
         A => lower,
         B => upper,
         C => match_L
      );
   U_9 : OR2
      PORT MAP (
         A => lower,
         B => upper,
         C => match
      );
   U_6 : OR4
      PORT MAP (
         A => A,
         B => B,
         C => C,
         D => D,
         E => lower
      );
   U_8 : OR4
      PORT MAP (
         A => E,
         B => F,
         C => G,
         D => H,
         E => upper
      );
   U_7 : byte_splitter
      PORT MAP (
         intersectionMask => intersectionMask,
         A                => A,
         B                => B,
         C                => C,
         D                => D,
         E                => E,
         F                => F,
         G                => G,
         H                => H
      );

END struct;
