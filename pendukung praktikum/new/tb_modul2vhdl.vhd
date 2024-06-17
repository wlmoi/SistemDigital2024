ENTITY tb_modul2vhdl IS 
END tb_modul2vhdl;

ARCHITECTURE testbench OF tb_modul2vhdl IS 

COMPONENT modul2vhdl IS 
	PORT( A,B,Cin : IN BIT;
		  S,Cout  : OUT BIT);
END COMPONENT;

SIGNAL A    : BIT := '0';
SIGNAL B    : BIT := '0';
SIGNAL Cin  : BIT := '0';
SIGNAL S    : BIT;
SIGNAL Cout : BIT;

BEGIN

dut : modul2vhdl 
   PORT MAP (
   A    => A    ,
   B    => B    ,
   Cin  => Cin  ,
   S    => S    ,
   Cout => Cout );

-- clock_A : PROCESS
   -- BEGIN
   -- WAIT FOR 50 ps; A  <= not A;
-- end PROCESS clock_A;

-- clock_B : PROCESS
   -- BEGIN
   -- WAIT FOR 100 ps; B  <= not B;
-- end PROCESS clock_B;   

-- clock_Cin : PROCESS
   -- BEGIN
   -- WAIT FOR 200 ps; Cin  <= not Cin;
-- end PROCESS clock_Cin;      

stimulus : PROCESS
   BEGIN
   WAIT FOR 50  ps; A    <= '1';
   WAIT FOR 100 ps; B    <= '1';
   WAIT FOR 200 ps; Cin  <= '1';
   WAIT;
END PROCESS stimulus;

   
END testbench;