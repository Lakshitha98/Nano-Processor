----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2022 11:28:38 AM
-- Design Name: 
-- Module Name: LUT_16_7_sim - Behavioral
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

entity LUT_16_7_sim is
--  Port ( );
end LUT_16_7_sim;

architecture Behavioral of LUT_16_7_sim is

component LUT_16_7
          Port ( 
                address : in STD_LOGIC_VECTOR (3 downto 0);
                data : out STD_LOGIC_VECTOR (6 downto 0)
           );
end component;

signal address : STD_LOGIC_VECTOR (3 downto 0);
signal data : STD_LOGIC_VECTOR (6 downto 0);

begin
UUT : LUT_16_7
         Port Map (
                 address => address,
                 data => data
           );
process
  begin
       -- 0 address
       address <= "0000";
       wait for 50ns;
       -- 1 address
       address <= "0001";
       wait for 50ns;
       -- 2 address
       address <= "0010";
       wait for 50ns;
       -- 3 address
       address <= "0011";
       wait for 50ns;
       -- 4 address
       address <= "0100";
       wait for 50ns;
       -- 5 address
       address <= "0101";
       wait for 50ns;
       -- 6 address
       address <= "0110";
       wait for 50ns;
       -- 7 address
       address <= "0111";
       wait for 50ns;
       -- 8 address
       address <= "1000";
       wait for 50ns;
       -- 9 address
       address <= "1001";
       wait for 50ns;
       -- 10 address
       address <= "1010";
       wait for 50ns;
       -- 11 address
       address <= "1011";
       wait for 50ns;
       -- 12 address
       address <= "1100";
       wait for 50ns;
       -- 13 address
       address <= "1101";
       wait for 50ns;
       -- 14 address
       address <= "1110";
       wait for 50ns;
       -- 15 address
       address <= "1111";
       wait;
end process;

end Behavioral;
