-- Nama         : William Anthony
-- NIM          : 13223048
-- Tanggal      : 5 Februari 2025 
-- Fungsi       : PWM Controller
-- Deskripsi    : Program ini mendeskripsikan modul PWM yang menghasilkan sinyal PWM
--                berdasarkan nilai duty cycle yang diinputkan. Sinyal PWM ini dapat digunakan 
--                untuk mengatur kecerahan LED atau mengendalikan kecepatan motor.
-- KMAP         :

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY PWM_Controller IS
    PORT (
        clk        : IN  STD_LOGIC;                           -- Sinyal clock
        reset      : IN  STD_LOGIC;                           -- Sinyal reset asinkron
        duty_cycle : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);          -- Duty cycle (0-255)
        pwm_out    : OUT STD_LOGIC                          -- Sinyal PWM keluar
    );
END PWM_Controller;

ARCHITECTURE Behavioral OF PWM_Controller IS
    -- Counter 8-bit untuk menghasilkan periode PWM (0 sampai 255)
    SIGNAL counter : UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
    -- Konversi duty_cycle dari STD_LOGIC_VECTOR ke UNSIGNED
    SIGNAL duty    : UNSIGNED(7 DOWNTO 0);
BEGIN
    duty <= UNSIGNED(duty_cycle);

    PROCESS(clk, reset)
    BEGIN
        IF reset = '1' THEN
            counter <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            -- Jika counter mencapai nilai maksimum, reset ke 0
            IF counter = x"FF" THEN
                counter <= (OTHERS => '0');
            ELSE
                counter <= counter + 1;
            END IF;
        END IF;
    END PROCESS;
    
    -- Sinyal PWM aktif ('1') selama counter kurang dari nilai duty
    pwm_out <= '1' WHEN counter < duty ELSE '0';
END Behavioral;
