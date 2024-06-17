LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY tb_bcd IS 
END tb_bcd;

ARCHITECTURE testbench OF tb_bcd IS 

COMPONENT bcd IS 
	PORT( SW   : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
          HEX1 : OUT STD_LOGIC_VECTOR (1 TO 7));
END COMPONENT;

SIGNAL clk  : STD_LOGIC := '0';
SIGNAL SW   : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
SIGNAL HEX1 : STD_LOGIC_VECTOR (1 TO 7);

BEGIN

dut : bcd 
   PORT MAP (
   SW    => SW    ,
   HEX1  => HEX1 );

clock : PROCESS
   BEGIN
   WAIT FOR 50 ps; clk  <= not clk;
end PROCESS clock;

increment: PROCESS (clk)
BEGIN
IF (clk'EVENT AND clk = '1') THEN
  SW <= SW + "0001";
END IF;
END PROCESS;
   
END testbench;