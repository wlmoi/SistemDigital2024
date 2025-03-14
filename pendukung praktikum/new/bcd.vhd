LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY bcd IS PORT (
  SW   : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
  HEX1 : OUT STD_LOGIC_VECTOR (1 TO 7));
END bcd;

ARCHITECTURE behavioral OF bcd IS

CONSTANT NOL     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
CONSTANT SATU    : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
CONSTANT DUA     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
CONSTANT TIGA    : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0011";
CONSTANT EMPAT   : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
CONSTANT LIMA    : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0101";
CONSTANT ENAM    : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0110";
CONSTANT TUJUH   : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0111";
CONSTANT DELAPAN : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
CONSTANT SEMBILAN: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";

BEGIN
PROCESS(SW)
BEGIN
CASE SW IS
   WHEN NOL      => HEX1 <= "1111110";
   WHEN SATU     => HEX1 <= "0110000";
   WHEN DUA      => HEX1 <= "1101101";
   WHEN TIGA     => HEX1 <= "1111001";
   WHEN EMPAT    => HEX1 <= "0110011";
   WHEN LIMA     => HEX1 <= "1011011";
   WHEN ENAM     => HEX1 <= "1011111";
   WHEN TUJUH    => HEX1 <= "1110000";
   WHEN DELAPAN  => HEX1 <= "1111111";
   WHEN SEMBILAN => HEX1 <= "1110011";
   WHEN OTHERS   => HEX1 <= "0000000";
END CASE;
END PROCESS;

END behavioral;