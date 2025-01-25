-- Nama         : William Anthony
-- NIM          : 13223048
-- Tanggal      : 25 Januari 2025
-- Fungsi       : Full Adder menggunakan logika AND, OR, NOT (Pendekatan Behavioral)

-- Deskripsi    : Pendekatan ini menggunakan arsitektur **Behavioral**,
--               yang berarti kita mendeskripsikan fungsionalitas
--               rangkaian tanpa menyebutkan implementasi gerbang
--               logika secara langsung. Arsitektur ini lebih 
--               fokus pada apa yang ingin dilakukan rangkaian 
--               daripada bagaimana cara implementasinya.
--               Dalam hal ini, kita mendeskripsikan bagaimana 
--               penjumlahan dilakukan secara umum menggunakan
--               dua half adder.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
    Port ( A : in  STD_LOGIC;   -- Input A
           B : in  STD_LOGIC;   -- Input B
           Cin : in  STD_LOGIC;  -- Input Carry In
           Sum : out  STD_LOGIC;  -- Output Sum (hasil penjumlahan)
           Carry : out  STD_LOGIC  -- Output Carry (hasil carry)
         );
end fullAdder;

architecture Behavioral of fullAdder is
    signal HA1_Sum, HA1_Carry, HA2_Carry : STD_LOGIC;
begin
    -- Half Adder pertama untuk A dan B
    U1: entity work.halfAdder port map (A, B, HA1_Sum, HA1_Carry);

    -- Half Adder kedua untuk Sum dan Cin
    U2: entity work.halfAdder port map (HA1_Sum, Cin, Sum, HA2_Carry);

    -- Output Carry = Carry dari Half Adder pertama atau Carry dari Half Adder kedua
    Carry <= HA1_Carry or HA2_Carry;
end Behavioral;
