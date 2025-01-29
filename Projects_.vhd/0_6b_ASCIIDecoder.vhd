library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Nama         : William Anthony
-- NIM          : 13223048
-- Tanggal      : 29 Januari 2025
-- Fungsi       : Mengonversi kode biner 6-bit menjadi karakter ASCII.
-- Deskripsi Cara Kerja :
--   Input 6-bit diinterpretasikan sebagai indeks dalam tabel karakter ASCII.
--   Output berupa karakter ASCII yang sesuai dengan indeks tersebut.

entity ASCIIDecoder is
  Port (
    bin_in   : in  STD_LOGIC_VECTOR(5 downto 0); -- Input 6-bit
    ascii_out: out STD_LOGIC_VECTOR(7 downto 0)  -- Output 8-bit ASCII
  );
end ASCIIDecoder;

architecture Behavioral of ASCIIDecoder is
begin
  process (bin_in)
  begin
    case bin_in is
      when "000000" => ascii_out <= X"20"; -- ' '
      when "000001" => ascii_out <= X"21"; -- '!'
      when "000010" => ascii_out <= X"22"; -- '"'
      when "000011" => ascii_out <= X"23"; -- '#'
      when "000100" => ascii_out <= X"24"; -- '$'
      when "000101" => ascii_out <= X"25"; -- '%'
      when "000110" => ascii_out <= X"26"; -- '&'
      when "000111" => ascii_out <= X"27"; -- "'"
      when "001000" => ascii_out <= X"28"; -- '('
      when "001001" => ascii_out <= X"29"; -- ')'
      when "001010" => ascii_out <= X"2A"; -- '*'
      when "001011" => ascii_out <= X"2B"; -- '+'
      when "001100" => ascii_out <= X"2C"; -- ','
      when "001101" => ascii_out <= X"2D"; -- '-'
      when "001110" => ascii_out <= X"2E"; -- '.'
      when "001111" => ascii_out <= X"2F"; -- '/'
      when "010000" => ascii_out <= X"30"; -- '0'
      when "010001" => ascii_out <= X"31"; -- '1'
      when "010010" => ascii_out <= X"32"; -- '2'
      when "010011" => ascii_out <= X"33"; -- '3'
      when "010100" => ascii_out <= X"34"; -- '4'
      when "010101" => ascii_out <= X"35"; -- '5'
      when "010110" => ascii_out <= X"36"; -- '6'
      when "010111" => ascii_out <= X"37"; -- '7'
      when "011000" => ascii_out <= X"38"; -- '8'
      when "011001" => ascii_out <= X"39"; -- '9'
      when "011010" => ascii_out <= X"3A"; -- ':'
      when "011011" => ascii_out <= X"3B"; -- ';'
      when "011100" => ascii_out <= X"3C"; -- '<'
      when "011101" => ascii_out <= X"3D"; -- '='
      when "011110" => ascii_out <= X"3E"; -- '>'
      when "011111" => ascii_out <= X"3F"; -- '?'
      when "100000" => ascii_out <= X"40"; -- '@'
      when "100001" => ascii_out <= X"41"; -- 'A'
      when "100010" => ascii_out <= X"42"; -- 'B'
      when "100011" => ascii_out <= X"43"; -- 'C'
      when "100100" => ascii_out <= X"44"; -- 'D'
      when "100101" => ascii_out <= X"45"; -- 'E'
      when "100110" => ascii_out <= X"46"; -- 'F'
      when "100111" => ascii_out <= X"47"; -- 'G'
      when "101000" => ascii_out <= X"48"; -- 'H'
      when "101001" => ascii_out <= X"49"; -- 'I'
      when "101010" => ascii_out <= X"4A"; -- 'J'
      when "101011" => ascii_out <= X"4B"; -- 'K'
      when "101100" => ascii_out <= X"4C"; -- 'L'
      when "101101" => ascii_out <= X"4D"; -- 'M'
      when "101110" => ascii_out <= X"4E"; -- 'N'
      when "101111" => ascii_out <= X"4F"; -- 'O'
      when "110000" => ascii_out <= X"50"; -- 'P'
      when "110001" => ascii_out <= X"51"; -- 'Q'
      when "110010" => ascii_out <= X"52"; -- 'R'
      when "110011" => ascii_out <= X"53"; -- 'S'
      when "110100" => ascii_out <= X"54"; -- 'T'
      when "110101" => ascii_out <= X"55"; -- 'U'
      when "110110" => ascii_out <= X"56"; -- 'V'
      when "110111" => ascii_out <= X"57"; -- 'W'
      when "111000" => ascii_out <= X"58"; -- 'X'
      when "111001" => ascii_out <= X"59"; -- 'Y'
      when "111010" => ascii_out <= X"5A"; -- 'Z'
      when others   => ascii_out <= X"3F"; -- '?' untuk input tidak dikenal
    end case;
  end process;
end Behavioral;
