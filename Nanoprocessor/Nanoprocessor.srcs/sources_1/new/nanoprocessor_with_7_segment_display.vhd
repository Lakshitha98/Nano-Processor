----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/19/2022 03:54:52 PM
-- Design Name: 
-- Module Name: nanoprocessor_with_7_segment_display - Behavioral
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

entity nanoprocessor_with_7_segment_display is
    Port ( 
             Reset : in STD_LOGIC;
             Clock : in STD_LOGIC;
             S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
             S_LED : out STD_LOGIC_VECTOR (3 downto 0);
             Zero : out STD_LOGIC;
             Carry : out STD_LOGIC;
             Anode : out STD_LOGIC_VECTOR (3 downto 0)
   );
end nanoprocessor_with_7_segment_display;
architecture Behavioral of nanoprocessor_with_7_segment_display is
component Nanoprocessor_Group_11
    Port ( 
           Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Over1 : out STD_LOGIC;
           Zero1 : out STD_LOGIC;
           Registr : out STD_LOGIC_VECTOR (3 downto 0)
        );  
end component;
component LUT_16_7
    Port ( 
           address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0)
        );
end component;

signal s : STD_LOGIC_VECTOR (3 downto 0);
signal s_7_seg : STD_LOGIC_VECTOR (6 downto 0);

begin

nanoprocessor : Nanoprocessor_Group_11
   Port Map (
              Reset => Reset,
              Clock => Clock,
              Registr => s,
              Zero1 => Zero,
              Over1 => Carry
   );
   
LUT_16_7_A : LUT_16_7
   Port Map (
              address => s,
              data => s_7_seg
   );
S_7Seg <= s_7_seg;
S_LED <= s;
Anode <= "1110";
end Behavioral;
