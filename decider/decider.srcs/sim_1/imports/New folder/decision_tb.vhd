----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2021 02:41:07 PM
-- Design Name: 
-- Module Name: decision_tb - Behavioral
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


entity decision_tb is
end;

architecture bench of decision_tb is

  component decision
      Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
             A: in signed(3 downto 0);
             B: in signed(3 downto 0);
             A_OUT_ADD : out signed(3 downto 0);
             B_OUT_ADD : out signed(3 downto 0);
             A_OUT_MUL : out signed(3 downto 0);
             B_OUT_MUL : out signed(3 downto 0);
             ADD_SUB : out STD_LOGIC);
  end component;

  signal S: STD_LOGIC_VECTOR (2 downto 0);
  signal A: signed(3 downto 0);
  signal B: signed(3 downto 0);
  signal A_OUT_ADD: signed(3 downto 0);
  signal B_OUT_ADD: signed(3 downto 0);
  signal A_OUT_MUL: signed(3 downto 0);
  signal B_OUT_MUL: signed(3 downto 0);
  signal ADD_SUB: STD_LOGIC;

begin

  uut: decision port map ( S         => S,
                           A         => A,
                           B         => B,
                           A_OUT_ADD => A_OUT_ADD,
                           B_OUT_ADD => B_OUT_ADD,
                           A_OUT_MUL => A_OUT_MUL,
                           B_OUT_MUL => B_OUT_MUL,
                           ADD_SUB   => ADD_SUB );

  stimulus: process
  begin
  
    -- Put test bench stimulus code here
    S <= "101";
    A <= "0011";
    B <= "0100";
    
    wait for 50ns;
    
    S <= "100";
    A <= "0011";
    B <= "0100";
    
    wait for 50ns;
    
    S <= "010";
    A <= "0011";
    B <= "0100";

    wait;
  end process;

end;
