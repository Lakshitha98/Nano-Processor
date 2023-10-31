----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2022 10:31:48 AM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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
use ieee.numeric_std.all;

entity LUT_8_12 is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end LUT_8_12;

architecture Behavioral of LUT_8_12 is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
 signal sevenSegment_ROM : rom_type := (
                                          "100010000001", -- 0
                                          "100100000010", -- 1
                                          "100110000011", -- 2
                                          "000010100000", -- 3
                                          "000010110000", -- 4
                                          "000000000000", -- 5
                                          "000000000000", -- 6
                                          "000000000000"  -- 7
                                  );

begin

data <= sevenSegment_ROM(to_integer(unsigned(address)));


end Behavioral;
