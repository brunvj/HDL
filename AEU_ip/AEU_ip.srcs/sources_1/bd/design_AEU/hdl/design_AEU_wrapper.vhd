--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
--Date        : Thu Mar 04 13:58:24 2021
--Host        : VinnysPC running 64-bit major release  (build 9200)
--Command     : generate_target design_AEU_wrapper.bd
--Design      : design_AEU_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_AEU_wrapper is
end design_AEU_wrapper;

architecture STRUCTURE of design_AEU_wrapper is
  component design_AEU is
  end component design_AEU;
begin
design_AEU_i: component design_AEU
     port map (
      
    );
end STRUCTURE;
