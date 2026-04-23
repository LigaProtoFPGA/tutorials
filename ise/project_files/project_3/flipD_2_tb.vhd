LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY flipD_2_tb IS
END flipD_2_tb;
 
ARCHITECTURE flipD_2_tb OF flipD_2_tb IS 

    COMPONENT flipD_1
    PORT(
         D : IN  std_logic;
         Clk : IN  std_logic;
         Pre_n : IN  std_logic;
         Clr_n : IN  std_logic;
         Q : OUT  std_logic;
         Q_n : OUT  std_logic
        );
    END COMPONENT;
	 
	--Inputs
	signal D : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Pre_n : std_logic := '1';
   signal Clr_n : std_logic := '1';

 	--Outputs
   signal Q : std_logic;
   signal Q_n : std_logic;
 
BEGIN

   uut: flipD_1 PORT MAP (
          D => D,
          Clk => Clk,
          Pre_n => Pre_n,
          Clr_n => Clr_n,
          Q => Q,
          Q_n => Q_n
        );

   Clk_process: process
   begin
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
   end process;

	Pre_n <= '0' after 10 ns, '1' after 20 ns;
	Clr_n <= '0' after 30 ns, '1' after 40 ns;
		
	D <= '0', '1' after 50 ns, '0' after 90 ns;

END;
