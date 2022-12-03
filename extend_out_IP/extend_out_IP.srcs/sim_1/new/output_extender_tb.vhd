----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2021 04:22:05 PM
-- Design Name: 
-- Module Name: output_extender_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity output_extender_tb is
end;

architecture bench of output_extender_tb is

  component output_extender
      Port ( ADD_SUB_in : in signed(4 downto 0);
             MULT_in : in signed(7 downto 0);
             Sel : in STD_LOGIC_VECTOR (2 downto 0);
             Y : out signed(7 downto 0));
  end component;

  signal ADD_SUB_in: signed(4 downto 0);
  signal MULT_in: signed(7 downto 0);
  signal Sel: STD_LOGIC_VECTOR (2 downto 0);
  signal Y: signed(7 downto 0);

begin

  uut: output_extender port map ( ADD_SUB_in => ADD_SUB_in,
                                  MULT_in    => MULT_in,
                                  Sel        => Sel,
                                  Y          => Y );

  stimulus: process
  begin
  
    -- Put initialisation code here
    ADD_SUB_in <= "1100";
    MULT_in <= "00101010";
    Sel <= "101";
    
    wait for 50ns;
    
    ADD_SUB_in <= "1100";
    MULT_in <= "00101010";
    Sel <= "100";
    
    wait for 50ns;
    
    ADD_SUB_in <= "1100";
    MULT_in <= "00101010";
    Sel <= "010";

    -- Put test bench stimulus code here

    wait;
  end process;


end;