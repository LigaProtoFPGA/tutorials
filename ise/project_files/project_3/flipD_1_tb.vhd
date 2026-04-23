LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY flipD_1_tb IS
END flipD_1_tb;
 
ARCHITECTURE flipD_3_tb OF flipD_1_tb IS 

   --Inputs
   signal D : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Pre_n : std_logic := '0';
   signal Clr_n : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Q_n : std_logic;

BEGIN

   uut: entity work.flipD_1 PORT MAP (
          D => D,
          Clk => Clk,
          Pre_n => Pre_n,
          Clr_n => Clr_n,
          Q => Q,
          Q_n => Q_n
        );
	
	Pre_n <= '1', '0' after 20 ns, '1' after 30ns;
	Clr_n <= '0', '1' after 10 ns;
	
	clk <= not clk after 5ns;
	D <= '0', '1' after 50 ns, '0' after 62 ns;

END;
