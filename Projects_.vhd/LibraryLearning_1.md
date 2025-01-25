# LibraryLearning_1.vhd

### Deskripsi
Program ini mendemonstrasikan penggunaan library **IEEE** dan package **STD_LOGIC_1164** pada VHDL.  
Library **IEEE** berisi pustaka standar yang digunakan untuk mendeskripsikan logika digital dalam VHDL.  
Package **STD_LOGIC_1164** adalah bagian dari library **IEEE** yang menyediakan tipe data dan operasi standar untuk menangani sinyal digital seperti bit dan vektor.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- Menggunakan semua definisi dari package STD_LOGIC_1164

-- Entity deklarasi untuk contoh penggunaan sinyal digital
entity LibraryLearning_1 is
    Port ( A, B : in STD_LOGIC;   -- Input sinyal digital A dan B
           C : out STD_LOGIC      -- Output sinyal digital C
         );
end LibraryLearning_1;

-- Architecture untuk mendefinisikan perilaku logika
architecture Behavioral of LibraryLearning_1 is
begin
    -- Deskripsi logika dasar: C adalah hasil AND antara A dan B
    C <= A and B;  -- C akan '1' jika A dan B keduanya '1', selain itu C akan '0'
end Behavioral;
