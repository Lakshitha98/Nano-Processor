----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.07.2022 12:49:19
-- Design Name: 
-- Module Name: MUX_8_1_4bit - Behavioral
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

entity MUX_8_1_4bit is
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
end MUX_8_1_4bit;

architecture Behavioral of MUX_8_1_4bit is

component Decoder_3_to_8
Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

SIGNAL S0,S1,S2,S3,S4,S5,S6,S7:STD_LOGIC_VECTOR (3 downto 0):="0000";
SIGNAL I:STD_LOGIC_VECTOR (2 downto 0);
SIGNAL SY:STD_LOGIC_VECTOR (7 downto 0);

begin

Decoder_3_to_8_0:Decoder_3_to_8
PORT MAP(
I=>Reg_Sel,
Y=>SY,
EN=>'1'
);


Y_out(0)<=((I0(0) AND SY(0)) OR (I1(0) AND SY(1)) OR (I2(0) AND SY(2)) OR (I3(0) AND SY(3)) OR (I4(0) AND SY(4))
 OR (I5(0) AND SY(5)) OR (I6(0) AND SY(6)) OR (I7(0) AND SY(7)));
 
Y_out(1)<=((I0(1) AND SY(0)) OR (I1(1) AND SY(1)) OR (I2(1) AND SY(2)) OR (I3(1) AND SY(3)) OR (I4(1) AND SY(4))
  OR (I5(1) AND SY(5)) OR (I6(1) AND SY(6)) OR (I7(1) AND SY(7)));
  
Y_out(2)<=((I0(2) AND SY(0)) OR (I1(2) AND SY(1)) OR (I2(2) AND SY(2)) OR (I3(2) AND SY(3)) OR (I4(2) AND SY(4))
   OR (I5(2) AND SY(5)) OR (I6(2) AND SY(6)) OR (I7(2) AND SY(7)));
   
Y_out(3)<=((I0(3) AND SY(0)) OR (I1(3) AND SY(1)) OR (I2(3) AND SY(2)) OR (I3(3) AND SY(3)) OR (I4(3) AND SY(4))
    OR (I5(3) AND SY(5)) OR (I6(3) AND SY(6)) OR (I7(3) AND SY(7)));

end Behavioral;
