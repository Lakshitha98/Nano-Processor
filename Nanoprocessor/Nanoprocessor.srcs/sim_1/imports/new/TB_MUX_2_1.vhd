----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.07.2022 14:08:42
-- Design Name: 
-- Module Name: TB_MUX_2_1 - Behavioral
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

entity TB_MUX_2_1 is
--  Port ( );
end TB_MUX_2_1;

architecture Behavioral of TB_MUX_2_1 is

COMPONENT MUX_2_1_3bit
 Port ( I1 : in STD_LOGIC_VECTOR (2 downto 0);
          I2 : in STD_LOGIC_VECTOR (2 downto 0);
          C_in : in STD_LOGIC;
          Y_out : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;

SIGNAL I_0,I_1,Y_O:STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Reg_Sel:STD_LOGIC;

begin

UUT:MUX_2_1_3bit 
PORT MAP(
        I1 => I_0,
           I2 => I_1,
           C_in => Reg_Sel,
           Y_out => Y_O
);

PROCESS BEGIN

I_0<="011";
I_1<="101";

Reg_Sel<='0';
wait for 200ns;

Reg_Sel<='1';
wait for 200ns;

end PROCESS;
end Behavioral;
