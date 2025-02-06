-- Nama         : William Anthony
-- NIM          : 13223048
-- Tanggal      : 5 Februari 2025 
-- Fungsi       : Menggerakkan cahaya LED secara bergantian (LED Chaser)
-- Deskripsi    : Program ini mendeskripsikan LED Chaser yang mengaktifkan LED secara bergantian
--                dari bit 0 sampai bit 7 dan kembali lagi ke awal. Setiap pergeseran terjadi 
--                berdasarkan hitungan waktu tertentu.
-- KMAP         :

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY LED_Chaser IS
    PORT (
        clk   : IN  STD_LOGIC;                          -- Sinyal clock
        reset : IN  STD_LOGIC;                          -- Sinyal reset asinkron
        led   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)        -- Deretan LED (8 LED)
    );
END LED_Chaser;

ARCHITECTURE Behavioral OF LED_Chaser IS
    -- Shift register untuk LED dengan pola awal "00000001"
    SIGNAL shift_reg : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";
    -- Counter untuk menghasilkan delay agar pergeseran LED dapat terlihat
    SIGNAL counter   : INTEGER := 0;
    -- Konstanta untuk menentukan periode delay (misal: 1 detik dengan clock 50MHz)
    CONSTANT MAX_COUNT : INTEGER := 50000000 - 1;
BEGIN
    PROCESS(clk, reset)
    BEGIN
        IF reset = '1' THEN
            -- Inisialisasi ulang shift register dan counter saat reset aktif
            shift_reg <= "00000001";
            counter   <= 0;
        ELSIF rising_edge(clk) THEN
            IF counter = MAX_COUNT THEN
                counter <= 0;
                -- Pergeseran LED: bit MSB dipindahkan ke LSB (rotasi)
                shift_reg <= shift_reg(6 DOWNTO 0) & shift_reg(7);
            ELSE
                counter <= counter + 1;
            END IF;
        END IF;
    END PROCESS;
    
    -- Keluaran LED disambungkan dengan shift register
    led <= shift_reg;
END Behavioral;
