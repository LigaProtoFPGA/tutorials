library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flip_D_tb is
end flip_D_tb;

architecture flip_D_tb of flip_D_tb is
    signal D, Clk: std_logic := '0';
	 signal Pre_n, Clr_n: std_logic := '1';
	 
    -- Direct logic (type 1)
    signal q1, qn1 : std_logic;
    
    -- NAND 3 (type 2)
    signal q2, qn2 : std_logic;
    
    -- Latch (type 3)
    signal q3, qn3 : std_logic;
begin

    -- type 1
    UUT1: entity work.flipD_1(flipD_1)
        port map (
				D => D, 
				Clk => Clk, 
				Pre_n => Pre_n,
				Clr_n => Clr_n,
				Q => q1, 
				Q_n => qn1
			);

    -- type 2
    UUT2: entity work.flipD_1(flipD_2)
        port map (
				D => D, 
				Clk => Clk,
				Pre_n => Pre_n, 
				Clr_n => Clr_n, 
				Q => q2,
				Q_n => qn2
		  );

    -- type 3
    UUT3: entity work.flipD_1(flipD_3)
        port map (
				D => D,
				Clk => Clk,
				Pre_n => Pre_n,
				Clr_n => Clr_n,
				Q => q3,
				Q_n => qn3
			);
		
	Clk <=  '1' after 5 ns,  '0' after 10 ns, 
           '1' after 15 ns, '0' after 20 ns, 
           '1' after 25 ns, '0' after 30 ns,
           '1' after 35 ns, '0' after 40 ns,
           '1' after 45 ns, '0' after 50 ns;
	
	Pre_n <= '0' after 10 ns, '1' after 20 ns;
	Clr_n <= '0' after 20 ns, '1' after 30 ns;
end architecture;