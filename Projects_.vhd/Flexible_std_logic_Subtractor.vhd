-- Nama         : William Anthony 
-- NIM          : 13223048
-- Tanggal      : 21 Desember 2024
-- Fungsi       : Mengurangkan dua bilangan biner dengan ukuran bit fleksibel.
-- Deskripsi Cara Kerja :
--   Operasi pengurangan dilakukan menggunakan metode A - B = A + (~B + 1).
--   Carry-in digunakan untuk merepresentasikan bit tambahan.
-- KMap Yang menjelaskan secara komentar:
--   Operasi dasar pengurangan:
--   B_complement = ~B + 1
--   Sum = A ⊕ B_complement ⊕ Carry

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Flexible_std_logic_Subtractor is
    generic (
        SIZE : integer := 4  -- Ukuran bit default
    );
    port (
        A     : in STD_LOGIC_VECTOR(SIZE-1 downto 0);  -- Input vektor A
        B     : in STD_LOGIC_VECTOR(SIZE-1 downto 0);  -- Input vektor B
        BorrowIn : in STD_LOGIC;                      -- Borrow-in (sama dengan Cin)
        Diff  : out STD_LOGIC_VECTOR(SIZE-1 downto 0); -- Hasil pengurangan
        BorrowOut : out STD_LOGIC                     -- Borrow-out
    );
end Flexible_std_logic_Subtractor;

architecture Behavioral of Flexible_std_logic_Subtractor is
    signal B_complement : STD_LOGIC_VECTOR(SIZE-1 downto 0);
    signal temp_sum : STD_LOGIC_VECTOR(SIZE downto 0);
begin
    -- Komplement 2 dari B
    B_complement <= not B + ("0" & BorrowIn);

    -- Lakukan operasi pengurangan
    temp_sum <= ('0' & A) + B_complement;

    -- Hasil pengurangan dan borrow-out
    Diff <= temp_sum(SIZE-1 downto 0);
    BorrowOut <= temp_sum(SIZE);
end Behavioral;
