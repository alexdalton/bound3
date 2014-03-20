-- VHDL Entity ece411.aMP3ALU.generatedInstance
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 17:02:27 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY aMP3ALU IS
   PORT( 
      ALUop    : IN     lc3b_aluop;
      ALUout   : OUT    lc3b_word;
      regA2out : IN     lc3b_word;
      sourceB  : IN     lc3b_word
   );

END aMP3ALU ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF aMP3ALU IS 
BEGIN


END generatedInstance;
