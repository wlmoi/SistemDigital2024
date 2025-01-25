-- Nama         : William Anthony
-- NIM          : 13223048
-- Tanggal      : 25 Januari 2025
-- Fungsi       : Subtractor menggunakan logika NAND dan NOR
-- Deskripsi    : Pendekatan ini membuat subtractor dengan menggunakan logika NAND dan NOR
--               dan mendeskripsikan K-map untuk menghasilkan fungsi yang optimal.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtractor_optimum is
    Port ( A : in  STD_LOGIC;  -- Input A
           B : in  STD_LOGIC;  -- Input B
           Borrow_in : in  STD_LOGIC;  -- Input Borrow In
           Difference : out  STD_LOGIC;  -- Output Difference (hasil pengurangan)
           Borrow_out : out  STD_LOGIC  -- Output Borrow Out (hasil pinjaman)
         );
end subtractor_optimum;

architecture Behavioral of subtractor_optimum is
    -- K-map untuk Difference (D) dan Borrow Out (B):
    -- Untuk Difference:
    -- K-map untuk D (A, B, Borrow_in):
    --
    --    B \ A | 0 | 1
    --  ------------ 
    --   0      | 0 | 1
    --   1      | 1 | 0
    -- 
    -- Fungsi minimal untuk Difference:
    -- D = A XOR B XOR Borrow_in

    -- Untuk Borrow Out:
    -- K-map untuk Borrow_out (B_out):
    --
    --    B \ A | 0 | 1
    --  ------------ 
    --   0      | 0 | 0
    --   1      | 1 | 1
    --   Borrow_in | 1
    --
    -- Fungsi minimal untuk Borrow Out:
    -- Borrow_out = (B AND NOT A) OR (Borrow_in AND (A XOR B))

    signal XOR_AB, XOR_AB_Borrow : STD_LOGIC;
begin
    -- Difference = A XOR B XOR Borrow_in (menggunakan XOR dan NAND untuk implementasi optimal)
    XOR_AB <= A xor B;  -- XOR antara A dan B
    Difference <= XOR_AB xor Borrow_in;  -- XOR antara hasil XOR sebelumnya dan Borrow_in

    -- Borrow_out = (B AND NOT A) OR (Borrow_in AND (A XOR B))
    Borrow_out <= (B and not A) or (Borrow_in and XOR_AB);
end Behavioral;
