library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity adder4 is
port (A, B: in std_logic_vector(3 downto 0);
    Sum: out std_logic_vector(3 downto 0));
end adder4;

architecture comp of adder4 is
begin
    sum <= a + b;
end comp;