-- Nama         : William Anthony 
-- NIM          : 13223048
-- Tanggal      : 20 Desember 2024
-- Fungsi       : Menambahkan dua bilangan biner menggunakan Carry Look-Ahead Adder.
-- Deskripsi Cara Kerja :
--   Carry Look-Ahead Adder mengurangi penundaan propagasi dengan menghitung carry
--   untuk semua bit secara paralel berdasarkan persamaan logika.
-- KMap Yang menjelaskan secara komentar:
--   Propagate = A ⊕ B
--   Generate = A ⋅ B
--   Carry-out = Generate(i) + (Propagate(i) ⋅ Carry(i-1))

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarryOnLookAheadAdder is
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
end CarryOnLookAheadAdder;

architecture Behavioral of CarryOnLookAheadAdder is
    signal Propagate, Generate, Carry : STD_LOGIC_VECTOR(SIZE-1 downto 0);
begin
    -- Hitung nilai propagate dan generate
    gen_logic: for i in 0 to SIZE-1 generate
        Propagate(i) <= A(i) xor B(i);
        Generate(i) <= A(i) and B(i);
    end generate;

    -- Hitung carry
    Carry(0) <= Cin;  -- Carry awal adalah Cin
    gen_carry: for i in 1 to SIZE-1 generate
        Carry(i) <= Generate(i-1) or (Propagate(i-1) and Carry(i-1));
    end generate;

    -- Hitung sum dan carry-out
    gen_sum: for i in 0 to SIZE-1 generate
        Sum(i) <= Propagate(i) xor Carry(i);
    end generate;

    Cout <= Generate(SIZE-1) or (Propagate(SIZE-1) and Carry(SIZE-1));
end Behavioral;
