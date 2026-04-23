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

architecture flipD_1 of flipD_1 is
 signal fio1, fio2, fio3, fio4, fio5, fio6: std_logic;

begin
	fio1 <= not(fio2 and Clr_n and D);
	fio2 <= not(fio3 and Clk and fio1);
	fio3 <= not(fio4 and Clr_n and Clk);
	fio4 <= not(Pre_n and fio1 and fio3);
	
	fio6 <= not(Pre_n and fio3 and fio5);
	fio5 <= not(fio6 and Clr_n and fio2);
	
	Q <= fio6;
	Q_n <= fio5;
end flipD_1;
