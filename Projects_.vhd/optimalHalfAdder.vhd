-- Nama         : William Anthony
-- NIM          : 13223048
-- Tanggal      : 25 Januari 2025
-- Fungsi       : Half Adder menggunakan logika NAND, NOR

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfAdder_NAND_NOR is
    Port ( A : in  STD_LOGIC;   -- Input A
           B : in  STD_LOGIC;   -- Input B
           Sum : out  STD_LOGIC;  -- Output Sum (hasil penjumlahan)
           Carry : out  STD_LOGIC  -- Output Carry (hasil carry)
         );
end halfAdder_NAND_NOR;

architecture Behavioral of halfAdder_NAND_NOR is
    signal nandAB, nandA_B, norA_B : STD_LOGIC;
begin
    -- Sum = (A NAND B) NAND (A NAND B)
    nandAB <= A nand B;  -- NAND gate untuk A dan B
    Sum <= nandAB nand nandAB;  -- Sum = NAND dari hasil NAND

    -- Carry = A NAND B (NAND gate langsung sebagai Carry)
    Carry <= nandAB;
end Behavioral;
