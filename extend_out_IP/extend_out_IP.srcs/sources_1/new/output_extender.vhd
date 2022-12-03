----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2021 01:55:44 PM
-- Design Name: 
-- Module Name: output_extender - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity output_extender is
    Port ( ADD_SUB_in : in signed(4 downto 0);
           MULT_in : in signed(7 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out signed(7 downto 0));
end output_extender;

architecture Behavioral of output_extender is

begin

process(ADD_SUB_in, MULT_in, temp_in1, temp_in2, Sel, Y) is
begin
-- Temporary locations to store the extended ADD/SUB output and Multiplier output
    temp_in1(7 downto 0) <= ("00000000" + ADD_SUB_in);
    temp_in2(7 downto 0) <= ('0' & MULT_in);

    case Sel is
    
    --Add
    when "101" =>
    Y <= temp_in1;
    --Sub
    when "100" =>
    Y <= temp_in1;
    --Multiply
    when "010" =>
    Y <= temp_in2;
    
    when others =>
    Y <= NULL;
    end case;
    
end process;

end Behavioral;
