library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;  -- Untuk operasi aritmatika
use IEEE.STD_LOGIC_UNSIGNED.ALL;  -- Untuk operasi aritmatika unsigned

--- WILLIAM ANTHONY 13223048

-- Entity deklarasi untuk Full Adder dengan ukuran bit yang dapat diatur secara generic
entity W_FullAdder is
    generic (
        SIZE : integer := 4  -- Ukuran bit default adalah 4
    );
    port (
        A     : in STD_LOGIC_VECTOR(SIZE-1 downto 0);  -- Input vektor A
        B     : in STD_LOGIC_VECTOR(SIZE-1 downto 0);  -- Input vektor B
        Cin   : in STD_LOGIC;                          -- Carry-in
        Sum   : out STD_LOGIC_VECTOR(SIZE-1 downto 0); -- Output hasil penjumlahan
        Cout  : out STD_LOGIC                          -- Carry-out
    );
end W_FullAdder;

-- Architecture untuk mendefinisikan perilaku Full Adder
architecture Behavioral of W_FullAdder is
    signal temp_sum : STD_LOGIC_VECTOR(SIZE downto 0);  -- Sinyal sementara untuk penjumlahan
begin
    process (A, B, Cin)
    begin
        -- Penjumlahan dengan carry menggunakan ukuran bit generic
        temp_sum <= ('0' & A) + ('0' & B) + Cin;  
        Sum <= temp_sum(SIZE-1 downto 0);  -- Hasil penjumlahan
        Cout <= temp_sum(SIZE);           -- Carry-out dari bit paling signifikan
    end process;
end Behavioral;
