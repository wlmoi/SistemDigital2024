-- Nama         : William Anthony
-- NIM          : 13223048
-- Tanggal      : 25 Januari 2025
-- Fungsi       : Half Adder menggunakan logika AND, OR, NOT

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfAdder is
    Port ( A : in  STD_LOGIC;   -- Input A
           B : in  STD_LOGIC;   -- Input B
           Sum : out  STD_LOGIC;  -- Output Sum (hasil penjumlahan)
           Carry : out  STD_LOGIC  -- Output Carry (hasil carry)
         );
end halfAdder;

architecture Behavioral of halfAdder is
begin
    -- Sum = A XOR B (Dapat dihasilkan dengan AND, OR, NOT)
    Sum <= (A and not B) or (not A and B);

    -- Carry = A AND B
    Carry <= A and B;
end Behavioral;
