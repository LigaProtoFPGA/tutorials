library IEEE;
use IEEE.std_logic_1164.all;

entity halfadd_tb is
end halfadd_tb;

architecture TB_ARCHITECTURE of halfadd_tb is
    signal aa, bb, soma, vaium : std_logic;
begin
    UUT : entity work.halfadd
        port map ( A => aa, B => bb,
                Sum => soma, Carry => vaium );
    aa <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
    bb <= '0', '1' after 20 ns;
end TB_ARCHITECTURE;