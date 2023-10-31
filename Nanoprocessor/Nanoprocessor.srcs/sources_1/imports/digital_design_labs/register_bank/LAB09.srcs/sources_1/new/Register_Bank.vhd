----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 07:18:56 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( Mux : in STD_LOGIC_VECTOR (3 downto 0);
            Clk : in std_logic;
            Reg_out_0 : out std_logic_vector(3 downto 0);
            Reg_out_1 : out std_logic_vector(3 downto 0);
            Reg_out_2 : out std_logic_vector(3 downto 0);
            Reg_out_3 : out std_logic_vector(3 downto 0);
            Reg_out_4 : out std_logic_vector(3 downto 0);
            Reg_out_5 : out std_logic_vector(3 downto 0);
            Reg_out_6 : out std_logic_vector(3 downto 0);
            Reg_out_7 : out std_logic_vector(3 downto 0);
            Input : in std_logic_vector( 2 downto 0);
            En : in std_logic);
end Register_Bank;
architecture Behavioral of Register_Bank is
component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
       En : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
            Clk_out : out STD_LOGIC);
end component;
component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal slow_clock: std_logic;
signal En_0, En_1,En_2,EN_3,En_4,En_5,En_6,En_7: std_logic;
signal D,Q_0,Q_1,Q_2,Q_3,Q_4,Q_5,Q_6,Q_7: std_logic_vector(3 downto 0);
--signal i: std_logic_vector(2 downto 0);
signal y:std_logic_vector(7 downto 0);

begin
slow_clk_0: Slow_Clk
    PORT MAP(
    Clk_in=> Clk,
    Clk_out=>slow_clock
    );
Decoder_3_to_8_0: Decoder_3_to_8
            Port map(
            I=>Input,
            En=>En,
            Y=> y
            );
Reg_0: Reg
        PORT MAP(
        D=>MUX,
        En=> En_0,
        Clk =>slow_clock,
        Q=>Reg_out_0
        );

Reg_1: Reg
    PORT MAP(
    D=>MUX,
    En=> En_1,
    Clk =>slow_clock,
    Q=>Reg_out_1
    );
Reg_2: Reg
        PORT MAP(
        D=>MUX,
        En=> En_2,
        Clk =>slow_clock,
        Q=>Reg_out_2
        );
Reg_3: Reg
        PORT MAP(
        D=>MUX,
        En=> En_3,
        Clk =>slow_clock,
        Q=>Reg_out_3
        );
Reg_4: Reg
        PORT MAP(
        D=>MUX,
        En=> En_4,
        Clk =>slow_clock,
        Q=>Reg_out_4
        );
Reg_5: Reg
        PORT MAP(
        D=>MUX,
        En=> En_5,
        Clk =>slow_clock,
        Q=>Reg_out_5
        );
Reg_6: Reg
         PORT MAP(
            D=>MUX,
            En=> En_6,
            Clk =>slow_clock,
            Q=>Reg_out_6
            );
Reg_7: Reg
        PORT MAP(
        D=>MUX,
        En=> En_7,
        Clk =>slow_clock,
        Q=>Reg_out_7
        );
En_0 <=Y(0);
En_1 <=Y(1);
En_2 <=Y(2);
En_3 <=Y(3);
En_4 <=Y(4);
En_5 <=Y(5);
En_6 <=Y(6);
En_7 <=Y(7);

end Behavioral;
