-- Nama         : William Anthony
-- NIM          : 13223048
-- Tanggal      : 26 Januari 2025
-- Fungsi       : 2-bit Multiplier menggunakan K-map untuk optimasi
-- Deskripsi    : Program ini mendeskripsikan pengali 2-bit dengan menggunakan 
--               K-map untuk mendapatkan fungsi minimal bagi setiap bit output.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_2bit is
    Port ( A1, A0 : in  STD_LOGIC;    -- Input A (2-bit)
           B1, B0 : in  STD_LOGIC;    -- Input B (2-bit)
           P3, P2, P1, P0 : out  STD_LOGIC  -- Output (4-bit product)
         );
end multiplier_2bit;

architecture Behavioral of multiplier_2bit is
begin
    -- P0 = A0 AND B0
    -- Berdasarkan K-map untuk P0 (hasil perkalian antara A0 dan B0):
    --    K-map P0:
    --      A0\B0 | 0  | 1  |
    --      --------------
    --      0    | 0  | 0  |
    --      1    | 0  | 1  |
    -- Fungsi minimal untuk P0 adalah P0 = A0 AND B0.
    -- Artinya, P0 hanya akan '1' jika A0 dan B0 keduanya '1'.
    P0 <= A0 and B0;

    -- P1 = (A1 AND B0) OR (A0 AND B1)
    -- Berdasarkan K-map untuk P1 (hasil perkalian yang menghasilkan bit ke-1):
    --    K-map P1:
    --      A0\B0 | 0  | 1  |
    --      --------------
    --      0    | 0  | 1  |
    --      1    | 1  | 1  |
    -- Fungsi minimal untuk P1 adalah P1 = (A1 AND B0) OR (A0 AND B1).
    -- Artinya, P1 akan '1' jika salah satu dari dua kondisi berikut berlaku:
    -- 1. A1 = 1 dan B0 = 1, atau
    -- 2. A0 = 1 dan B1 = 1.
    P1 <= (A1 and B0) or (A0 and B1);

    -- P2 = A1 AND B1
    -- Berdasarkan K-map untuk P2 (hasil perkalian yang menghasilkan bit ke-2):
    --    K-map P2:
    --      A0\B0 | 0  | 1  |
    --      --------------
    --      0    | 0  | 0  |
    --      1    | 0  | 1  |
    -- Fungsi minimal untuk P2 adalah P2 = A1 AND B1.
    -- Artinya, P2 hanya akan '1' jika A1 dan B1 keduanya '1'.
    P2 <= A1 and B1;

    -- P3 = 0 (tidak ada carry lebih dari perkalian 2-bit)
    -- Berdasarkan K-map untuk P3, kita tidak membutuhkan carry lebih jauh.
    -- K-map untuk P3 tidak ada term yang harus dipertimbangkan, karena hasil perkalian
    -- dua angka 2-bit tidak akan menghasilkan lebih dari 4 bit.
    -- Oleh karena itu, P3 selalu '0'.
    P3 <= '0';
end Behavioral;
