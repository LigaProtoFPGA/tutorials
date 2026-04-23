library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand3i is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC);
end nand3i;

architecture nand3i of nand3i is
 signal fio1, fio2, fio3, fio4, fio5, fio6: std_logic;
begin
	S <= not(a and b and c);
end nand3i;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipD_1 is
    Port ( D : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Pre_n : in  STD_LOGIC;
           Clr_n : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Q_n : out  STD_LOGIC);
end flipD_1;

architecture flipD_2 of flipD_1 is
 signal fio1, fio2, fio3, fio4, fio5, fio6: std_logic;
begin
	porta1: entity work.nand3i port map ( a=>Pre_n, b=>fio4, c=>fio2, s=>fio1);
	porta2: entity work.nand3i port map ( a=>fio1, b=>Clr_n, c=>clk, s=>fio2);
	porta3: entity work.nand3i port map ( a=>fio2, b=>clk, c=>fio4, s=>fio3);
	porta4: entity work.nand3i port map ( a=>fio3, b=>Clr_n, c=>D, s=>fio4);
	porta5: entity work.nand3i port map ( a=>Pre_n, b=>fio2, c=>fio6, s=>fio5);
	porta6: entity work.nand3i port map ( a=>fio5, b=>Clr_n, c=>fio3, s=>fio6);
	 
	Q <= fio5;
	Q_n <= fio6;
end flipD_2;