-- Nama         : William Anthony
-- NIM          : 13223048
-- Tanggal      : 5 Februari 2025 
-- Fungsi       : Digital Clock dengan FSM dan Clock Divider
-- Deskripsi    : Program ini mendeskripsikan sebuah digital clock yang menghitung
--                siklus jam (detik, menit, jam) menggunakan finite state machine (FSM).
--                Clock divider digunakan untuk memperlambat sinyal clock sehingga
--                perhitungan waktu (1 Hz) dapat terlihat dengan jelas.
-- KMAP         :

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Digital_Clock IS
    PORT (
        clk         : IN  STD_LOGIC;                  -- Clock input (misal 50MHz)
        reset       : IN  STD_LOGIC;                  -- Reset asinkron
        hour_out    : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);  -- Jam (0 - 23), 5-bit
        minute_out  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);  -- Menit (0 - 59), 6-bit
        second_out  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)   -- Detik (0 - 59), 6-bit
    );
END Digital_Clock;

ARCHITECTURE Behavioral OF Digital_Clock IS

    -- Clock divider: diasumsikan clk_in = 50MHz, maka untuk 1Hz:
    CONSTANT DIV_COUNT : INTEGER := 50000000 - 1;
    SIGNAL div_counter : INTEGER RANGE 0 TO DIV_COUNT := 0;
    SIGNAL slow_clk    : STD_LOGIC := '0';

    -- Definisi FSM state untuk penghitungan waktu
    TYPE state_type IS (S_WAIT, S_INC_SEC, S_INC_MIN, S_INC_HR);
    SIGNAL state : state_type := S_WAIT;

    -- Counter untuk waktu
    SIGNAL second_cnt : INTEGER RANGE 0 TO 59 := 0;
    SIGNAL minute_cnt : INTEGER RANGE 0 TO 59 := 0;
    SIGNAL hour_cnt   : INTEGER RANGE 0 TO 23 := 0;

BEGIN
    -----------------------------------------------------
    -- Clock Divider: Menghasilkan slow_clk (1 Hz) dari clk
    -----------------------------------------------------
    process(clk, reset)
    begin
        if reset = '1' then
            div_counter <= 0;
            slow_clk    <= '0';
        elsif rising_edge(clk) then
            if div_counter = DIV_COUNT then
                div_counter <= 0;
                slow_clk    <= NOT slow_clk;  -- Toggle slow clock tiap DIV_COUNT
            else
                div_counter <= div_counter + 1;
            end if;
        end if;
    end process;

    -----------------------------------------------------
    -- FSM untuk Update Waktu (detik, menit, jam)
    -----------------------------------------------------
    process(slow_clk, reset)
    begin
        if reset = '1' then
            state      <= S_WAIT;
            second_cnt <= 0;
            minute_cnt <= 0;
            hour_cnt   <= 0;
        elsif rising_edge(slow_clk) then
            case state is
                when S_WAIT =>
                    -- Pada tiap slow_clk, pindah ke state increment detik
                    state <= S_INC_SEC;
                    
                when S_INC_SEC =>
                    if second_cnt = 59 then
                        second_cnt <= 0;
                        state <= S_INC_MIN;
                    else
                        second_cnt <= second_cnt + 1;
                        state <= S_WAIT;
                    end if;
                    
                when S_INC_MIN =>
                    if minute_cnt = 59 then
                        minute_cnt <= 0;
                        state <= S_INC_HR;
                    else
                        minute_cnt <= minute_cnt + 1;
                        state <= S_WAIT;
                    end if;
                    
                when S_INC_HR =>
                    if hour_cnt = 23 then
                        hour_cnt <= 0;
                    else
                        hour_cnt <= hour_cnt + 1;
                    end if;
                    state <= S_WAIT;
                    
                when others =>
                    state <= S_WAIT;
            end case;
        end if;
    end process;

    -----------------------------------------------------
    -- Menghubungkan output dengan counter yang ada
    -----------------------------------------------------
    hour_out   <= STD_LOGIC_VECTOR(to_unsigned(hour_cnt, hour_out'length));
    minute_out <= STD_LOGIC_VECTOR(to_unsigned(minute_cnt, minute_out'length));
    second_out <= STD_LOGIC_VECTOR(to_unsigned(second_cnt, second_out'length));

END Behavioral;
