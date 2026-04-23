library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch4i is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in STD_LOGIC;
			  q : out STD_LOGIC;
			  q_n : out STD_LOGIC);
end latch4i;

architecture latch4i of latch4i is 
 signal fio1, fio2, fio3, fio4, fio5, fio6: std_logic;
begin
	nand_up : fio1<=not(a and b and fio2);
	nand_down : fio2<=not(fio1 and c and D);
	
Q <= fio1;
Q_n <= fio2;
end latch4i;

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

architecture flipD_3 of flipD_1 is
 signal fio1, fio2, fio3, fio4, fio5, fio6: std_logic;
begin
	latch1: entity work.latch4i port map (a=>Pre_n, b=>fio4, c=>Clr_n, d=>clk, q=>open, q_n=>fio2);
	latch2: entity work.latch4i port map (a=>fio2, b=>clk, c=>Clr_n, d=>D, q=>fio3, q_n=>fio4);
	latch3: entity work.latch4i port map (a=>Pre_n, b=>fio2, c=>Clr_n, d=>fio3, q=>fio5, q_n=>fio6);
	Q <= fio5;
	Q_n <= fio6;
end flipD_3;