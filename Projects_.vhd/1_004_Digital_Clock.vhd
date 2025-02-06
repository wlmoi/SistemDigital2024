-- Nama         : William Anthony
-- NIM          : 13223048
-- Tanggal      : 5 Februari 2025 
-- Fungsi       : Digital Clock dengan FSM, Clock Divider, dan UNSIGNED
-- Deskripsi    : Program ini mendeskripsikan sebuah digital clock yang menghitung siklus waktu
--                (detik, menit, jam) menggunakan finite state machine (FSM). Clock divider
--                digunakan untuk menghasilkan sinyal clock lambat (1 Hz) dari input clock (misal 50MHz).
--                Perhitungan waktu dilakukan dengan menggunakan tipe data UNSIGNED.
-- KMAP         :

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Digital_Clock IS
    PORT (
        clk         : IN  STD_LOGIC;                  -- Clock input (misal 50MHz)
        reset       : IN  STD_LOGIC;                  -- Reset asinkron
        hour_out    : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);  -- Jam (0 - 23) : 5-bit
        minute_out  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);  -- Menit (0 - 59) : 6-bit
        second_out  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)   -- Detik (0 - 59) : 6-bit
    );
END Digital_Clock;

ARCHITECTURE Behavioral OF Digital_Clock IS

    -- Clock Divider: diasumsikan clk = 50MHz, untuk menghasilkan 1 Hz:
    CONSTANT DIV_COUNT : INTEGER := 50000000 - 1;
    SIGNAL div_counter : UNSIGNED(25 DOWNTO 0) := (OTHERS => '0');  -- 26-bit untuk menghitung hingga 50 juta
    SIGNAL slow_clk    : STD_LOGIC := '0';

    -- Definisi FSM state untuk penghitungan waktu
    TYPE state_type IS (S_WAIT, S_INC_SEC, S_INC_MIN, S_INC_HR);
    SIGNAL state : state_type := S_WAIT;

    -- Counter untuk waktu menggunakan tipe UNSIGNED
    SIGNAL second_cnt : UNSIGNED(5 DOWNTO 0) := (OTHERS => '0');  -- 6-bit: 0 - 59
    SIGNAL minute_cnt : UNSIGNED(5 DOWNTO 0) := (OTHERS => '0');  -- 6-bit: 0 - 59
    SIGNAL hour_cnt   : UNSIGNED(4 DOWNTO 0) := (OTHERS => '0');  -- 5-bit: 0 - 23

BEGIN
    ------------------------------------------------------------------
    -- Clock Divider Process: Menghasilkan slow_clk (1 Hz) dari clk
    ------------------------------------------------------------------
    PROCESS(clk, reset)
    BEGIN
        IF reset = '1' THEN
            div_counter <= (OTHERS => '0');
            slow_clk    <= '0';
        ELSIF rising_edge(clk) THEN
            IF div_counter = TO_UNSIGNED(DIV_COUNT, div_counter'length) THEN
                div_counter <= (OTHERS => '0');
                slow_clk    <= NOT slow_clk;  -- Toggle slow_clk setiap kali mencapai DIV_COUNT
            ELSE
                div_counter <= div_counter + 1;
            END IF;
        END IF;
    END PROCESS;

    ------------------------------------------------------------------
    -- FSM Process: Mengupdate nilai detik, menit, dan jam
    ------------------------------------------------------------------
    PROCESS(slow_clk, reset)
    BEGIN
        IF reset = '1' THEN
            state      <= S_WAIT;
            second_cnt <= (OTHERS => '0');
            minute_cnt <= (OTHERS => '0');
            hour_cnt   <= (OTHERS => '0');
        ELSIF rising_edge(slow_clk) THEN
            CASE state IS
                WHEN S_WAIT =>
                    -- Setiap tick slow_clk, pindah ke state increment detik
                    state <= S_INC_SEC;
                    
                WHEN S_INC_SEC =>
                    IF second_cnt = TO_UNSIGNED(59, second_cnt'length) THEN
                        second_cnt <= (OTHERS => '0');
                        state <= S_INC_MIN;
                    ELSE
                        second_cnt <= second_cnt + 1;
                        state <= S_WAIT;
                    END IF;
                    
                WHEN S_INC_MIN =>
                    IF minute_cnt = TO_UNSIGNED(59, minute_cnt'length) THEN
                        minute_cnt <= (OTHERS => '0');
                        state <= S_INC_HR;
                    ELSE
                        minute_cnt <= minute_cnt + 1;
                        state <= S_WAIT;
                    END IF;
                    
                WHEN S_INC_HR =>
                    IF hour_cnt = TO_UNSIGNED(23, hour_cnt'length) THEN
                        hour_cnt <= (OTHERS => '0');
                    ELSE
                        hour_cnt <= hour_cnt + 1;
                    END IF;
                    state <= S_WAIT;
                    
                WHEN OTHERS =>
                    state <= S_WAIT;
            END CASE;
        END IF;
    END PROCESS;

    -- Konversi nilai UNSIGNED ke STD_LOGIC_VECTOR untuk output
    hour_out   <= STD_LOGIC_VECTOR(hour_cnt);
    minute_out <= STD_LOGIC_VECTOR(minute_cnt);
    second_out <= STD_LOGIC_VECTOR(second_cnt);

END Behavioral;
