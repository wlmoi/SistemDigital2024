library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;

ENTITY modul2vhdl IS 
	PORT( A,B,Cin : IN std_logic;
		  S,Cout  : OUT std_logic);
END modul2vhdl;

ARCHITECTURE behavioral OF modul2vhdl IS 
BEGIN
	S <= A XOR B XOR Cin;
	Cout <= (Cin AND (A XOR B)) OR (A AND B);
END behavioral;