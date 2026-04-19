library IEEE;
use IEEE.std_logic_1164.all;

entity halfadd is
port (A, B: in std_logic;
    Sum, Carry: out std_logic);
end halfadd;

architecture comp of halfadd is
begin
    Sum <= A xor B;
    Carry <= A and B;
end comp;