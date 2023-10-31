----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 02:46:12 PM
-- Design Name: 
-- Module Name: Nanoprocessor_Group_11 - Behavioral
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

entity Nanoprocessor_Group_11 is
    Port ( Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Over1 : out STD_LOGIC;
           Zero1 : out STD_LOGIC;
           Registr : out STD_LOGIC_VECTOR (3 downto 0));
end Nanoprocessor_Group_11;

architecture Behavioral of Nanoprocessor_Group_11 is
component Register_Bank
   Port ( 
            Mux : in STD_LOGIC_VECTOR (3 downto 0);
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
            En : in std_logic
        );
end component;
component Counter
    Port ( 
           Dir : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0)
        );
end component;
component Adder_3bit
    Port ( 
            A : in STD_LOGIC_VECTOR (2 downto 0);
            S : out STD_LOGIC_VECTOR (2 downto 0)
        );
end component;
component ADD_SUB_4bit
    Port ( 
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Add_Sub : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR (3 downto 0);
            Over : out STD_LOGIC;
            Zero : out STD_LOGIC
       );
end component;
component ID
    Port ( 
            I : in STD_LOGIC_VECTOR (11 downto 0);
            J : in STD_LOGIC_VECTOR (3 downto 0);
            Reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
            Reg_sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
            Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
            Load_select : out STD_LOGIC;
            Add_Sub : out STD_LOGIC;
            Im_value : out STD_LOGIC_VECTOR (3 downto 0);
            Jump_flag : out STD_LOGIC;
            Jump_address : out STD_LOGIC_VECTOR (2 downto 0)
        );
end component;
component Mux_2_1_3bit
    Port ( 
            I1 : in STD_LOGIC_VECTOR (2 downto 0);
            I2 : in STD_LOGIC_VECTOR (2 downto 0);
            C_in : in STD_LOGIC;
            Y_out : out STD_LOGIC_VECTOR (2 downto 0)
        );
end component;
component Mux_2_1_4bit
    Port ( 
            I1 : in STD_LOGIC_VECTOR (3 downto 0);
            I2 : in STD_LOGIC_VECTOR (3 downto 0);
            C_in : in STD_LOGIC;
            Y_out : out STD_LOGIC_VECTOR (3 downto 0)
        );
end component;
component Mux_8_1_4bit
    Port ( 
            I0 : in STD_LOGIC_VECTOR (3 downto 0);
            I1 : in STD_LOGIC_VECTOR (3 downto 0);
            I2 : in STD_LOGIC_VECTOR (3 downto 0);
            I3 : in STD_LOGIC_VECTOR (3 downto 0);
            I4 : in STD_LOGIC_VECTOR (3 downto 0);
            I5 : in STD_LOGIC_VECTOR (3 downto 0);
            I6 : in STD_LOGIC_VECTOR (3 downto 0);
            I7 : in STD_LOGIC_VECTOR (3 downto 0);
            Reg_Sel: in STD_LOGIC_VECTOR (2 downto 0);
            Y_out : out STD_LOGIC_VECTOR (3 downto 0)
       );
end component;
component LUT_8_12
    Port ( 
            address : in STD_LOGIC_VECTOR (2 downto 0);
            data : out STD_LOGIC_VECTOR (11 downto 0)
       );
end component;
signal register0, register1, register2, register3, register4, register5, register6, register7, immediate_vale, check_jump, au_a, au_b, au_out, register_in : STD_LOGIC_VECTOR (3 downto 0);
signal register_enable, register_select0, register_select1, jump_address, adder3bit, res_or_counter_in, counter_in, counter_out : STD_LOGIC_VECTOR (2 downto 0);
signal instruction_bus : STD_LOGIC_VECTOR (11 downto 0);
signal load_select, over_flow, zero, jump_flag, add_sub_select, clk, res, en : STD_LOGIC;

begin
Register_Bank_0 : Register_Bank
   port map(
            Mux => register_in,
            Clk => clk,
            Reg_out_0 => register0,
            Reg_out_1 => register1,
            Reg_out_2 => register2,
            Reg_out_3 => register3,
            Reg_out_4 => register4,
            Reg_out_5 => register5,
            Reg_out_6 => register6,
            Reg_out_7 => register7,
            Input => register_enable,
            En => en          
   );
Counter_0 : Counter
   port map(
            Dir => counter_in,
            Res => res,
            Clk => clk,
            Q => counter_out             
   );
Adder_3bit_0 : Adder_3bit
   port map(
            A => counter_out,
            S => adder3bit         
   );
ADD_SUB_4bi_0 : ADD_SUB_4bit
   port map(
            A => au_a,
            B => au_b,
            Add_Sub => add_sub_select,
            S => au_out,
            Over => over_flow,
            Zero => zero          
   );
Instruction_Decorder : ID
   port map(
            I => instruction_bus,
            J => au_a,                    --- au_a or au_b
            Reg_sel_1 => register_select0,
            Reg_sel_2 => register_select1,
            Reg_EN => register_enable,
            Load_select => load_select,
            Add_Sub => add_sub_select,
            Im_value => immediate_vale,
            Jump_flag => jump_flag,
            Jump_address => jump_address           
  );
Mux_2_1_3bit_0 : Mux_2_1_3bit
   port map(
            I1 => adder3bit,
            I2 => jump_address,
            C_in => jump_flag,
            Y_out => res_or_counter_in         
   );
Mux_2_1_3bit_1 : Mux_2_1_3bit
      port map(
               I1 => res_or_counter_in,
               I2 => "000",
               C_in => res,
               Y_out => counter_in         
      );
Mux_2_1_4bit_0 : Mux_2_1_4bit
   port map(
            I1 => immediate_vale,
            I2 => au_out,
            C_in => load_select,
            Y_out => register_in          
   );
Mux_8_1_4bit_0 : Mux_8_1_4bit
   port map(
            I0 => register0,
            I1 => register1,
            I2 => register2,
            I3 => register3,
            I4 => register4,
            I5 => register5,
            I6 => register6,
            I7 => register7,
            Reg_Sel => register_select0,
            Y_out => au_a          
   );
Mux_8_1_4bit_1 : Mux_8_1_4bit
   port map(
            I0 => register0,
            I1 => register1,
            I2 => register2,
            I3 => register3,
            I4 => register4,
            I5 => register5,
            I6 => register6,
            I7 => register7,
            Reg_Sel => register_select1,
            Y_out => au_b          
   );
Programe_Rom : LUT_8_12
   port map(
            address => counter_out,
            data => instruction_bus         
   );

clk <= Clock;
res <= Reset;
en <= '1';
Over1 <= over_flow;
Zero1 <= zero;
Registr <= register1;
end Behavioral;
