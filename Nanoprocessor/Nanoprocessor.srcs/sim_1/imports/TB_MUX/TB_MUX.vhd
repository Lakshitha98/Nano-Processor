----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.07.2022 13:22:22
-- Design Name: 
-- Module Name: TB_MUX - Behavioral
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

entity TB_MUX is
--  Port ( );
end TB_MUX;

architecture Behavioral of TB_MUX is

COMPONENT MUX_8_1_4bit
Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel: in STD_LOGIC_VECTOR (2 downto 0);
           Y_out : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

SIGNAL I_0,I_1,I_2,I_3,I_4,I_5,I_6,I_7,Y_O:STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Reg_Sel:STD_LOGIC_VECTOR (2 downto 0);

begin

uut:MUX_8_1_4bit
port map(
           I0 => I_0,
           I1 => I_1,
           I2 => I_2,
           I3 => I_3,
           I4 => I_4,
           I5 => I_5,
           I6 => I_6,
           I7 => I_7,
           Reg_Sel=>Reg_Sel,
           Y_out => Y_O
);

process
begin

I_0<="0000";
I_1<="0001";
I_2<="0010";
I_3<="0011";
I_4<="0100";
I_5<="0101";
I_6<="0110";
I_7<="0111";

Reg_Sel<="110";
wait for 200ns;

Reg_Sel<="001";
wait for 200ns;

Reg_Sel<="010";
wait for 200ns;

Reg_Sel<="011";
wait for 200ns;

Reg_Sel<="100";
wait for 200ns;

end process;

end Behavioral;
