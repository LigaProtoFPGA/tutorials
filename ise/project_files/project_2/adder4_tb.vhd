library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity adder4_tb is
end adder4_tb;

architecture TB_ARCHITECTURE of adder4_tb is
    signal aa, bb, sum: std_logic_vector(3 downto 0);
begin
    UUT : entity work.adder4
        port map ( A => aa, B => bb,
                Sum => sum);
	aa <= x"9", x"5" after 10 ns, x"A" after 20 ns, x"B" after 30 ns;
	bb <= x"8", x"3" after 20 ns;
end TB_ARCHITECTURE;