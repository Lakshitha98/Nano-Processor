----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 11:59:34 PM
-- Design Name: 
-- Module Name: ADD_SUB_4bit - Behavioral
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

entity ADD_SUB_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Over : out STD_LOGIC;
           Zero : out STD_LOGIC);
end ADD_SUB_4bit;

architecture Behavioral of ADD_SUB_4bit is
component RCA_4
    Port ( A0 : in STD_LOGIC;
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       A3 : in STD_LOGIC;
       B0 : in STD_LOGIC;
       B1 : in STD_LOGIC;
       B2 : in STD_LOGIC;
       B3 : in STD_LOGIC;
       C_in : in STD_LOGIC;
       S0 : out STD_LOGIC;
       S1 : out STD_LOGIC;
       S2 : out STD_LOGIC;
       S3 : out STD_LOGIC;
       C_out : out STD_LOGIC);
end component;
signal aa, bb, ss : std_logic_vector (3 downto 0);
signal ccin, ccout : std_logic;
begin
  RCA_4_0_0 : RCA_4
    port map ( 
              A0 => aa(0),
              A1 => aa(1),
              A2 => aa(2),
              A3 => aa(3), 
              B0 => bb(0),
              B1 => bb(1),
              B2 => bb(2),
              B3 => bb(3), 
              C_in => ccin,
              S0 => ss(0),
              S1 => ss(1),
              S2 => ss(2),
              S3 => ss(3),
              C_out => ccout
             ); 

aa <= A;
bb(0) <= B(0) XOR Add_Sub;
bb(1) <= B(1) XOR Add_Sub;
bb(2) <= B(2) XOR Add_Sub;
bb(3) <= B(3) XOR Add_Sub;
ccin <= Add_Sub;
S <= ss;
Over <= ccout AND NOT(Add_Sub);
Zero <= NOT ( ss(0) OR ss(1) OR ss(2) OR ss(3) );

end Behavioral;
