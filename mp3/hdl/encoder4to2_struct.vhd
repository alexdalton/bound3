-- VHDL Entity ece411.Encoder4to2.symbol
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 01:45:53 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Encoder4to2 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : IN     std_logic;
      D : IN     std_logic;
      F : OUT    std_logic_vector (1 DOWNTO 0)
   );

-- Declarations

END Encoder4to2 ;

--
-- VHDL Architecture ece411.Encoder4to2.struct
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 01:45:53 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Encoder4to2 IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : OR2
      PORT MAP (
         A => B,
         B => D,
         C => F(0)
      );
   U_1 : OR2
      PORT MAP (
         A => C,
         B => D,
         C => F(1)
      );

END struct;
