-- Nama         : William Anthony 
-- NIM          : 13223048
-- Tanggal      : 20 Desember 2024
-- Fungsi       : Menambahkan dua bilangan biner menggunakan metode Ripple Carry Adder.
-- Deskripsi Cara Kerja :
--   Ripple Carry Adder menjumlahkan dua bilangan biner bit-per-bit dari LSB ke MSB.
--   Carry dari bit sebelumnya (Cin) diteruskan ke bit berikutnya hingga MSB.
-- KMap Yang menjelaskan secara komentar:
--   Operasi dasar Full Adder (FA):
--   Sum = A ⊕ B ⊕ Cin
--   Cout = (A ⋅ B) + (Cin ⋅ (A ⊕ B))

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rippleCarryAdder is
    generic (
        SIZE : integer := 4  -- Ukuran bit default
    );
    port (
        A     : in STD_LOGIC_VECTOR(SIZE-1 downto 0);  -- Input vektor A
        B     : in STD_LOGIC_VECTOR(SIZE-1 downto 0);  -- Input vektor B
        Cin   : in STD_LOGIC;                          -- Carry-in
        Sum   : out STD_LOGIC_VECTOR(SIZE-1 downto 0); -- Hasil penjumlahan
        Cout  : out STD_LOGIC                          -- Carry-out
    );
end rippleCarryAdder;

architecture Behavioral of rippleCarryAdder is
    signal Carry : STD_LOGIC_VECTOR(SIZE downto 0);  -- Sinyal carry antar bit
begin
    Carry(0) <= Cin;  -- Carry awal adalah Cin

    -- Proses Ripple Carry Adder untuk setiap bit
    gen_ripple: for i in 0 to SIZE-1 generate
        Sum(i) <= A(i) xor B(i) xor Carry(i);
        Carry(i+1) <= (A(i) and B(i)) or (Carry(i) and (A(i) xor B(i)));
    end generate;

    Cout <= Carry(SIZE);  -- Carry-out dari MSB
end Behavioral;
