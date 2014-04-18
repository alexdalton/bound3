--
-- VHDL Architecture ece411.byte_splitter.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-12.ews.illinois.edu)
--          at - 17:22:45 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY byte_splitter IS
   PORT( 
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

-- Declarations

END byte_splitter ;

--
ARCHITECTURE untitled OF byte_splitter IS
BEGIN
  A <= intersectionMask(0);
  B <= intersectionMask(1);
  C <= intersectionMask(2);
  D <= intersectionMask(3);
  E <= intersectionMask(4);
  F <= intersectionMask(5);
  G <= intersectionMask(6);
  H <= intersectionMask(7);  
END ARCHITECTURE untitled;

