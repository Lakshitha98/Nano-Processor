----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.07.2022 13:19:41
-- Design Name: 
-- Module Name: MUX_2_1_3bit - Behavioral
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

entity MUX_2_1_3bit is
    Port ( I1 : in STD_LOGIC_VECTOR (2 downto 0);
           I2 : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           Y_out : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_1_3bit;

architecture Behavioral of MUX_2_1_3bit is

COMPONENT Decoder_1_to_2
Port ( C : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (1 downto 0));
end COMPONENT;

SIGNAL Y:STD_LOGIC_VECTOR (1 downto 0);

begin

Decoder_1_to_2_0:Decoder_1_to_2
PORT MAP(
        C => C_in,
        Y=>Y
);

Y_out(0)<= (I1(0) AND Y(0)) OR (I2(0) AND Y(1));
Y_out(1)<= (I1(1) AND Y(0)) OR (I2(1) AND Y(1));
Y_out(2)<= (I1(2) AND Y(0)) OR (I2(2) AND Y(1));

end Behavioral;
