-- Library IEEE digunakan untuk mengakses komponen-komponen logika digital
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entity CarryLookAheadAdder adalah komponen yang melakukan penjumlahan dua bilangan biner
ENTITY CarryLookAheadAdder IS
    -- Generic width digunakan untuk menentukan panjang bit dari input dan output
    GENERIC(width : integer := 8);
    PORT
        (
         -- x_in dan y_in adalah input bilangan biner yang akan dijumlahkan
         x_in      :  IN   STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
         y_in      :  IN   STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
         -- carry_in adalah input carry yang akan digunakan dalam penjumlahan
         carry_in  :  IN   STD_LOGIC;
         -- sum adalah output hasil penjumlahan
         sum       :  OUT  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
         -- carry_out adalah output carry yang dihasilkan dari penjumlahan
         carry_out :  OUT  STD_LOGIC
        );
END CarryLookAheadAdder;

-- Arsitektur behavioral adalah implementasi dari entity CarryLookAheadAdder
ARCHITECTURE behavioral OF CarryLookAheadAdder IS

-- Signal temp_sum, carry_g, dan carry_p digunakan untuk menyimpan hasil sementara dari penjumlahan
SIGNAL    temp_sum, carry_g, carry_p	:    STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
-- Signal temp_carry_in digunakan untuk menyimpan carry yang dihasilkan dari penjumlahan
SIGNAL    temp_carry_in  		:    STD_LOGIC_VECTOR(width - 1 DOWNTO 1);

BEGIN

    -- temp_sum adalah hasil XOR dari x_in dan y_in
    temp_sum 	<= x_in XOR y_in;
    -- carry_g adalah hasil AND dari x_in dan y_in
    carry_g 	<= x_in AND y_in;
    -- carry_p adalah hasil OR dari x_in dan y_in
    carry_p 	<= x_in OR y_in;

    -- Proses ini digunakan untuk menghitung carry yang dihasilkan dari penjumlahan
    PROCESS (carry_g, carry_p, temp_carry_in)
    BEGIN
    	-- temp_carry_in(1) adalah carry yang dihasilkan dari bit pertama
    	temp_carry_in(1) <= carry_g(0) OR (carry_p(0) AND carry_in);

        -- Loop ini digunakan untuk menghitung carry yang dihasilkan dari bit-bit berikutnya
        ForLoop: FOR k IN 1 TO width - 2 LOOP
              	-- temp_carry_in(k + 1) adalah carry yang dihasilkan dari bit ke-k
              		temp_carry_in(k + 1) <= carry_g(k) OR (carry_p(k) AND temp_carry_in(k));
              	 END LOOP;

    	-- carry_out adalah carry yang dihasilkan dari bit terakhir
    	carry_out <= carry_g(width - 1) OR (carry_p(width - 1) AND temp_carry_in(width - 1));
    END PROCESS;

    -- sum(0) adalah hasil penjumlahan dari bit pertama
    sum(0) 			<= temp_sum(0) XOR carry_in;
    -- sum(width - 1 DOWNTO 1) adalah hasil penjumlahan dari bit-bit berikutnya
    sum(width - 1 DOWNTO 1) 	<= temp_sum(width - 1 DOWNTO 1) XOR temp_carry_in(width - 1 DOWNTO 1);

END behavioral;

-- Alur kerja dari CarryLookAheadAdder adalah sebagai berikut:
-- 1. Input x_in dan y_in di-XOR-kan untuk mendapatkan temp_sum.
-- 2. Input x_in dan y_in di-AND-kan untuk mendapatkan carry_g.
-- 3. Input x_in dan y_in di-OR-kan untuk mendapatkan carry_p.
-- 4. Carry yang dihasilkan dari penjumlahan dihitung menggunakan proses yang melibatkan carry_g, carry_p, dan temp_carry_in.
-- 5. Hasil penjumlahan dihitung menggunakan temp_sum dan temp_carry_in.
-- 6. Carry yang dihasilkan dari penjumlahan dioutputkan sebagai carry_out.
-- 7. Hasil penjumlahan dioutputkan sebagai sum.
