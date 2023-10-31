----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 01:40:32 AM
-- Design Name: 
-- Module Name: Adder_3bit_Sim - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder_3bit_Sim is
--  Port ( );
end Adder_3bit_Sim;

architecture Behavioral of Adder_3bit_Sim is

component Adder_3bit
    Port ( 
        A : in STD_LOGIC_VECTOR (2 downto 0);
        S : out STD_LOGIC_VECTOR (2 downto 0)
     );
end component;

signal a, s : std_logic_vector (2 downto 0);

begin
UUT : Adder_3bit
    Port Map(
              A => a,
              S => s
            );

process
begin
        a <= "000";
        wait for 100ns;

        a <= "001";
        wait for 100ns;
        
        a <= "010";
        wait for 100ns;
        
        a <= "000";
        wait for 100ns;
        
        a <= "100";
        wait for 100ns;

        a <= "101";
        wait for 100ns;

        a <= "110";
        wait for 100ns;

        a <= "111";
        wait;
end process;
end Behavioral;
